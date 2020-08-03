USE master

USE [master]
GO

IF DB_ID('PersonalLibrary') IS NOT NULL BEGIN
	--ALTER DATABASE [PersonalLibrary] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE [PersonalLibrary]
END
GO

CREATE DATABASE [PersonalLibrary]
--ON PRIMARY (
--	NAME = PersonalLibrary_data,
--	FILENAME = 'PersonalLibrary.mdf',
--	SIZE = 1 MB,
--	MAXSIZE = UNLIMITED,
--	FILEGROWTH = 10%
--) 
--LOG ON
--(
--	NAME = PersonalLibrary_log,
--	FILENAME = 'PersonalLibrary.ldf',
--	SIZE = 1 MB,
--	MAXSIZE = UNLIMITED,
--	FILEGROWTH = 10%
--)
--COLLATE Latin1_General_CI_AS
GO

USE [PersonalLibrary]
GO