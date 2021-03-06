USE [BDPROYECTOINTEGRADOR]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 08/29/2016 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](45) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON
INSERT [dbo].[rol] ([idRol], [descripcion]) VALUES (1, N'Administrador')
SET IDENTITY_INSERT [dbo].[rol] OFF
/****** Object:  Table [dbo].[marcas]    Script Date: 08/29/2016 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[marcas](
	[idmarcas] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](45) NULL,
	[estado] [varchar](45) NULL,
 CONSTRAINT [PK_marcas] PRIMARY KEY CLUSTERED 
(
	[idmarcas] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[marcas] ON
INSERT [dbo].[marcas] ([idmarcas], [descripcion], [estado]) VALUES (1, N'Samsung ', N'Activo')
INSERT [dbo].[marcas] ([idmarcas], [descripcion], [estado]) VALUES (2, N'Huawei', N'Activo')
INSERT [dbo].[marcas] ([idmarcas], [descripcion], [estado]) VALUES (3, N'Iphone', N'Activo')
INSERT [dbo].[marcas] ([idmarcas], [descripcion], [estado]) VALUES (4, N'Sony', N'Activo')
INSERT [dbo].[marcas] ([idmarcas], [descripcion], [estado]) VALUES (5, N'Panasonic', N'Activo')
INSERT [dbo].[marcas] ([idmarcas], [descripcion], [estado]) VALUES (6, N'Acero', N'Activo')
SET IDENTITY_INSERT [dbo].[marcas] OFF
/****** Object:  Table [dbo].[categoria]    Script Date: 08/29/2016 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](45) NULL,
	[estado] [varchar](45) NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[categoria] ON
INSERT [dbo].[categoria] ([idcategoria], [descripcion], [estado]) VALUES (1, N'Celulares', N'Activo')
INSERT [dbo].[categoria] ([idcategoria], [descripcion], [estado]) VALUES (2, N'Televisores', N'Activo')
INSERT [dbo].[categoria] ([idcategoria], [descripcion], [estado]) VALUES (3, N'Licuadoras', N'Activo')
INSERT [dbo].[categoria] ([idcategoria], [descripcion], [estado]) VALUES (4, N'equipos de sonido', N'Activo')
INSERT [dbo].[categoria] ([idcategoria], [descripcion], [estado]) VALUES (5, N'impresoras', N'Activo')
INSERT [dbo].[categoria] ([idcategoria], [descripcion], [estado]) VALUES (6, N'Televisores', N'Activo')
INSERT [dbo].[categoria] ([idcategoria], [descripcion], [estado]) VALUES (7, N'Categoria Prueba', N'Inactivo')
INSERT [dbo].[categoria] ([idcategoria], [descripcion], [estado]) VALUES (8, N'nueva prueba', N'Inactivo')
INSERT [dbo].[categoria] ([idcategoria], [descripcion], [estado]) VALUES (9, N'Herramientas', N'Activo')
SET IDENTITY_INSERT [dbo].[categoria] OFF
/****** Object:  StoredProcedure [dbo].[obtenerProductosVistosRecientementes]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtenerProductosVistosRecientementes]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 15 idProducto, count(idProducto) as total  from vistosRecientes group by idProducto order by total desc
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerCategorias]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtenerCategorias]
	-- Add the parameters for the stored procedure here
	@estado varchar(45)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT idcategoria,descripcion, estado from categoria  
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarCategoria]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizarCategoria]
	-- Add the parameters for the stored procedure here
	@idCategoria int,
	@descripcion varchar(45),
	@estado varchar(45)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE categoria set descripcion=@descripcion, estado=@estado where idcategoria=@idCategoria;
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarMarca]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizarMarca]
	-- Add the parameters for the stored procedure here
	@idMarca int,
	@descripcion varchar(45),
	@estado varchar(45)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update marcas set descripcion=@descripcion, estado=@estado where idmarcas=@idMarca;
END
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 08/29/2016 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [char](10) NULL,
	[nombres] [varchar](45) NULL,
	[apellidos] [varchar](45) NULL,
	[email] [varchar](45) NULL,
	[celular] [varchar](45) NULL,
	[telefono] [varchar](45) NULL,
	[Rol_idRol] [int] NOT NULL,
	[clave] [varchar](50) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON
INSERT [dbo].[usuario] ([idusuario], [cedula], [nombres], [apellidos], [email], [celular], [telefono], [Rol_idRol], [clave]) VALUES (1, N'1234567890', N'Jordy', N'Sáenz de Viteri', N'jordy', N'0982362541', N'052781472', 1, N'1234')
SET IDENTITY_INSERT [dbo].[usuario] OFF
/****** Object:  StoredProcedure [dbo].[obtenerMarcas]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtenerMarcas] 
	-- Add the parameters for the stored procedure here
	@estado varchar(45)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT idmarcas,descripcion,estado from marcas 
END
GO
/****** Object:  StoredProcedure [dbo].[registrarMarcas]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[registrarMarcas]
	-- Add the parameters for the stored procedure here
	@descripcion varchar(45)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO marcas (descripcion,estado) values (@descripcion,'Activo');
END
GO
/****** Object:  StoredProcedure [dbo].[registrarCategorias]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[registrarCategorias]
	-- Add the parameters for the stored procedure here
	@descripcion varchar(45)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO categoria (descripcion,estado) values(@descripcion,'Activo'); 
END
GO
/****** Object:  Table [dbo].[producto]    Script Date: 08/29/2016 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[producto](
	[idproducto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](45) NULL,
	[detalle] [varchar](max) NULL,
	[estado] [varchar](45) NULL,
	[stock] [int] NULL,
	[categoria_idcategoria] [int] NOT NULL,
	[marcas_idmarcas] [int] NOT NULL,
	[modelo] [varchar](40) NULL,
	[vistas] [int] NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[producto] ON
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (1, N'Samsung J3', N'Samsung J3


El Samsung Galaxy J3 es un smartphone Android con una pantalla Super AMOLED HD de 5 pulgadas, cámara principal de 8 megapixels con flash LED, cámara frontal de 5 megapixels, procesador quad-core a 1.2GHz, 1.5GB de RAM, 8GB de almacenamiento interno expandible, conectividad LTE, y corre Android 5.1.1 Lollipop.

Medidas
Altura:  142.3mm
Ancho:  71mm
Grosor:  7.9mm
Peso:  138gr
Color:  Negro
Diseño
Resolución:  720 x 1280 pixels
Tamaño de pantalla:  5 pulgadas
Pantalla táctil:  Capacitativa
Colores de pantalla:  16M colores
Tipo de pantalla:  LCD TFT touchscreen capacitivo
Multimedia
Cámara primaria:  8 MP, 3264 x 2448 pixels, autofocus, flash LED, geo-tagging, detección de rostro y sonrisa, foco táctil, video 1080p@30fps
Cámara secundaria:  Cámara frontal 5 MP
Videos:  Reproductor de video MP4/WMV/H.264/H.263 
Alert Types:  Si
Altavoz:  Si
Redes Sociales:  Si
Java:  Si
Flash:  Si', N'Activo', 20, 1, 1, N'J3', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (2, N'Huawei P8', N'El Huawei P8 es el nuevo smartphone insignia de Huawei, posee una cámara de alta performance y una calidad de construcción increíble. Posee una pantalla 1080p de 5.2 pulgadas, procesador octa-core Kirin 930 a 2GHz, 3GB de RAM, 16GB de almacenamiento interno, cámara trasera de 13 megapixels, cámara frontal de 8 MP y corre Android 5.0

Medidas
Altura:  129mm
Ancho:  68.2mm
Grosor:  8.9mm
Peso:  122gr
Color:  Dorado
Diseño
Resolución:  1080 x 1920 pixels
Tamaño de pantalla:  5.2 pulgadas
Pantalla táctil:  Capacitativa
Colores de pantalla:  16M colores
Tipo de pantalla:  LCD IPS touchscreen capacitivo', N'Activo', 15, 1, 2, N'P8', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (3, N'Iphone SE', N'Iphone SE


El nuevo smartphone de cuatro pulgadas que reemplaza al iPhone 5S. Conserva casi idéntico diseño exterior, el hardware interno ha sido actualizado a la altura del iPhone 6s, incluyendo un procesador A9, NFC, cámara de 12 megapixels con captura de video 4K, y corre iOS 9.3

Medidas
Altura:  1238mm
Ancho:  586mm
Grosor:  76mm
Peso:  113gr
Color:  Negro
Diseño
Resolución:  16 millones de colores
Pantalla táctil:  Capacitativa
Tipo de pantalla:  Pantalla Multi-Touch panorámica de 4 pulgadas (en diagonal) retroiluminada por LED
Multimedia
Cámara primaria:  12 MPX
Cámara secundaria:  1.2 MPX
Videos:  Reproductor y editor de audio y video
Alert Types:  Si
Altavoz:  Si
Redes Sociales:  Si
Java:  Si
Flash:  No', N'Activo', 10, 1, 3, N'SE', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (4, N'Huawei Mate 8 NXT-L09', N'Huawei Mate 8 NXT-L09


El Huawei Mate 8 es el primer smartphone de Huawei potenciado por el nuevo y poderoso procesador Kirin 950 con ocho núcleos. Posee una pantalla 1080p de 6 pulgadas,versiones de 3GB o 4GB de RAM y hasta 128GB de almacenamiento interno, cámara principal de 16 megapixels, cámara frontal de 8 megapixels, y corre Android 6.0 Marshmallow.

Medidas
Altura:  129mm
Ancho:  68.2mm
Grosor:  8.9mm
Peso:  122gr
Color:  Dorado
Diseño
Resolución:  1080 x 1920 pixels
Tamaño de pantalla:  6.0 pulgadas
Pantalla táctil:  Capacitativa
Colores de pantalla:  16M colores
Tipo de pantalla:  LCD IPS touchscreen capacitivo', N'Activo', 10, 1, 2, N'NXT-L09', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (5, N'Huawei Y560', N'Huawei Y560


El Huawei Ascend Y530 es un smartphone Android con una pantalla de 4.5 pulgadas a 854 x 480 pixels de resolución, cámara de 5 megapixels, procesador de 1.1 GHz. Qualcomm MSM8909 de cuatro núcleos

Medidas
Altura:  480mm
Ancho:  854mm
Grosor:  4.5mm
Peso:  145gr
Color:  Negro
Diseño
Resolución:  480 x 854 pixels
Tamaño de pantalla:  4.5 pulgadas
Pantalla táctil:  Capacitativa
Colores de pantalla:  16M colores
Tipo de pantalla:  TFT touchscreen capacitivo', N'Activo', 5, 1, 2, N'Y560', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (6, N'Huawei Y635', N'Pantalla IPS FWVGA de 5 pulgadas, procesador quad-core de 64 bits Snapdragon 410, cámara trasera de 5 megapixels, conectividad LTE
Huawei Y635


El Huawei Ascend Y635 es un smartphone Android con una pantalla IPS FWVGA de 5 pulgadas, procesador quad-core de 64 bits Snapdragon 410, cámara trasera de 5 megapixels, conectividad LTE, 1GB de RAM y 8GB de almacenamiento interno.

Medidas
Altura:  143.97mm
Ancho:  72.87mm
Grosor:  10.2mm
Peso:  178gr
Color:  Negro
Diseño
Resolución:  480 x 854 pixels
Tamaño de pantalla:  5.0 pulgadas
Pantalla táctil:  Capacitativa
Colores de pantalla:  16M colores
Tipo de pantalla:  LCD IPS touchscreen capacitivo', N'Activo', 5, 1, 2, N'Y635', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (7, N'Sony Xperia E4', N'Sony Xperia E4 Seminuevo


El Sony Xperia E4 es un smartphone Android con una pantalla qHD de 5 pulgadas, cámara trasera de 5 megapixels, cámara frontal de 2 MP, procesador quad-core a 1.3GHz, 1GB de RAM, 8GB de almacenamiento interno y corre Android 4.4 KitKat.

Medidas
Altura:  137mm
Ancho:  75mm
Grosor:  10.5mm
Peso:  144gr
Color:  Negro
Diseño
Resolución:  540 x 960 pixels
Tamaño de pantalla:  5.0 pulgadas
Pantalla táctil:  Capacitativa
Colores de pantalla:  16M colores
Tipo de pantalla:  LCD IPS touchscreen capacitivo', N'Activo', 1, 1, 4, N'E4', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (8, N'Samsung J1 Ace Negro', N'Samsung J1 Ace Negro


El Samsung Galaxy J1 Ace es un smartphone con una pantalla WVGA de 4.3 pulgadas, cámara principal de 5 megapixels con flash LED, cámara frontal de 2 megapixels, 512MB de RAM, 4GB de almacenamiento, Android 4.4 KitKat y vaarias funciones como modo de ahorro de batería y Palm Selfie para tomar selfies detectando el movimiento de la mano.

Medidas
Altura:  129mm
Ancho:  68.2mm
Grosor:  8.9mm
Peso:  122gr
Color:  Negro', N'Activo', 5, 1, 1, N'J1', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (9, N'Samsung S6 Blanco', N'Pantalla Quad HD de 5.1 pulgadas, cámara de 16MP con OIS, procesador de 64 bits Exynos octa-core, 32GB de Memoria interna.

Samsung S6 Blanco


Sexta generación de la serie Galaxy S, esta vez presentando un rediseño radical, enfocándose en el uso de materiales como aluminio en lugar de plástico. El Galaxy S6 posee una pantalla Quad HD de 5.1 pulgadas, cámara de 16MP con OIS, procesador de 64 bits Exynos octa-core, y corre Android 5.0 Lollipop con un totalmente mejorado TouchWiz.

Medidas
Altura:  143.4mm
Ancho:  70.5mm
Grosor:  6.8mm
Peso:  138gr
Color:  Blanco', N'Activo', 5, 1, 1, N'J1', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (10, N'dsds', N'dsdsd', N'Activo', 12, 5, 1, N'bbb', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (11, N'dssdsd', N'dsdsd', N'Activo', 1, 1, 1, N'sasa', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (12, N'nuevo producto 2', N'sddsdsd', N'Activo', 3, 3, 1, N'ddsd', NULL)
INSERT [dbo].[producto] ([idproducto], [descripcion], [detalle], [estado], [stock], [categoria_idcategoria], [marcas_idmarcas], [modelo], [vistas]) VALUES (13, N'Taladro', N'absfdfdfdfdd', N'Activo', 10, 9, 6, N'MFG', NULL)
SET IDENTITY_INSERT [dbo].[producto] OFF
/****** Object:  Table [dbo].[precio]    Script Date: 08/29/2016 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[precio](
	[idprecio] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[valor] [decimal](18, 2) NULL,
	[estado] [varchar](45) NULL,
	[producto_idproducto] [int] NOT NULL,
 CONSTRAINT [PK_precio] PRIMARY KEY CLUSTERED 
(
	[idprecio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[precio] ON
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (1, CAST(0x313C0B00 AS Date), NULL, CAST(284.00 AS Decimal(18, 2)), N'Activo', 1)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (2, CAST(0x313C0B00 AS Date), NULL, CAST(728.00 AS Decimal(18, 2)), N'Activo', 2)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (3, CAST(0x313C0B00 AS Date), NULL, CAST(855.00 AS Decimal(18, 2)), N'Activo', 3)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (4, CAST(0x313C0B00 AS Date), NULL, CAST(864.00 AS Decimal(18, 2)), N'Activo', 4)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (5, CAST(0x313C0B00 AS Date), NULL, CAST(147.00 AS Decimal(18, 2)), N'Activo', 5)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (6, CAST(0x313C0B00 AS Date), NULL, CAST(192.00 AS Decimal(18, 2)), N'Activo', 6)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (7, CAST(0x313C0B00 AS Date), NULL, CAST(149.00 AS Decimal(18, 2)), N'Activo', 7)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (8, CAST(0x313C0B00 AS Date), NULL, CAST(181.00 AS Decimal(18, 2)), N'Activo', 8)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (9, CAST(0x313C0B00 AS Date), NULL, CAST(854.00 AS Decimal(18, 2)), N'Activo', 9)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (10, CAST(0xC43B0B00 AS Date), NULL, CAST(200.00 AS Decimal(18, 2)), N'Activo', 10)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (11, CAST(0xC43B0B00 AS Date), NULL, CAST(123.00 AS Decimal(18, 2)), N'Activo', 11)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (12, CAST(0xC43B0B00 AS Date), NULL, CAST(123.00 AS Decimal(18, 2)), N'Activo', 12)
INSERT [dbo].[precio] ([idprecio], [fecha_inicio], [fecha_fin], [valor], [estado], [producto_idproducto]) VALUES (13, CAST(0xC43B0B00 AS Date), NULL, CAST(150.00 AS Decimal(18, 2)), N'Activo', 13)
SET IDENTITY_INSERT [dbo].[precio] OFF
/****** Object:  Table [dbo].[oferta]    Script Date: 08/29/2016 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oferta](
	[idoferta] [int] NOT NULL,
	[porcentaje_descuento] [varchar](45) NULL,
	[estado] [varchar](45) NULL,
	[producto_idproducto] [int] NOT NULL,
 CONSTRAINT [PK_oferta] PRIMARY KEY CLUSTERED 
(
	[idoferta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[registrarUsuario]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[registrarUsuario]
	-- Add the parameters for the stored procedure here
	@cedula char(10),
	@nombres varchar(45),
	@apellidos varchar(45),
	@email varchar(45),
	@celular varchar(45),
	@telefono varchar(45),
	@idRol int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO usuario (cedula,nombres,apellidos,email,celular,telefono,Rol_idRol)
	values (@cedula,@nombres,@apellidos,@email,@celular,@telefono,@idRol);
END
GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[login]
	-- Add the parameters for the stored procedure here
	@email varchar(40),
	@clave varchar(40)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select nombres+' '+apellidos as usuario from usuario where email=@email and clave=@clave
END
GO
/****** Object:  Table [dbo].[imagenes]    Script Date: 08/29/2016 13:53:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[imagenes](
	[idimagenes] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NULL,
	[extension] [varchar](4) NULL,
	[producto_idproducto] [int] NOT NULL,
	[estado] [varchar](45) NULL,
	[tipo] [varchar](50) NULL,
 CONSTRAINT [PK_imagenes] PRIMARY KEY CLUSTERED 
(
	[idimagenes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[imagenes] ON
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (1, N'SamsungJ3-0.png', N'.png', 1, N'Activo', N'Titular')
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (2, N'HuaweiP8-0.png', N'.png', 2, N'Activo', N'Titular')
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (3, N'IphoneSE-0.png', N'.png', 3, N'Activo', N'Titular')
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (4, N'HuaweiMate8-0.png', N'.png', 4, N'Activo', N'Titular')
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (5, N'HuaweiY560-0.png', N'.png', 5, N'Activo', N'Titular')
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (6, N'HuaweiY635-0.png', N'.png', 6, N'Activo', N'Titular')
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (7, N'SonyXperiaE4Usado-0.png', N'.png', 7, N'Activo', N'Titular')
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (8, N'SamsungJ1Negro-0.png', N'.png', 8, N'Activo', N'Titular')
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (9, N'SamsungS6Blanco-0.png', N'.png', 9, N'Activo', N'Titular')
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (16, N'electrodomesticos_menos_consumen.jpg', N'.jpg', 10, N'Activo', N'Titular')
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (17, N'latest-product-img4.jpg', N'.jpg', 12, N'Activo', N'Titular')
INSERT [dbo].[imagenes] ([idimagenes], [nombre], [extension], [producto_idproducto], [estado], [tipo]) VALUES (18, N'taladro-atornillador-gbm-10-2-re.jpg', N'.jpg', 13, N'Activo', N'Titular')
SET IDENTITY_INSERT [dbo].[imagenes] OFF
/****** Object:  StoredProcedure [dbo].[actualizarProducto]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizarProducto]
	-- Add the parameters for the stored procedure here
	@idProducto int,
	@descripcion varchar(45),
	@detalle varchar(max),
	@estado varchar(45),
	@stock int,
	@idCategoria int,
	@idMarca int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update producto set descripcion=@descripcion, detalle=@detalle,estado=@estado,stock=@stock,categoria_idcategoria=@idCategoria,marcas_idmarcas=@idMarca where idproducto=@idProducto;
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerProductosPaginados]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtenerProductosPaginados]
	-- Add the parameters for the stored procedure here
	 @NUM_PAGINA   INT
   ,@totalRegistros   INT,
   @idCategoria varchar(10),
   @idMarca varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	WITH DRV_TBL AS 
   (
      SELECT 
         ROW_NUMBER() OVER (ORDER BY producto.descripcion DESC) AS rownum
         ,producto.idproducto, producto.descripcion, precio.valor, nombre as nomnbreImagen FROM categoria INNER JOIN producto 
	ON categoria.idcategoria = producto.categoria_idcategoria INNER JOIN marcas ON 
	producto.marcas_idmarcas = marcas.idmarcas INNER JOIN precio ON 
	producto.idproducto = precio.producto_idproducto INNER JOIN imagenes on imagenes.producto_idproducto=producto.idproducto  WHERE fecha_fin is null and imagenes.tipo='titular' and categoria_idcategoria like @idCategoria and marcas_idmarcas like @idMarca)

   SELECT * FROM DRV_TBL 
   WHERE ROWNUM BETWEEN (@NUM_PAGINA*@totalRegistros)-@totalRegistros+1 AND (@NUM_PAGINA*@totalRegistros) 
   
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerProductosMasPopulares]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtenerProductosMasPopulares]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
SELECT top 3  producto.idproducto, producto.descripcion, precio.valor, nombre as nomnbreImagen,vistas FROM categoria INNER JOIN producto 
	ON categoria.idcategoria = producto.categoria_idcategoria INNER JOIN marcas ON 
	producto.marcas_idmarcas = marcas.idmarcas INNER JOIN precio ON 
	producto.idproducto = precio.producto_idproducto INNER JOIN imagenes on imagenes.producto_idproducto=producto.idproducto  WHERE fecha_fin is null and imagenes.tipo='titular'
	order by vistas desc
	
	

END
GO
/****** Object:  StoredProcedure [dbo].[obtenerProductosMarcas]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtenerProductosMarcas]
	-- Add the parameters for the stored procedure here
	@idMarcas int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 12 producto.idproducto, producto.descripcion, precio.valor, nombre as nomnbreImagen FROM categoria INNER JOIN producto 
	ON categoria.idcategoria = producto.categoria_idcategoria INNER JOIN marcas ON 
	producto.marcas_idmarcas = marcas.idmarcas INNER JOIN precio ON 
	producto.idproducto = precio.producto_idproducto INNER JOIN imagenes on imagenes.producto_idproducto=producto.idproducto  WHERE fecha_fin is null and marcas.idmarcas=@idMarcas and imagenes.tipo='titular' ;
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerProductosCategoria]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtenerProductosCategoria]
	-- Add the parameters for the stored procedure here
	@idCategoria int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT top 12 producto.idproducto, producto.descripcion, precio.valor, nombre as nomnbreImagen FROM categoria INNER JOIN producto 
	ON categoria.idcategoria = producto.categoria_idcategoria INNER JOIN marcas ON 
	producto.marcas_idmarcas = marcas.idmarcas INNER JOIN precio ON 
	producto.idproducto = precio.producto_idproducto INNER JOIN imagenes on imagenes.producto_idproducto=producto.idproducto  WHERE fecha_fin is null and categoria.idcategoria=@idCategoria and imagenes.tipo='titular' ;
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerProductos]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtenerProductos]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 12 producto.idproducto, producto.descripcion, precio.valor, nombre as nomnbreImagen FROM categoria INNER JOIN producto 
	ON categoria.idcategoria = producto.categoria_idcategoria INNER JOIN marcas ON 
	producto.marcas_idmarcas = marcas.idmarcas INNER JOIN precio ON 
	producto.idproducto = precio.producto_idproducto INNER JOIN imagenes on imagenes.producto_idproducto=producto.idproducto  WHERE fecha_fin is null and imagenes.tipo='titular';
	END
GO
/****** Object:  StoredProcedure [dbo].[actualizarImagen]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizarImagen]
	-- Add the parameters for the stored procedure here
	@idImagen int,
	@nombre varchar(45),
	@extension varchar(45),
	@idProducto int,
	@estado varchar(45)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update imagenes set nombre=@nombre,extension=@extension,producto_idproducto=@idProducto,estado=@estado where idimagenes=@idImagen;
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarPrecio]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizarPrecio] 
	-- Add the parameters for the stored procedure here
	@fecha_inicio date,
	@valor decimal(18,2),
	@idProducto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update precio set fecha_fin=@fecha_inicio where producto_idproducto=@idProducto;
    -- Insert statements for procedure here
	INSERT INTO precio (fecha_inicio,valor,estado,producto_idproducto) values
    (@fecha_inicio,@valor,'Activo',@idProducto);
END
GO
/****** Object:  StoredProcedure [dbo].[registrarPrecio]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[registrarPrecio]
	-- Add the parameters for the stored procedure here
	@fecha_inicio datetime,
	@valor decimal(18,2)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @idProducto as int 
	SET @idProducto= (SELECT top 1 idproducto from producto order by idproducto desc)

    -- Insert statements for procedure here
    INSERT INTO precio (fecha_inicio,valor,estado,producto_idproducto) values
    (@fecha_inicio,@valor,'Activo',@idProducto);
	
END
GO
/****** Object:  StoredProcedure [dbo].[registrarImagen]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[registrarImagen] 
	-- Add the parameters for the stored procedure here
	@nombre varchar(45),
	@extension varchar(45)
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @idProducto as int 
	SET @idProducto= (SELECT top 1 idproducto from producto order by idproducto desc)
	INSERT INTO imagenes (nombre,extension,producto_idproducto,estado,tipo) values
	(@nombre,@extension,@idProducto,'Activo','Titular');


END
GO
/****** Object:  StoredProcedure [dbo].[obtenerImagenes]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtenerImagenes] 
	-- Add the parameters for the stored procedure here
	@idProducto as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select nombre from imagenes where producto_idproducto=@idProducto
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerDetalleProducto]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtenerDetalleProducto]
	-- Add the parameters for the stored procedure here
	@idProducto int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT producto.idproducto, producto.descripcion,producto.detalle, precio.valor,  producto.modelo,producto.stock,imagenes.nombre  FROM categoria INNER JOIN producto 
	ON categoria.idcategoria = producto.categoria_idcategoria INNER JOIN marcas ON 
	producto.marcas_idmarcas = marcas.idmarcas INNER JOIN precio ON 
	producto.idproducto = precio.producto_idproducto inner join imagenes on producto.idproducto=imagenes.producto_idproducto WHERE fecha_fin is null and producto.idproducto=@idProducto;
END
GO
/****** Object:  StoredProcedure [dbo].[registrarProducto]    Script Date: 08/29/2016 13:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[registrarProducto]
	-- Add the parameters for the stored procedure here
	@descripcion varchar(45),
	@detalle varchar(max),
	@stock int,
	@idCategoria int,
	@idMarcas int,	
	@valores decimal,
	@fecha datetime,
	@modelo varchar(40)
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into producto (descripcion,detalle,estado,stock,categoria_idcategoria,marcas_idmarcas,modelo)
	values (@descripcion,@detalle,'Activo',@stock,@idCategoria,@idMarcas, @modelo);
	
	
DECLARE	@return_value int
	EXEC	@return_value = [dbo].[registrarPrecio]
		@fecha_inicio = @fecha,
		@valor = @valores
END
GO
/****** Object:  ForeignKey [fk_imagenes_producto1]    Script Date: 08/29/2016 13:53:21 ******/
ALTER TABLE [dbo].[imagenes]  WITH CHECK ADD  CONSTRAINT [fk_imagenes_producto1] FOREIGN KEY([producto_idproducto])
REFERENCES [dbo].[producto] ([idproducto])
GO
ALTER TABLE [dbo].[imagenes] CHECK CONSTRAINT [fk_imagenes_producto1]
GO
/****** Object:  ForeignKey [fk_oferta_producto1]    Script Date: 08/29/2016 13:53:21 ******/
ALTER TABLE [dbo].[oferta]  WITH CHECK ADD  CONSTRAINT [fk_oferta_producto1] FOREIGN KEY([producto_idproducto])
REFERENCES [dbo].[producto] ([idproducto])
GO
ALTER TABLE [dbo].[oferta] CHECK CONSTRAINT [fk_oferta_producto1]
GO
/****** Object:  ForeignKey [fk_precio_producto1]    Script Date: 08/29/2016 13:53:21 ******/
ALTER TABLE [dbo].[precio]  WITH CHECK ADD  CONSTRAINT [fk_precio_producto1] FOREIGN KEY([producto_idproducto])
REFERENCES [dbo].[producto] ([idproducto])
GO
ALTER TABLE [dbo].[precio] CHECK CONSTRAINT [fk_precio_producto1]
GO
/****** Object:  ForeignKey [fk_producto_categoria]    Script Date: 08/29/2016 13:53:21 ******/
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [fk_producto_categoria] FOREIGN KEY([categoria_idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [fk_producto_categoria]
GO
/****** Object:  ForeignKey [fk_producto_marcas1]    Script Date: 08/29/2016 13:53:21 ******/
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [fk_producto_marcas1] FOREIGN KEY([marcas_idmarcas])
REFERENCES [dbo].[marcas] ([idmarcas])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [fk_producto_marcas1]
GO
/****** Object:  ForeignKey [fk_usuario_Rol1]    Script Date: 08/29/2016 13:53:21 ******/
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [fk_usuario_Rol1] FOREIGN KEY([Rol_idRol])
REFERENCES [dbo].[rol] ([idRol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [fk_usuario_Rol1]
GO
