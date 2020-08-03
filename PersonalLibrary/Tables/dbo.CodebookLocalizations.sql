USE PersonalLibrary

IF OBJECT_ID('dbo.CodebookLocalizations', 'U') IS NOT NULL
	--DROP TABLE dbo.CodebookLocalizations
	SELECT TOP 100 * FROM dbo.CodebookLocalizations
ELSE
BEGIN
	CREATE TABLE dbo.CodebookLocalizations
	(
		ID INT IDENTITY(1,1),
		LanguageName VARCHAR(30) NOT NULL, /* English language used for ordering alphabetically */
		Culture VARCHAR(10) UNIQUE NOT NULL,
		DisplayName NVARCHAR(50) NOT NULL,
		Code2 CHAR(2) NOT NULL,
		Code3 CHAR(3) NOT NULL,
		LanguageCode CHAR(3) NOT NULL,
		Localization BIT NOT NULL,
		OrderNo INT DEFAULT -1,
		CONSTRAINT PK_CodebookLocalizations_ID PRIMARY KEY (ID)
	)

	INSERT INTO dbo.CodebookLocalizations (LanguageName, Culture, DisplayName, Code2, Code3, LanguageCode, Localization, OrderNo)
		VALUES ('English - UK', 'en-GB', N'English', 'gb', 'gbr', 'eng', 1, DEFAULT),
		('Serbian Latin', 'sr-Latn-RS', N'Srpski', 'rs', 'srb', 'srp', 1, DEFAULT),
		('Serbian Cyrilic', 'sr-Cyrl-RS', N'Српски', 'rs', 'srb', 'srp', 1, DEFAULT),
		('German', 'de', N'Deutsche', 'de', 'deu', 'de', 0, DEFAULT);
END