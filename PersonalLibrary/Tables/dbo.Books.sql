USE PersonalLibrary

IF OBJECT_ID('dbo.Books', 'U') IS NOT NULL
	--DROP TABLE dbo.Books
	SELECT TOP 100 * FROM dbo.Books
ELSE
BEGIN
	CREATE TABLE dbo.Books
	(
		ID BIGINT IDENTITY(1,1),
		ServiceID INT NULL, /* Goodread BookID */
		Title NVARCHAR(1000),
		ISBN10 VARCHAR(10),
		ISBN13 VARCHAR(13),
		CountryCode CHAR(3),
		PublicationYear SMALLINT,
		ImageUrl VARCHAR(200),
		Publisher NVARCHAR(200),
		LanguageCode CHAR(3),
		BookDescription NVARCHAR(4000),
		NumPages SMALLINT,
		LocationAddress NVARCHAR(100),
		LocationCity NVARCHAR(50),
		LocationCountry NVARCHAR(50),
		OriginalTitle NVARCHAR(1000),
		Active BIT DEFAULT 1,
		CONSTRAINT PK_Books_ID PRIMARY KEY (ID)
	)
END