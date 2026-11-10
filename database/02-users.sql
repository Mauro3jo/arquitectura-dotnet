-- Educational setup for a NEW, EMPTY practice database. Never use a production database.
-- Run with sqlcmd -b -d <dedicated-database>; requires SQLCMD mode.
:ON ERROR EXIT
-- Users table and procedures from course Users-Objects.sql.
IF DB_NAME() IN ('master', 'model', 'msdb', 'tempdb')
    THROW 50001, 'Select a dedicated practice database.', 1;
IF EXISTS (SELECT 1 FROM sys.objects WHERE schema_id = SCHEMA_ID('dbo') AND name IN ('Users', 'UsersInsert', 'UsersGetByEmail'))
    THROW 50002, 'Target objects already exist; this script does not replace them.', 1;
GO
CREATE TABLE Users (
    Id NVARCHAR(50) NOT NULL PRIMARY KEY,
	FirstName NVARCHAR(50) NULL,
    LastName NVARCHAR(50) NULL,
	Email NVARCHAR(100) NOT NULL,
    UserName NVARCHAR(50) NOT NULL,
    PasswordHash NVARCHAR(MAX) NOT NULL
);
GO

CREATE PROCEDURE UsersInsert
(
	@Id nvarchar (50) ,
	@FirstName nvarchar (50) NULL,
	@LastName nvarchar (50) NULL,
	@Email nvarchar (100) ,
	@UserName nvarchar (50) ,
	@PasswordHash nvarchar (MAX) NULL
)
AS
BEGIN

    INSERT INTO Users (Id, FirstName, LastName, Email, UserName, PasswordHash)
    VALUES(@Id, @FirstName, @LastName, @Email, @UserName, @PasswordHash)

END
GO

CREATE PROCEDURE UsersGetByEmail
(
    @Email nvarchar (100)
)
AS
BEGIN

    SELECT Id, FirstName, LastName, Email, UserName, PasswordHash
    FROM Users
    WHERE Email=@Email

END
GO
