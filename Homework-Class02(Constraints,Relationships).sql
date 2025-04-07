USE SEDCHome

SELECT *
FROM Student
WHERE FirstName = 'Antonio'
GO

SELECT *
FROM Student
WHERE DateOfBirth > '1999.01.01'
GO

SELECT * 
FROM Student
WHERE EnrolledDate >= '2003.08.01' and EnrolledDate < '2003.08.31'
and LastName like 'J%'
GO

SELECT * 
FROM Student
ORDER BY FirstName ASC
GO

SELECT LastName FROM Teacher
UNION
SELECT LastName FROM STUDENT
GO

ALTER TABLE [dbo].[Grade] WITH CHECK 
ADD CONSTRAINT [FK_Grade_Course]
FOREIGN KEY ([CourseId])
REFERENCES [dbo].[Course]([Id])
GO

ALTER TABLE [dbo].[Grade] WITH CHECK 
ADD CONSTRAINT [FK_Grade_Student]
FOREIGN KEY ([StudentId])
REFERENCES [dbo].[Student]([Id])
GO

ALTER TABLE [dbo].[Grade] WITH CHECK 
ADD CONSTRAINT [FK_Grade_Teacher]
FOREIGN KEY ([TeacherId])
REFERENCES [dbo].[Teacher]([Id])
GO

ALTER TABLE [dbo].[GradeDetails] WITH CHECK 
ADD CONSTRAINT [FK_GradeDetails_AchievementType]
FOREIGN KEY ([AchievementTypeId])
REFERENCES [dbo].[AchievementType]([Id])
GO

ALTER TABLE [dbo].[GradeDetails] WITH CHECK 
ADD CONSTRAINT [FK_GradeDetails_Grade]
FOREIGN KEY ([GradeId])
REFERENCES [dbo].[Grade]([Id])
GO

SELECT c.Name as CoursesName, a.Name as AchievementType
FROM Course c
CROSS JOIN AchievementType a
GO

SELECT DISTINCT t.FirstName + N' ' + t.LastName as Teacher
FROM Teacher t
left join Grade g on g.TeacherId = t.Id
WHERE g.TeacherId is null
GO
