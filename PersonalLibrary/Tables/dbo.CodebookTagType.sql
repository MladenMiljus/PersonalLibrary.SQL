USE PersonalLibrary

IF OBJECT_ID('dbo.CodebookTagType', 'U') IS NOT NULL
	--DROP TABLE dbo.CodebookTagType
	SELECT TOP 100 * FROM dbo.CodebookTagType
ELSE
BEGIN
	CREATE TABLE dbo.CodebookTagType
	(
		ID SMALLINT IDENTITY(1,1),
		DefaultTypeName VARCHAR(30) NOT NULL, /* English language used for default */
		DefaultDescription VARCHAR(200) NOT NULL,
		Active BIT DEFAULT 1,
		CONSTRAINT PK_CodebookTagType_ID PRIMARY KEY (ID)
	)

	INSERT INTO dbo.CodebookTagType (DefaultTypeName, DefaultDescription, Active)
	VALUES ('Action', 'What type of action is defined with the book', DEFAULT),
	('Fiction genre', 'Subtype of fiction book', DEFAULT),
	('Nonfiction genre', 'Subtype of nonfiction book', DEFAULT);
END