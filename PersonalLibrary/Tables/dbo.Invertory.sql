USE PersonalLibrary

IF OBJECT_ID('dbo.Invertory', 'U') IS NOT NULL
	--DROP TABLE dbo.Invertory
	SELECT TOP 100 * FROM dbo.Invertory
ELSE
BEGIN
	CREATE TABLE dbo.Invertory
	(
		ID BIGINT IDENTITY(1,1),
		BookID BIGINT NOT NULL,
		UserID INT NULL,
		GroupID INT NULL,
		TypeID SMALLINT NULL,
		Bought BIT DEFAULT 1,
		Borrowed BIT DEFAULT 0,
		ShelfID BIGINT NULL,
		ShelfRackNo TINYINT NULL,
		ShelfRackOrder TINYINT NULL,
		FilePath NVARCHAR(1000) NULL,
		Active BIT DEFAULT 1,
		CONSTRAINT PK_Invertory_ID PRIMARY KEY (ID),
		CONSTRAINT FK_Invertory_TypeID FOREIGN KEY (TypeID) REFERENCES dbo.CodebookBookType,
		CONSTRAINT FK_Invertory_UserID FOREIGN KEY (UserID) REFERENCES dbo.Users,
		CONSTRAINT FK_Invertory_GroupID FOREIGN KEY (GroupID) REFERENCES dbo.Groups,
		CONSTRAINT FK_Invertory_ShelfID FOREIGN KEY (ShelfID) REFERENCES dbo.Bookshelves,
		CONSTRAINT FK_Invertory_BookID FOREIGN KEY (BookID) REFERENCES dbo.Books,
		CONSTRAINT CH_Invertory_HasGroupOrUser CHECK (UserID IS NOT NULL OR GroupID IS NOT NULL)
	)
END

/* TODO - 
Define cross refernce table of tags for invertory
Define book and author reviews scores
---
*/