CREATE PROCEDURE GetStudents
@Id INT = 0
AS
BEGIN
	IF(@Id > 0)
	BEGIN
		SELECT * FROM [dbo].[Students] WHERE StudentID = @Id
	END
	ELSE
	BEGIN
		SELECT * FROM [dbo].[Students]
	END
END
GO

CREATE PROCEDURE GetDepartments
AS
BEGIN
	SELECT * FROM [dbo].[Departments]
END

CREATE PROCEDURE GetCourses
@DepartmentID INT = 0
AS
BEGIN
	SELECT * FROM [dbo].[Courses] WHERE DepartmentID = CASE WHEN @DepartmentID = 0 THEN DepartmentID ELSE @DepartmentID END
END

CREATE PROCEDURE AddORUpdateStudent (
@Id INT = 0,
@LastName VARCHAR(50),
@FirstMidName VARCHAR(50))
AS
BEGIN
	IF(@Id > 0)
	BEGIN
		UPDATE [dbo].Students SET LastName = @LastName, FirstMidName = @FirstMidName WHERE StudentID = @Id
	END
	ELSE	
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM [dbo].Students WHERE LastName = @LastName AND FirstMidName = @FirstMidName)
		BEGIN
			INSERT INTO [dbo].Students (LastName, FirstMidName, EnrollmentDate)
			VALUES (@LastName, @FirstMidName, GETDATE())
		END
	END
END
GO

CREATE PROCEDURE DeleteStudent 
@Id INT
AS
BEGIN
	IF(@Id > 0)
	BEGIN
		DELETE FROM [dbo].Students WHERE StudentID = @Id
	END
END

ALTER PROCEDURE GetCourseANDStudents 
@CourseID INT = 0,
@StudentID INT = 0
AS
BEGIN
	SELECT b.*, c.*, a.*, d.* 
	FROM [dbo].[Enrollments] a 
	inner join [dbo].[Students] b on 
		a.StudentID = b.StudentID
	inner join [dbo].[Courses] c on 
		a.[CourseID] = c.[CourseID]
	inner join [dbo].[Departments] d on
		c.DepartmentID = d.DepartmentID
	AND (a.[CourseID] = CASE When @CourseID = -1 THEN a.[CourseID] ELSE @CourseID END
		OR a.StudentID = CASE When @StudentID = -1 THEN a.StudentID ELSE @StudentID END)
END

CREATE PROCEDURE DeleteEnrollment 
@EnrollmentId INT
AS
BEGIN
	DELETE FROM [dbo].[Enrollments] WHERE [EnrollmentID] = @EnrollmentId
END

CREATE PROCEDURE AddEnrollment 
@CourseID INT,
@StudentID INT,
@Grade INT
AS
BEGIN
	IF NOT EXISTS(SELECT 1 FROM [dbo].[Enrollments] WHERE CourseID = @CourseID AND StudentID = @StudentID)
	BEGIN
		INSERT INTO [dbo].Enrollments (CourseID, StudentID, Grade)
		VALUES (@CourseID, @StudentID, @Grade)
	END
END
