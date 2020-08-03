USE PersonalLibrary

IF OBJECT_ID('dbo.Locations', 'U') IS NOT NULL
	--DROP TABLE dbo.Locations
	SELECT TOP 100 * FROM dbo.Locations
ELSE
BEGIN
	CREATE TABLE dbo.Locations
	(
		ID INT IDENTITY(1,1),
		UserID INT NULL,
		GroupID INT NULL,
		LocationName NVARCHAR(50) NOT NULL,
		LocationDescription NVARCHAR(200),
		LocationAddress NVARCHAR(100),
		LocationCity NVARCHAR(50),
		LocationCountryID SMALLINT NOT NULL,
		/* possibly add geolocation based on maps in later editions */
		Active BIT DEFAULT 1,
		CONSTRAINT PK_Locations_ID PRIMARY KEY (ID),
		CONSTRAINT FK_Locations_UserID FOREIGN KEY (UserID) REFERENCES dbo.Users,
		CONSTRAINT FK_Locations_GroupID FOREIGN KEY (GroupID) REFERENCES dbo.Groups,
		CONSTRAINT CH_Locations_HasGroupOrUser CHECK (UserID IS NOT NULL OR GroupID IS NOT NULL),
		CONSTRAINT FK_Locations_LocationCountryID FOREIGN KEY (LocationCountryID) REFERENCES dbo.CodebookCountries
	)
END