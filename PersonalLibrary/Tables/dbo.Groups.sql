﻿USE PersonalLibrary

IF OBJECT_ID('dbo.Groups', 'U') IS NOT NULL
	--DROP TABLE dbo.Groups
	SELECT TOP 100 * FROM dbo.Groups
ELSE
BEGIN
	CREATE TABLE dbo.Groups
	(
		ID INT IDENTITY(1,1),
		GroupName NVARCHAR(30) NOT NULL,
		GroupDescription NVARCHAR(50) NOT NULL,
		Active BIT DEFAULT 1,
		CONSTRAINT PK_Groups_ID PRIMARY KEY (ID)
	)
END