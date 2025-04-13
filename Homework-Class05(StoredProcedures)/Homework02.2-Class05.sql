use SEDCHome

CREATE PROCEDURE dbo.CreateGradeDetails(
	@GradeId int,
	@AchievementTypeID int, 
	@Points int, 
	@AchievementMaxPoints int,
	@SpecificGradeDate date,
	@ID_Temp int
)
AS
BEGIN
	INSERT INTO dbo.GradeDetails (GradeID,AchievementTypeID,AchievementPoints, AchievementMaxPoints,AchievementDate,ID_Temp)
	VALUES(@GradeID,@AchievementTypeID,@Points,@AchievementMaxPoints,@SpecificGradeDate,@ID_Temp)

	SELECT SUM(CAST(gd.AchievementPoints AS FLOAT)/gd.AchievementMaxPoints * a.ParticipationRate) as GradePoints
	FROM [dbo].[GradeDetails] as gd
	inner join [dbo].[AchievementType] as a on gd.AchievementTypeID = a.ID
	WHERE gd.GradeID = @GradeId
END
GO

EXEC dbo.CreateGradeDetails
    @GradeID = 5,
    @AchievementTypeID = 5,
    @Points = 7,
    @AchievementMaxPoints= 10,
    @SpecificGradeDate = '2025-04-13',
	@ID_Temp=5

