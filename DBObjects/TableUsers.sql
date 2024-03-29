/*
   Sunday, July 01, 201210:02:06 PM
   User: ulises
   Server: laboral.mssql.somee.com
   Database: laboral
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Users
	DROP CONSTRAINT FK_Users_aspnet_Membership
GO
ALTER TABLE dbo.aspnet_Membership SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.aspnet_Membership', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.aspnet_Membership', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.aspnet_Membership', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Users
	(
	UserId uniqueidentifier NOT NULL,
	Company varchar(50) NULL,
	Nombre nchar(20) NULL,
	ApPaterno nchar(20) NULL,
	ApMaterno nchar(20) NULL,
	FechaNacimiento date NULL,
	Direccion nvarchar(80) NULL,
	Colonia nvarchar(80) NULL,
	Municipio nchar(10) NULL,
	Estado nchar(10) NULL,
	CodigoPostal numeric(5, 0) NULL,
	TelFijo varchar(15) NULL,
	TelExtension varchar(15) NULL,
	TelMovil varchar(15) NULL,
	RoleId int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Users SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.Users)
	 EXEC('INSERT INTO dbo.Tmp_Users (UserId, Company, Nombre, ApPaterno, ApMaterno, FechaNacimiento, Direccion, Colonia, Municipio, Estado, CodigoPostal, TelFijo, TelExtension, TelMovil, RoleId)
		SELECT UserId, Company, Nombre, ApPaterno, ApMaterno, FechaNacimiento, Direccion, Colonia, Municipio, Estado, CodigoPostal, TelFijo, TelExtension, TelMovil, RoleId FROM dbo.Users WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.Users
GO
EXECUTE sp_rename N'dbo.Tmp_Users', N'Users', 'OBJECT' 
GO
ALTER TABLE dbo.Users ADD CONSTRAINT
	FK_Users_aspnet_Membership FOREIGN KEY
	(
	UserId
	) REFERENCES dbo.aspnet_Membership
	(
	UserId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Users', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Users', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Users', 'Object', 'CONTROL') as Contr_Per 