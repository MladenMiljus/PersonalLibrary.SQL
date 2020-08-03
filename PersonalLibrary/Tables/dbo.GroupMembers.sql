USE PersonalLibrary

IF OBJECT_ID('dbo.GroupMembers', 'U') IS NOT NULL
	--DROP TABLE dbo.GroupMembers
	SELECT TOP 100 * FROM dbo.GroupMembers
ELSE
BEGIN
	CREATE TABLE dbo.GroupMembers
	(
		GroupID INT NOT NULL,
		UserID INT NOT NULL,
		Active BIT DEFAULT 1,
		CONSTRAINT FK_GroupMembers_GroupID FOREIGN KEY (GroupID) REFERENCES dbo.Groups,
		CONSTRAINT FK_GroupMembers_UserID FOREIGN KEY (UserID) REFERENCES dbo.Users
	)

END