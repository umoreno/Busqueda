USE [laboral]
GO
IF OBJECT_ID('InsUpdUserDetails','P') IS NOT NULL 
    DROP PROC InsUpdUserDetails 
GO 

/****** Object:  StoredProcedure [dbo].[InsUpdUserDetails]    Script Date: 07/02/2012 20:48:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ulises
-- Create date: 06/30/2012
-- Description:	Logic to Insert Update User Information
-- =============================================
CREATE PROCEDURE [dbo].[InsUpdUserDetails] 
	-- Add the parameters for the stored procedure here
	@UserId uniqueidentifier,
	@Nombre nchar(20) = NULL,
	@ApPaterno nchar(20) = NULL,
	@ApMaterno nchar(20) = NULL,
	@Company varchar(50) = NULL,
	@Direccion nvarchar(80) = NULL,
	@Colonia nvarchar(80) = NULL,
	@Municipio nchar(10) = NULL,
	@Estado nchar(10) = NULL,
	@CodigoPostal numeric = 0,
	@TelFijo varchar(15) = NULL,
	@TelMovil varchar(15) = null	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET transaction isolation level SERIALIZABLE 
	BEGIN TRANSACTION Upsert 
	UPDATE Users set Nombre=@Nombre,  ApPaterno = @ApPaterno, 
		ApMaterno = @ApMaterno, Direccion = @Direccion, Colonia = @Colonia,
		Municipio = @Municipio, Estado = @Estado, 
		CodigoPostal = @CodigoPostal, TelFijo = @TelFijo
		where UserId=@UserId 
	if @@rowcount = 0 
	begin 
	INSERT into Users (UserId, Nombre, ApPaterno, ApMaterno, Direccion, Colonia, Municipio,
		Estado, CodigoPostal, TelFijo)
		 values (@UserId, @Nombre, @ApPaterno, @ApMaterno, @Direccion, @Colonia, @Municipio,
			@Estado, @CodigoPostal, @TelFijo) 
	end 
	if @@Error > 0 
	begin 
	INSERT into UserErrorTable (UserId, Nombre, ApPaterno, ApMaterno, Direccion, Colonia, Municipio,
		Estado, CodigoPostal, TelFijo)
		 values (@UserId, @Nombre, @ApPaterno, @ApMaterno, @Direccion, @Colonia, @Municipio,
			@Estado, @CodigoPostal, @TelFijo)
	end 
	COMMIT TRANSACTION Upsert 
	END

GO


