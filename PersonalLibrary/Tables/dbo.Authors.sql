USE PersonalLibrary

IF OBJECT_ID('dbo.Authors', 'U') IS NOT NULL
	--DROP TABLE dbo.Authors
	SELECT TOP 100 * FROM dbo.Authors
ELSE
BEGIN
	CREATE TABLE dbo.Authors
	(
		ID INT IDENTITY(1,1),
		ServiceID INT NULL, /* Goodread AuthorID */
		AutorName NVARCHAR(50) NOT NULL,
		ImageUrl VARCHAR(200),
		InLibrary BIT DEFAULT 1,
		CONSTRAINT PK_Authors_ID PRIMARY KEY (ID)
	)
END