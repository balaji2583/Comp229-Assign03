using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Courses.DataAccess
{
    public class SQLDataAccess
    {
        public static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            }
        }

        public static DataTable GetDataTable(string commandText, CommandType type, SqlParameter[] parameters = null)
        {
            DataTable table = new DataTable();
            SqlConnection connection = null;
            SqlCommand command = null;
            SqlDataAdapter adapter = null;
            try
            {
                connection = new SqlConnection(ConnectionString);
                command = new SqlCommand(commandText, connection);
                command.CommandType = type;
                if (parameters != null)
                {
                    command.Parameters.AddRange(parameters);
                }
                adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (connection != null)
                {
                    connection.Close();
                    connection.Dispose();
                }
                if (command != null)
                {
                    command.Parameters.Clear();
                    command.Dispose();
                }
                if (adapter != null)
                {
                    adapter.Dispose();
                }
            }
            return table;
        }

        public static DataTable GetDataTable(string commandText, SqlParameter[] parameters = null)
        {
            return GetDataTable(commandText, CommandType.StoredProcedure, parameters);
        }

        public static int ExecuteNonQuery(string commandText, CommandType type, SqlParameter[] parameters = null)
        {
            int rowsAfftected = 0;
            SqlConnection connection = null;
            SqlCommand command = null;
            try
            {
                connection = new SqlConnection(ConnectionString);
                command = new SqlCommand(commandText, connection);
                command.CommandType = type;
                if (parameters != null)
                {
                    command.Parameters.AddRange(parameters);
                }
                connection.Open();
                rowsAfftected = command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (connection != null)
                {
                    connection.Close();
                    connection.Dispose();
                }
                if (command != null)
                    command.Dispose();
            }
            return rowsAfftected;
        }

        public static int ExecuteNonQuery(string commandText, SqlParameter[] parameters = null)
        {
            return ExecuteNonQuery(commandText, CommandType.StoredProcedure, parameters);
        }

        //public object ExecuteScalar(IDbCommand command, bool isTransaction)
        //{
        //    object retObject = null;
        //    IDbConnection connection = null;
        //    IDbTransaction transaction = null;
        //    try
        //    {
        //        connection = GetConnection();
        //        connection.Open();
        //        if (isTransaction)
        //        {
        //            transaction = BeginTransaction(connection);
        //            command.Transaction = transaction;
        //        }
        //        command.Connection = connection;
        //        retObject = command.ExecuteScalar();
        //        CommitTransaction(transaction);
        //    }
        //    catch (Exception ex)
        //    {
        //        RollbackTransaction(transaction);
        //        throw ex;
        //    }
        //    finally
        //    {
        //        if (connection != null)
        //        {
        //            connection.Close();
        //            connection.Dispose();
        //        }
        //        if (command != null)
        //        {
        //            command.Parameters.Clear();
        //            command.Dispose();
        //        }
        //        if (transaction != null)
        //            transaction.Dispose();
        //    }
        //    return retObject;
        //}
    }
}