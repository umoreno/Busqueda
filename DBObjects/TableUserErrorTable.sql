USE [laboral]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 06/30/2012 20:34:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[UserErrorTable](
	[UserId] [uniqueidentifier] NOT NULL,
	[Company] [varchar](50) NOT NULL,
	[Nombre] [nchar](20) NOT NULL,
	[ApPaterno] [nchar](20) NOT NULL,
	[ApMaterno] [nchar](20) NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Direccion] [nvarchar](80) NULL,
	[Colonia] [nvarchar](80) NULL,
	[Municipio] [nchar](10) NULL,
	[Estado] [nchar](10) NULL,
	[CodigoPostal] [numeric](5, 0) NOT NULL,
	[TelFijo] [varchar](15) NULL,
	[TelExtension] [varchar](15) NOT NULL,
	[TelMovil] [varchar](15) NOT NULL,
	[RoleId] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

GO