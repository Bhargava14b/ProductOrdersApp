USE [master]
GO
/****** Object:  Database [InventoryDB]    Script Date: 28-03-2020 12:45:39 ******/
CREATE DATABASE [InventoryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\InventoryDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InventoryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\InventoryDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InventoryDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventoryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventoryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventoryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventoryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventoryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventoryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventoryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventoryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventoryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventoryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventoryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventoryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventoryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventoryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventoryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InventoryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventoryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventoryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventoryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventoryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventoryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventoryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventoryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [InventoryDB] SET  MULTI_USER 
GO
ALTER DATABASE [InventoryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventoryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventoryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventoryDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [InventoryDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'InventoryDB', N'ON'
GO
USE [InventoryDB]
GO
/****** Object:  Table [dbo].[tbl_Brands]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Brands](
	[Brand_Id] [int] NOT NULL,
	[Brand_Name] [varchar](50) NOT NULL,
	[Brand_Status] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Brands] PRIMARY KEY CLUSTERED 
(
	[Brand_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Categories]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Categories](
	[Category_Id] [int] NOT NULL,
	[Category_Name] [varchar](50) NULL,
	[Category_Status] [int] NULL,
 CONSTRAINT [PK_tbl_Categories] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Groups]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Groups](
	[Group_Id] [int] NOT NULL,
	[Group_Name] [varchar](50) NOT NULL,
	[Menu_Access] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Groups] PRIMARY KEY CLUSTERED 
(
	[Group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Orders]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Orders](
	[Order_Id] [int] NOT NULL,
	[Product_Id] [int] NULL,
	[Items_Count] [int] NULL,
	[Product_Cost] [numeric](18, 0) NULL,
	[Amount] [numeric](18, 0) NULL,
	[Bill_No] [varchar](50) NOT NULL,
	[Customer_Name] [varchar](50) NULL,
	[Customer_Address] [varchar](50) NULL,
	[Customer_Phone] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Gross_Amount] [numeric](18, 0) NULL,
	[Service_Charge] [numeric](18, 0) NULL,
	[Vat_Charge] [numeric](18, 0) NULL,
	[Discount] [numeric](18, 0) NULL,
	[NetAmount] [numeric](18, 0) NULL,
	[Paid_Status] [int] NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_tbl_Orders] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Products]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Products](
	[Product_ID] [int] NOT NULL,
	[Product_Name] [varchar](50) NOT NULL,
	[SKU] [varchar](50) NOT NULL,
	[Supplier_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Brand_Id] [int] NOT NULL,
	[Store_Id] [int] NOT NULL,
	[Product_Description] [varchar](50) NOT NULL,
	[Product_Quantity] [int] NOT NULL,
	[Price] [numeric](18, 0) NOT NULL,
	[ExpiryDate] [datetime] NULL,
	[Availability] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Products] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Stores]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Stores](
	[Store_Id] [int] NOT NULL,
	[Store_Name] [varchar](50) NULL,
	[Store_Status] [int] NULL,
 CONSTRAINT [PK_tbl_Stores] PRIMARY KEY CLUSTERED 
(
	[Store_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Supplier]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Supplier](
	[Supplier_Id] [int] NOT NULL,
	[Supplier_Name] [varchar](50) NULL,
	[Service_Charge_Value] [varchar](50) NULL,
	[Vat_Charge_Value] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[Phone] [varchar](13) NULL,
	[Country] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Currency] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Companies] PRIMARY KEY CLUSTERED 
(
	[Supplier_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[User_Id] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Gender] [char](1) NULL,
	[Phone] [varchar](50) NULL,
	[User_Name] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email_Id] [varchar](50) NULL,
	[Group_Id] [int] NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tbl_Orders]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Orders_tbl_Products] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[tbl_Products] ([Product_ID])
GO
ALTER TABLE [dbo].[tbl_Orders] CHECK CONSTRAINT [FK_tbl_Orders_tbl_Products]
GO
ALTER TABLE [dbo].[tbl_Orders]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Orders_tbl_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[tbl_Users] ([User_Id])
GO
ALTER TABLE [dbo].[tbl_Orders] CHECK CONSTRAINT [FK_tbl_Orders_tbl_Users]
GO
ALTER TABLE [dbo].[tbl_Products]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Products_tbl_Categories] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[tbl_Categories] ([Category_Id])
GO
ALTER TABLE [dbo].[tbl_Products] CHECK CONSTRAINT [FK_tbl_Products_tbl_Categories]
GO
ALTER TABLE [dbo].[tbl_Products]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Products_tbl_Stores] FOREIGN KEY([Store_Id])
REFERENCES [dbo].[tbl_Stores] ([Store_Id])
GO
ALTER TABLE [dbo].[tbl_Products] CHECK CONSTRAINT [FK_tbl_Products_tbl_Stores]
GO
/****** Object:  StoredProcedure [dbo].[Add_Store]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Store]
@Store_Name varchar(10),
@store_status int
as

insert into [dbo].[tbl_Stores] values (@Store_Name ,@store_status)

GO
/****** Object:  StoredProcedure [dbo].[delete_Store]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_Store]

@store_Id	int
as

delete from  [dbo].[tbl_Stores] where [Store_Id]=@store_Id	

GO
/****** Object:  StoredProcedure [dbo].[Search_Store]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Search_Store]

@store_Id	int
as

select *  from  [dbo].[tbl_Stores] where [Store_Id]=@store_Id	

GO
/****** Object:  StoredProcedure [dbo].[Update_Store]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Store]
@Store_Name varchar(10),
@store_status int,
@store_Id	int
as

update [dbo].[tbl_Stores] set [Store_Name]=@Store_Name ,[Store_Status]=@store_status where [Store_Id]=@store_Id	

GO
/****** Object:  StoredProcedure [dbo].[ViewAll_Stores]    Script Date: 28-03-2020 12:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ViewAll_Stores]
as
select *  from  [dbo].[tbl_Stores] 

GO
USE [master]
GO
ALTER DATABASE [InventoryDB] SET  READ_WRITE 
GO
