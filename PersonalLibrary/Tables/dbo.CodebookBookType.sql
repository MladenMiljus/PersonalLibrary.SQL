USE PersonalLibrary

IF OBJECT_ID('dbo.CodebookBookType', 'U') IS NOT NULL
	--DROP TABLE dbo.CodebookBookType
	SELECT TOP 100 * FROM dbo.CodebookBookType
ELSE
BEGIN
	CREATE TABLE dbo.CodebookBookType
	(
		ID SMALLINT IDENTITY(1,1),
		DefaultTypeName VARCHAR(30) NOT NULL, /* English language used for default */
		EBook BIT DEFAULT 1,
		Active BIT DEFAULT 1,
		CONSTRAINT PK_CodebookBookType_ID PRIMARY KEY (ID)
	)

	INSERT INTO dbo.CodebookBookType (DefaultTypeName, EBook, Active)
	VALUES ('Hardback', 0, DEFAULT),
	('Paperback', 0, DEFAULT),
	('PDF', DEFAULT, DEFAULT),
	('EPUB', DEFAULT, DEFAULT),
	('Audio book', DEFAULT, DEFAULT);
END