USE PersonalLibrary

IF OBJECT_ID('dbo.CodebookBookTypeLocalizations', 'U') IS NOT NULL
	--DROP TABLE dbo.CodebookBookTypeLocalizations
	SELECT TOP 100 * FROM dbo.CodebookBookTypeLocalizations
ELSE
BEGIN
	CREATE TABLE dbo.CodebookBookTypeLocalizations
	(
		ID INT IDENTITY(1,1),
		TypeID SMALLINT NOT NULL,
		LanguageID INT NOT NULL,
		LocalizationName NVARCHAR(50) NOT NULL,
		CONSTRAINT PK_CodebookBookTypeLocalizations_ID PRIMARY KEY (ID),
		CONSTRAINT FK_CodebookBookTypeLocalizations_TypeID FOREIGN KEY (TypeID) REFERENCES dbo.CodebookBookType,
		CONSTRAINT FK_CodebookBookTypeLocalizations_LanguageID FOREIGN KEY (LanguageID) REFERENCES dbo.CodebookLocalizations,
		CONSTRAINT UQ_CodebookBookTypeLocalizations_Type_Language UNIQUE (TypeID, LanguageID)
	)

	INSERT INTO dbo.CodebookBookTypeLocalizations (TypeID, LanguageID, LocalizationName)
	VALUES (1, 2, N'Tvrdi povez'),
	(2, 2, N'Meki povez'),
	(5, 2, N'Audio knjiga'),
	(1, 3, N'Тврди повез'),
	(2, 3, N'Меки повез'),
	(5, 3, N'Аудио књига');
END

/* Testing
SELECT cbt.ID, cbt.EBook, COALESCE(t.LocalizationName, cbt.DefaultTypeName) [BookType]
FROM CodebookBookType cbt
LEFT JOIN 
(
	SELECT cbtl.TypeID, cbtl.LocalizationName
	FROM CodebookBookTypeLocalizations cbtl 
	INNER JOIN CodebookLocalizations cl ON cbtl.LanguageID = cl.ID AND cl.Culture='sr-Cyrl-RS'
) t ON t.TypeID=cbt.ID
SELECT cbt.ID, cbt.EBook, COALESCE(t.LocalizationName, cbt.DefaultTypeName) [BookType]
FROM CodebookBookType cbt
LEFT JOIN 
(
	SELECT cbtl.TypeID, cbtl.LocalizationName
	FROM CodebookBookTypeLocalizations cbtl 
	INNER JOIN CodebookLocalizations cl ON cbtl.LanguageID = cl.ID AND cl.Culture='de'
) t ON t.TypeID=cbt.ID
*/