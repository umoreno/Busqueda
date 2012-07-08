USE [laboral]
GO

/****** Object:  StoredProcedure [dbo].[UsersDetailsbyID]    Script Date: 07/02/2012 22:50:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UsersDetailsbyID]
    (@UserId uniqueidentifier)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    SELECT Company, Nombre, ApPaterno, ApMaterno, Direccion, Colonia,
		Municipio, Estado, CodigoPostal, TelFijo, TelExtension, TelMovil, RoleId
     from Users
        as c where c.UserId=@UserId
END

GO


