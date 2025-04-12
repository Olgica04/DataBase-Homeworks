use SEDCHome

DECLARE @FirstName nvarchar (50)
SET @FirstName = 'Antonio'

SELECT * FROM Student
WHERE FirstName = @FirstName
GO

DECLARE @FemaleStudents TABLE (StudentId int, StudentName nvarchar (50), DateOfBirth date)
INSERT INTO  @FemaleStudents(StudentId,StudentName,DateOfBirth)
SELECT Id,FirstName,DateOfBirth
FROM Student
WHERE Gender = 'F'

SELECT * FROM @FemaleStudents
GO

CREATE TABLE #MaleStudents (StudentId int, StudentLastName nvarchar(50), EnrolledDate date)
INSERT INTO #MaleStudents (StudentId, StudentLastName, EnrolledDate)
SELECT Id,LastName,EnrolledDate
FROM Student
WHERE Gender = 'M' AND FirstName like 'A%'

SELECT * FROM #MaleStudents
GO

SELECT * FROM #MaleStudents
WHERE LEN(StudentLastName)=7
GO

SELECT 
	FirstName,
	LastName,
		LEN (FirstName)as FirstNameLength,
		LEFT(FirstName,3) as First3FirstName,
		LEFT(LastName,3) as First3LastName
FROM dbo.Teacher
	WHERE 
		LEN(FirstName) < 5 and
		LEFT(FirstName,3) = LEFT(LastName,3)
GO


	


