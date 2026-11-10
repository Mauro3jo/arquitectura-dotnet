-- Educational setup for a NEW, EMPTY practice database. Never use a production database.
-- Run with sqlcmd -b -d <dedicated-database>; requires SQLCMD mode.
:ON ERROR EXIT
-- Customers schema: minimal reconstruction for practice; procedures from course objects.sql.
IF DB_NAME() IN ('master', 'model', 'msdb', 'tempdb')
    THROW 50001, 'Select a dedicated practice database.', 1;
IF EXISTS (SELECT 1 FROM sys.objects WHERE schema_id = SCHEMA_ID('dbo') AND name IN ('Customers', 'CustomersInsert', 'CustomersUpdate', 'CustomersDelete', 'CustomersList', 'CustomersGetByID'))
    THROW 50002, 'Target objects already exist; this script does not replace them.', 1;
GO
CREATE TABLE dbo.Customers (
 CustomerID nchar(5) NOT NULL PRIMARY KEY,
 CompanyName nvarchar(40) NOT NULL,
 ContactName nvarchar(30) NULL,
 ContactTitle nvarchar(30) NULL,
 Address nvarchar(60) NULL,
 City nvarchar(15) NULL,
 Region nvarchar(15) NULL,
 PostalCode nvarchar(10) NULL,
 Country nvarchar(15) NULL,
 Phone nvarchar(24) NULL,
 Fax nvarchar(24) NULL
);
GO

CREATE PROCEDURE CustomersInsert
(
	@CustomerID nchar (5) ,
	@CompanyName nvarchar (40) ,
	@ContactName nvarchar (30) NULL ,
	@ContactTitle nvarchar (30) NULL ,
	@Address nvarchar (60) NULL ,
	@City nvarchar (15) NULL ,
	@Region nvarchar (15) NULL ,
	@PostalCode nvarchar (10) NULL ,
	@Country nvarchar (15) NULL ,
	@Phone nvarchar (24) NULL ,
	@Fax nvarchar (24) NULL
)
AS
BEGIN

    INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
    VALUES(@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax)

END
GO

CREATE PROCEDURE CustomersUpdate
(
	@CustomerID nchar (5) ,
	@CompanyName nvarchar (40) ,
	@ContactName nvarchar (30) NULL ,
	@ContactTitle nvarchar (30) NULL ,
	@Address nvarchar (60) NULL ,
	@City nvarchar (15) NULL ,
	@Region nvarchar (15) NULL ,
	@PostalCode nvarchar (10) NULL ,
	@Country nvarchar (15) NULL ,
	@Phone nvarchar (24) NULL ,
	@Fax nvarchar (24) NULL
)
AS
BEGIN

    UPDATE Customers
        SET
        CompanyName=@CompanyName,
        ContactName=@ContactName,
        ContactTitle=@ContactTitle,
        Address=@Address,
        City=@City,
        Region=@Region,
        PostalCode=@PostalCode,
        Country=@Country,
        Phone=@Phone,
        Fax=@Fax
    WHERE CustomerID=@CustomerID

END
GO

CREATE PROCEDURE CustomersDelete
(
	@CustomerID nchar (5)
)
AS
BEGIN

    DELETE Customers
    WHERE CustomerID=@CustomerID

END
GO

CREATE PROCEDURE CustomersList
AS
BEGIN

    SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
    FROM Customers

END
GO

CREATE PROCEDURE CustomersGetByID
(
    @CustomerID nchar (5)
)
AS
BEGIN

    SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
    FROM Customers
    WHERE CustomerID=@CustomerID

END
GO
