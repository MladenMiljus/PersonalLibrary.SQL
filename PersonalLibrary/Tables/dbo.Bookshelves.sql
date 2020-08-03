USE PersonalLibrary

IF OBJECT_ID('dbo.Bookshelves', 'U') IS NOT NULL
	--DROP TABLE dbo.Bookshelves
	SELECT TOP 100 * FROM dbo.Bookshelves
ELSE
BEGIN
	CREATE TABLE dbo.Bookshelves
	(
		ID BIGINT IDENTITY(1,1),
		LocationID INT NULL, /* location can be a device */
		ShelfName NVARCHAR(50) NOT NULL,
		ShelfDescription NVARCHAR(200),
		/* TODO: possibly add number of rows in later editions */
		Active BIT DEFAULT 1,
		CONSTRAINT PK_Bookshelves_ID PRIMARY KEY (ID),
		CONSTRAINT FK_Bookshelves_UserID FOREIGN KEY (LocationID) REFERENCES dbo.Locations
	)

END