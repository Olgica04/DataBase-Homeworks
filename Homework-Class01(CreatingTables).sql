use SEDCACADEMYDB

CREATE TABLE Student(
	[Id]int IDENTITY (1,1) NOT NULL,
	[FirstName]nvarchar (100) NOT NULL,
	[LastName]nvarchar(100) NOT NULL,
	[DateOfBirth]date NULL,
	[EnrolledDate]date NULL,
	[Gender]nvarchar(6) NULL,
	[NationalIdNumber]int NOT NULL,
	[StudentCardNumber]int NULL,
	CONSTRAINT [PK_Student] PRIMARY KEY (Id)
)

CREATE TABLE Teacher (
	[Id]int IDENTITY (1,1) NOT NULL,
	[FirstName]nvarchar (100) NOT NULL,
	[LastName]nvarchar(100) NOT NULL,
	[DateOfBirth]date NULL,
	[AcademicRank] nvarchar (50) NULL,
	[HireDate] date NULL,
	CONSTRAINT [PK_Teacher] PRIMARY KEY (Id)
)

CREATE TABLE Grade (
	[Id] int IDENTITY (1,1) NOT NULL,
	[StudentId] int NOT NULL,
	[CourseId] int NOT NULL,
	[TeacherId] int NOT NULL,
	[Grade] int NULL,
	[Comment] nvarchar (MAX) NULL,
	[CreatedDate] date NULL,
	CONSTRAINT [PK_Grade] PRIMARY KEY (Id)
)

CREATE TABLE Course(
	[Id] int IDENTITY (1,1) NOT NULL,
	[Name] nvarchar (50) NOT NULL,
	[Credit] int NOT NULL,
	[AcademicYear] date NULL,
	[Semester] int NULL,
	CONSTRAINT [PK_Course] PRIMARY KEY (Id)
)

CREATE TABLE GradeDetails(
	[Id] int IDENTITY (1,1) NOT NULL,
	[GradeId] int NOT NULL,
	[AchievementTypeId] int NOT NULL,
	[AchievementPoints] int NULL,
	[AchievementMaxPoints] int NULL,
	[AchievementDate] date NULL,
	CONSTRAINT [PK_GradeDetails] PRIMARY KEY (Id)
)

CREATE TABLE AchievementType (
	[Id] int IDENTITY (1,1) NOT NULL,
	[Name] nvarchar (50) NOT NULL,
	[Description] nvarchar (MAX) NULL,
	[ParticipationRate] nvarchar(100) NULL,
	CONSTRAINT [PK_AchievementType] PRIMARY KEY (Id)
)

