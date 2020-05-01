USE [NodeOrders]
GO
/****** Object:  Table [dbo].[CDTable]    Script Date: 5/3/2016 5:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CDTable](
	[CdID] [int] IDENTITY(1,1) NOT NULL,
	[CDname] [nvarchar](50) NOT NULL,
	[Artist] [nvarchar](50) NOT NULL,
	[RecordCompany] [nvarchar](50) NOT NULL,
	[YearReleased] [int] NOT NULL,
	[ListPrice] [money] NOT NULL,
 CONSTRAINT [PK_CDtable] PRIMARY KEY CLUSTERED 
(
	[CdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 5/3/2016 5:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[CdID] [int] NOT NULL,
	[ItemQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/3/2016 5:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrdersID] [int] IDENTITY(1,1) NOT NULL,
	[StoreNumberID] [int] NOT NULL,
	[SalesPersonID] [int] NOT NULL,
	[CdID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Datetime] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrdersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesPersonTable]    Script Date: 5/3/2016 5:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPersonTable](
	[SalesPersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[StoreNumberID] [int] NOT NULL,
 CONSTRAINT [PK_SalesPersonTable] PRIMARY KEY CLUSTERED 
(
	[SalesPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StoreTable]    Script Date: 5/3/2016 5:00:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreTable](
	[StoreNumberID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[NumberEmployees] [int] NOT NULL,
 CONSTRAINT [PK_StoreTable] PRIMARY KEY CLUSTERED 
(
	[StoreNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_CDTable] FOREIGN KEY([CdID])
REFERENCES [dbo].[CDTable] ([CdID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_CDTable]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CDTable] FOREIGN KEY([CdID])
REFERENCES [dbo].[CDTable] ([CdID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_CDTable]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SalesPersonTable] FOREIGN KEY([SalesPersonID])
REFERENCES [dbo].[SalesPersonTable] ([SalesPersonID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_SalesPersonTable]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_StoreTable] FOREIGN KEY([StoreNumberID])
REFERENCES [dbo].[StoreTable] ([StoreNumberID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_StoreTable]
GO
ALTER TABLE [dbo].[SalesPersonTable]  WITH CHECK ADD  CONSTRAINT [FK_SalesPersonTable_StoreTable] FOREIGN KEY([StoreNumberID])
REFERENCES [dbo].[StoreTable] ([StoreNumberID])
GO
ALTER TABLE [dbo].[SalesPersonTable] CHECK CONSTRAINT [FK_SalesPersonTable_StoreTable]
GO
