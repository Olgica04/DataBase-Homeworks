use SEDCHome

SELECT TeacherId, SUM(Grade) as TotalGrades
FROM Grade
GROUP BY TeacherId
GO

SELECT TeacherId, SUM(Grade) as TotalGrades
FROM Grade
WHERE StudentID < 100
GROUP BY TeacherID 
ORDER BY TeacherId
GO

SELECT StudentId, MAX(Grade) as MaxGrade, AVG(Grade) as AverageGrade
FROM Grade
GROUP BY StudentId
ORDER BY StudentId
GO

SELECT TeacherId, SUM(Grade) as TotalGrades
FROM Grade
GROUP BY TeacherId
HAVING (SUM(Grade) > 200)
ORDER BY TeacherId
GO

SELECT StudentId, SUM(Grade) as GradeCount,MAX(Grade) as MaximumGrade, AVG(Grade) as AverageGrade
FROM Grade
GROUP BY StudentId
HAVING Max(Grade) = AVG(Grade)
ORDER BY StudentId
GO

CREATE VIEW vv_CountGrades
AS
SELECT s.Id,s.FirstName,s.LastName, SUM(g.Grade) as GradeCount,MAX(g.Grade) as MaximumGrade, AVG(g.Grade) as AverageGrade
FROM Grade g
inner join Student s on g.StudentId = s.Id
GROUP BY s.Id,s.FirstName,s.LastName
HAVING Max(g.Grade) = AVG(g.Grade)
GO

SELECT * FROM vv_CountGrades
GO

CREATE VIEW vv_StudentGrades
AS
SELECT StudentId, SUM(Grade) as GradesCount
FROM Grade
GROUP BY StudentID
GO

SELECT * FROM vv_StudentGrades
ORDER BY StudentID
GO

ALTER VIEW vv_StudentGrades
AS
SELECT s.FirstName, s.LastName,SUM(g.Grade) as GradesCount
FROM Grade g
inner join Student s on g.StudentID = s.Id
GROUP BY s.FirstName,s.LastName
GO

SELECT * FROM vv_StudentGrades
GO

SELECT * FROM vv_StudentGrades
ORDER BY GradesCount desc
GO