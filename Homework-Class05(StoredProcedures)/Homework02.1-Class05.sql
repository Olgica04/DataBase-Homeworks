use SEDCHome

CREATE OR ALTER PROCEDURE dbo.CreateGrade
(
	@StudentID INT,
    @CourseID INT,
    @TeacherID INT,
    @Grade INT,
    @Comment NVARCHAR(100),
    @CreatedDate DATE
)
AS 
BEGIN
	INSERT INTO dbo.Grade (StudentId, CourseId, TeacherId,Grade,Comment,CreatedDate)
	VALUES (@StudentID,@CourseID,@TeacherID,@Grade,@Comment,@CreatedDate)

	SELECT COUNT(*) AS TotalGrades
	FROM dbo.Grade
	WHERE StudentId=@StudentID

	SELECT 
    MAX(Grade) AS MaxGrade
    FROM dbo.Grade
    WHERE StudentId = @StudentID
    AND TeacherId = @TeacherID;

END
go

EXEC dbo.CreateGrade 
    @StudentID = 2,
    @CourseID = 3,
    @TeacherID = 4,
    @Grade = 8,
    @Comment = 'Well done!',
    @CreatedDate = '2025-04-13'