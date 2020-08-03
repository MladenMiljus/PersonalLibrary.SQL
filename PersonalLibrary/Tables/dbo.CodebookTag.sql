USE PersonalLibrary

/* TODO: dodati na isti način regionalizaciju */
IF OBJECT_ID('dbo.CodebookTag', 'U') IS NOT NULL
	--DROP TABLE dbo.CodebookTag
	SELECT TOP 100 * FROM dbo.CodebookTag
ELSE
BEGIN
	CREATE TABLE dbo.CodebookTag
	(
		ID SMALLINT IDENTITY(1,1),
		TagTypeID SMALLINT NOT NULL,
		DefaultTypeName VARCHAR(30) NOT NULL, /* English language used for default */
		DefaultDescription VARCHAR(200) NOT NULL,
		Active BIT DEFAULT 1,
		CONSTRAINT PK_CodebookTag_ID PRIMARY KEY (ID),
		CONSTRAINT UQ_CodebookTag_Type_Name UNIQUE (TagTypeID, DefaultTypeName),
		CONSTRAINT FK_CodebookTag_TagTypeID FOREIGN KEY (TagTypeID) REFERENCES dbo.CodebookTagType
	)

	/* TODO: insert all other tags for fiction (stopped at Comic book) and nonfiction (stopped at diary) - https://reference.yourdictionary.com/books-literature/different-types-of-books.html */
	INSERT INTO dbo.CodebookTag (TagTypeID, DefaultTypeName, DefaultDescription, Active)
	VALUES (1, 'Action and adventure', '', DEFAULT),
	(1, 'Alternate history', '', DEFAULT),
	(1, 'Anthology', '', DEFAULT),
	(1, 'Chick lit', '', DEFAULT),
	(1, 'Children''s', '', DEFAULT),
	(1, 'Classic', '', DEFAULT),
	(1, 'Comic book', '', DEFAULT),
	(2, 'Art/architecture', '', DEFAULT),
	(2, 'Autobiography', '', DEFAULT),
	(2, 'Biography', '', DEFAULT),
	(2, 'Business/economics', '', DEFAULT),
	(2, 'Crafts/hobbies', '', DEFAULT),
	(2, 'Cookbook', '', DEFAULT),
	(2, 'Diary', '', DEFAULT),
	(3, 'To buy', 'Books to buy for library', DEFAULT),
	(3, 'To read', 'Books in library next for reading', DEFAULT);
END