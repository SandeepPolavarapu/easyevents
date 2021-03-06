USE [master]
GO
/****** Object:  Database [easyevents]    Script Date: 11/24/2015 7:46:16 AM ******/
CREATE DATABASE [easyevents]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'easyevents_data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\easyevents_data.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'easyevents_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\easyevents_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [easyevents] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [easyevents].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [easyevents] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [easyevents] SET ANSI_NULLS ON 
GO
ALTER DATABASE [easyevents] SET ANSI_PADDING ON 
GO
ALTER DATABASE [easyevents] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [easyevents] SET ARITHABORT ON 
GO
ALTER DATABASE [easyevents] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [easyevents] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [easyevents] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [easyevents] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [easyevents] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [easyevents] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [easyevents] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [easyevents] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [easyevents] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [easyevents] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [easyevents] SET  DISABLE_BROKER 
GO
ALTER DATABASE [easyevents] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [easyevents] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [easyevents] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [easyevents] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [easyevents] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [easyevents] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [easyevents] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [easyevents] SET RECOVERY FULL 
GO
ALTER DATABASE [easyevents] SET  MULTI_USER 
GO
ALTER DATABASE [easyevents] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [easyevents] SET DB_CHAINING OFF 
GO
ALTER DATABASE [easyevents] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [easyevents] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [easyevents]
GO
/****** Object:  User [easyevents]    Script Date: 11/24/2015 7:46:22 AM ******/
CREATE USER [easyevents] FOR LOGIN [easyevents] WITH DEFAULT_SCHEMA=[easyevents]
GO
ALTER ROLE [db_owner] ADD MEMBER [easyevents]
GO
/****** Object:  Schema [easyevents]    Script Date: 11/24/2015 7:46:25 AM ******/
CREATE SCHEMA [easyevents]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/24/2015 7:46:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[PluralName] [varchar](100) NOT NULL,
	[DbModifiedUtc] [datetime] NULL,
	[DbCreatedUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[CatererMasterMenu]    Script Date: 11/24/2015 7:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CatererMasterMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[CategoryId] [tinyint] NOT NULL,
	[PartnerId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DbModifiedUtc] [datetime] NULL,
	[DbCreatedUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[CatererPackage]    Script Date: 11/24/2015 7:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CatererPackage](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[PartnerId] [tinyint] NOT NULL,
	[Price] [money] NOT NULL,
	[MinPerson] [smallint] NOT NULL,
	[ItemsCount] [tinyint] NOT NULL,
	[IsVeg] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DbModifiedUtc] [datetime] NULL,
	[DbCreatedUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[CatererPackageMenu]    Script Date: 11/24/2015 7:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatererPackageMenu](
	[PackageId] [smallint] NOT NULL,
	[PackageXML] [xml] NOT NULL,
	[DbModifiedUtc] [datetime] NULL,
	[DbCreatedUtc] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CateringOrder]    Script Date: 11/24/2015 7:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CateringOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Phone] [varchar](30) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[PackageId] [smallint] NOT NULL,
	[EventDate] [date] NOT NULL,
	[IsCancelled] [bit] NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[DbModifiedUtc] [datetime] NULL,
	[DbCreatedUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[CateringReview]    Script Date: 11/24/2015 7:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CateringReview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[OrderId] [int] NOT NULL,
	[Rating] [tinyint] NOT NULL,
	[Review] [varchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DbModifiedUtc] [datetime] NULL,
	[DbCreatedUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[City]    Script Date: 11/24/2015 7:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[PartnerOnly] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DbModifiedUtc] [datetime] NULL,
	[DbCreatedUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 11/24/2015 7:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[QueryType] [varchar](10) NOT NULL,
	[Message] [varchar](500) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DbModifiedUtc] [datetime] NULL,
	[DbCreatedUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 11/24/2015 7:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Partner](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](30) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[PartnerTypeId] [tinyint] NOT NULL,
	[DisplayName] [varchar](200) NOT NULL,
	[EmailId] [varchar](200) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DbModifiedUtc] [datetime] NULL,
	[DbCreatedUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[PartnerType]    Script Date: 11/24/2015 7:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PartnerType](
	[Id] [tinyint] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[DbModifiedUtc] [datetime] NULL,
	[DbCreatedUtc] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 11/24/2015 7:46:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Venue](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Area] [varchar](100) NOT NULL,
	[Pincode] [char](6) NOT NULL,
	[CityId] [tinyint] NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Latitude] [varchar](15) NULL,
	[Longitude] [varchar](15) NULL,
	[Rent] [money] NOT NULL,
	[Capacity] [smallint] NOT NULL,
	[IsAirConditioned] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[HasPhotos] [bit] NULL,
	[DbModifiedUtc] [datetime] NULL,
	[DbCreatedUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1, N'Welcome Sweet', N'Welcome Sweets', CAST(0x0000A2BC011E0514 AS DateTime), CAST(0x0000A2BC011E0514 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (2, N'Welcome Hot', N'Welcome Hots', CAST(0x0000A2BC011E0516 AS DateTime), CAST(0x0000A2BC011E0516 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (3, N'Chat Item', N'Chat Items', CAST(0x0000A2BC011E0518 AS DateTime), CAST(0x0000A2BC011E0518 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (4, N'Chinese Item', N'Chinese Items', CAST(0x0000A2BC011E0519 AS DateTime), CAST(0x0000A2BC011E0519 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (5, N'Rajasthan Counter', N'Rajasthan Counter', CAST(0x0000A2BC011E051B AS DateTime), CAST(0x0000A2BC011E051B AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6, N'Bandar Masala Counter', N'Bandar Masala Counter', CAST(0x0000A2BC011E051C AS DateTime), CAST(0x0000A2BC011E051C AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (7, N'Mocktail Counter', N'Mocktail Counter', CAST(0x0000A2BC011E051D AS DateTime), CAST(0x0000A2BC011E051D AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (8, N'Juice', N'Juices', CAST(0x0000A2BC011E051F AS DateTime), CAST(0x0000A2BC011E051F AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (9, N'Sweet', N'Sweets', CAST(0x0000A2BC011E0520 AS DateTime), CAST(0x0000A2BC011E0520 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (10, N'Hot', N'Hots', CAST(0x0000A2BC011E0521 AS DateTime), CAST(0x0000A2BC011E0521 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (11, N'Roti', N'Roties', CAST(0x0000A2BC011E0523 AS DateTime), CAST(0x0000A2BC011E0523 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (12, N'Roti Curry', N'Roti Curries', CAST(0x0000A2BC011E0524 AS DateTime), CAST(0x0000A2BC011E0524 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (13, N'Special Rice', N'Special Rice', CAST(0x0000A2BC011E0526 AS DateTime), CAST(0x0000A2BC011E0526 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (14, N'Raita', N'Raita', CAST(0x0000A2BC011E0527 AS DateTime), CAST(0x0000A2BC011E0527 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (15, N'Kurma', N'Kurma', CAST(0x0000A2BC011E0529 AS DateTime), CAST(0x0000A2BC011E0529 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (16, N'Rice', N'Rice', CAST(0x0000A2BC011E052A AS DateTime), CAST(0x0000A2BC011E052A AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (17, N'Dal Curry', N'Dal Curries', CAST(0x0000A2BC011E052B AS DateTime), CAST(0x0000A2BC011E052B AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (18, N'Fry Curry', N'Fry Curries', CAST(0x0000A2BC011E052C AS DateTime), CAST(0x0000A2BC011E052C AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (19, N'Gravy Curry', N'Gravy Curries', CAST(0x0000A2BC011E052D AS DateTime), CAST(0x0000A2BC011E052D AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (20, N'Pickle', N'Pickles', CAST(0x0000A2BC011E052F AS DateTime), CAST(0x0000A2BC011E052F AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (21, N'Grind Chutney', N'Grind Chutneys', CAST(0x0000A2BC011E0530 AS DateTime), CAST(0x0000A2BC011E0530 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (22, N'Liquid', N'Liquids', CAST(0x0000A2BC011E0531 AS DateTime), CAST(0x0000A2BC011E0531 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (23, N'Papad', N'Papads', CAST(0x0000A2BC011E0533 AS DateTime), CAST(0x0000A2BC011E0533 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (24, N'Curd', N'Curds', CAST(0x0000A2BC011E0534 AS DateTime), CAST(0x0000A2BC011E0534 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (25, N'Ice Cream', N'Ice Creams', CAST(0x0000A2BC011E0535 AS DateTime), CAST(0x0000A2BC011E0535 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (26, N'Paan', N'Paan', CAST(0x0000A2BC011E0536 AS DateTime), CAST(0x0000A2BC011E0536 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (27, N'Water', N'Water', CAST(0x0000A2BC011E0537 AS DateTime), CAST(0x0000A2BC011E0537 AS DateTime))
GO
INSERT [dbo].[Category] ([Id], [Name], [PluralName], [DbModifiedUtc], [DbCreatedUtc]) VALUES (28, N'Cut Fruit', N'Cut Fruits', CAST(0x0000A2BC011E0539 AS DateTime), CAST(0x0000A2BC011E0539 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CatererMasterMenu] ON 

GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1, N'Kaju Ball', 1, 1, 1, CAST(0x0000A2C201348D8D AS DateTime), CAST(0x0000A2C201348D8D AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (2, N'Pista Ball', 1, 1, 1, CAST(0x0000A2C201348D8D AS DateTime), CAST(0x0000A2C201348D8D AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (3, N'Badam Ball', 1, 1, 1, CAST(0x0000A2C201348D8E AS DateTime), CAST(0x0000A2C201348D8E AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (4, N'Orange Roll', 1, 1, 1, CAST(0x0000A2C201348D8E AS DateTime), CAST(0x0000A2C201348D8E AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (5, N'Veg Finger', 2, 1, 1, CAST(0x0000A2C201348D8E AS DateTime), CAST(0x0000A2C201348D8E AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6, N'Dil Pasandh', 2, 1, 1, CAST(0x0000A2C201348D8E AS DateTime), CAST(0x0000A2C201348D8E AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (7, N'Veg Lollypop', 2, 1, 1, CAST(0x0000A2C201348D8F AS DateTime), CAST(0x0000A2C201348D8F AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (8, N'Cut Mirchi', 2, 1, 1, CAST(0x0000A2C201348D8F AS DateTime), CAST(0x0000A2C201348D8F AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (9, N'Bhel Puri', 3, 1, 1, CAST(0x0000A2C201348D90 AS DateTime), CAST(0x0000A2C201348D90 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (10, N'Pani Puri', 3, 1, 1, CAST(0x0000A2C201348D91 AS DateTime), CAST(0x0000A2C201348D91 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (11, N'Samosa Chat', 3, 1, 1, CAST(0x0000A2C201348D92 AS DateTime), CAST(0x0000A2C201348D92 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (12, N'Pav Bhaji', 3, 1, 1, CAST(0x0000A2C201348D94 AS DateTime), CAST(0x0000A2C201348D94 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (13, N'Aloo Tikki', 3, 1, 1, CAST(0x0000A2C201348D95 AS DateTime), CAST(0x0000A2C201348D95 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (14, N'Tomato Kachori', 3, 1, 1, CAST(0x0000A2C201348D95 AS DateTime), CAST(0x0000A2C201348D95 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (15, N'Dahi Puri', 3, 1, 1, CAST(0x0000A2C201348D96 AS DateTime), CAST(0x0000A2C201348D96 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (16, N'Veg Soft Noodles', 4, 1, 1, CAST(0x0000A2C201348D96 AS DateTime), CAST(0x0000A2C201348D96 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (17, N'Veg Fried Noodles', 4, 1, 1, CAST(0x0000A2C201348D98 AS DateTime), CAST(0x0000A2C201348D98 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (18, N'Veg Manchuria', 4, 1, 1, CAST(0x0000A2C201348D98 AS DateTime), CAST(0x0000A2C201348D98 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (19, N'Chinese Fried Rice', 4, 1, 1, CAST(0x0000A2C201348D9A AS DateTime), CAST(0x0000A2C201348D9A AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (20, N'Paneer Corn', 4, 1, 1, CAST(0x0000A2C201348D9A AS DateTime), CAST(0x0000A2C201348D9A AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (21, N'Veg Dumpling', 4, 1, 1, CAST(0x0000A2C201348D9C AS DateTime), CAST(0x0000A2C201348D9C AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (22, N'Corn Cubes', 4, 1, 1, CAST(0x0000A2C201348D9D AS DateTime), CAST(0x0000A2C201348D9D AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (23, N'Mongolia Sizzler', 4, 1, 1, CAST(0x0000A2C201348D9E AS DateTime), CAST(0x0000A2C201348D9E AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (24, N'Veg Tawa Sizzler', 4, 1, 1, CAST(0x0000A2C201348D9F AS DateTime), CAST(0x0000A2C201348D9F AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (25, N'Bhutan Vegetables', 4, 1, 1, CAST(0x0000A2C201348DA0 AS DateTime), CAST(0x0000A2C201348DA0 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (26, N'Blue Lagoon', 7, 1, 1, CAST(0x0000A2C201348DA0 AS DateTime), CAST(0x0000A2C201348DA0 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (27, N'Green Lady', 7, 1, 1, CAST(0x0000A2C201348DA1 AS DateTime), CAST(0x0000A2C201348DA1 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (28, N'Virgin Mojito', 7, 1, 1, CAST(0x0000A2C201348DA1 AS DateTime), CAST(0x0000A2C201348DA1 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (29, N'Strawberry Punch', 7, 1, 1, CAST(0x0000A2C201348DA2 AS DateTime), CAST(0x0000A2C201348DA2 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (30, N'Grape Delight', 7, 1, 1, CAST(0x0000A2C201348DA3 AS DateTime), CAST(0x0000A2C201348DA3 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (31, N'Grape Juice', 8, 1, 1, CAST(0x0000A2C201348DA3 AS DateTime), CAST(0x0000A2C201348DA3 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (32, N'Grape Pulpy Kulpy', 8, 1, 1, CAST(0x0000A2C201348DA3 AS DateTime), CAST(0x0000A2C201348DA3 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (33, N'Water Melon', 8, 1, 1, CAST(0x0000A2C201348DA3 AS DateTime), CAST(0x0000A2C201348DA3 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (34, N'Fruit Punch', 8, 1, 1, CAST(0x0000A2C201348DA4 AS DateTime), CAST(0x0000A2C201348DA4 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (35, N'Cool Drinks', 8, 1, 1, CAST(0x0000A2C201348DA4 AS DateTime), CAST(0x0000A2C201348DA4 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (36, N'Strawberry Milk', 8, 1, 1, CAST(0x0000A2C201348DA4 AS DateTime), CAST(0x0000A2C201348DA4 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (37, N'Badam Milk', 8, 1, 1, CAST(0x0000A2C201348DA5 AS DateTime), CAST(0x0000A2C201348DA5 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (38, N'Karbuja Juice', 8, 1, 1, CAST(0x0000A2C201348DA5 AS DateTime), CAST(0x0000A2C201348DA5 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (39, N'Mango Juice', 8, 1, 1, CAST(0x0000A2C201348DA5 AS DateTime), CAST(0x0000A2C201348DA5 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (40, N'Chocolate Milk Shake', 8, 1, 1, CAST(0x0000A2C201348DA6 AS DateTime), CAST(0x0000A2C201348DA6 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (41, N'Coke Tins', 8, 1, 1, CAST(0x0000A2C201348DA6 AS DateTime), CAST(0x0000A2C201348DA6 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (42, N'Chakra Pongali', 9, 1, 1, CAST(0x0000A2C201348DA6 AS DateTime), CAST(0x0000A2C201348DA6 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (43, N'Poornam', 9, 1, 1, CAST(0x0000A2C201348DA6 AS DateTime), CAST(0x0000A2C201348DA6 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (44, N'Dry Fruit Halwa', 9, 1, 1, CAST(0x0000A2C201348DA7 AS DateTime), CAST(0x0000A2C201348DA7 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (45, N'Kaju Sweets', 9, 1, 1, CAST(0x0000A2C201348DA7 AS DateTime), CAST(0x0000A2C201348DA7 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (46, N'Litchi Wine', 9, 1, 1, CAST(0x0000A2C201348DA7 AS DateTime), CAST(0x0000A2C201348DA7 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (47, N'Fruit Cocktail', 9, 1, 1, CAST(0x0000A2C201348DA8 AS DateTime), CAST(0x0000A2C201348DA8 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (48, N'Mango Delight', 9, 1, 1, CAST(0x0000A2C201348DA8 AS DateTime), CAST(0x0000A2C201348DA8 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (49, N'Strawberry Rasamalay', 9, 1, 1, CAST(0x0000A2C201348DA8 AS DateTime), CAST(0x0000A2C201348DA8 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (50, N'Malpuri Khova', 9, 1, 1, CAST(0x0000A2C201348DA9 AS DateTime), CAST(0x0000A2C201348DA9 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (51, N'Tawa Mixed Sweet', 9, 1, 1, CAST(0x0000A2C201348DA9 AS DateTime), CAST(0x0000A2C201348DA9 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (52, N'Fruit Cake', 9, 1, 1, CAST(0x0000A2C201348DA9 AS DateTime), CAST(0x0000A2C201348DA9 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (53, N'Paneer Jalebi', 9, 1, 1, CAST(0x0000A2C201348DA9 AS DateTime), CAST(0x0000A2C201348DA9 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (54, N'Kiwi Cop', 9, 1, 1, CAST(0x0000A2C201348DAA AS DateTime), CAST(0x0000A2C201348DAA AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (55, N'American Malpuri', 9, 1, 1, CAST(0x0000A2C201348DAA AS DateTime), CAST(0x0000A2C201348DAA AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (56, N'Dry Fruit Delight', 9, 1, 1, CAST(0x0000A2C201348DAA AS DateTime), CAST(0x0000A2C201348DAA AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (57, N'Indrapuri', 9, 1, 1, CAST(0x0000A2C201348DAB AS DateTime), CAST(0x0000A2C201348DAB AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (58, N'Badam Rokhi', 9, 1, 1, CAST(0x0000A2C201348DAB AS DateTime), CAST(0x0000A2C201348DAB AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (59, N'Junnu', 9, 1, 1, CAST(0x0000A2C201348DAB AS DateTime), CAST(0x0000A2C201348DAB AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (60, N'Gajar Halwa', 9, 1, 1, CAST(0x0000A2C201348DAC AS DateTime), CAST(0x0000A2C201348DAC AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (61, N'Navarang Pan', 9, 1, 1, CAST(0x0000A2C201348DAD AS DateTime), CAST(0x0000A2C201348DAD AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (62, N'Malai Sandwich', 9, 1, 1, CAST(0x0000A2C201348DAF AS DateTime), CAST(0x0000A2C201348DAF AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (63, N'Bobattu', 9, 1, 1, CAST(0x0000A2C201348DB0 AS DateTime), CAST(0x0000A2C201348DB0 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (64, N'Carrot Sorakaya Halwa', 9, 1, 1, CAST(0x0000A2C201348DB2 AS DateTime), CAST(0x0000A2C201348DB2 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (65, N'Bread Halwa', 9, 1, 1, CAST(0x0000A2C201348DB3 AS DateTime), CAST(0x0000A2C201348DB3 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (66, N'Gaare', 10, 1, 1, CAST(0x0000A2C201348DB5 AS DateTime), CAST(0x0000A2C201348DB5 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (67, N'Smile Heart', 10, 1, 1, CAST(0x0000A2C201348DB6 AS DateTime), CAST(0x0000A2C201348DB6 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (68, N'Veg Roll', 10, 1, 1, CAST(0x0000A2C201348DB8 AS DateTime), CAST(0x0000A2C201348DB8 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (69, N'Veg Fingers', 10, 1, 1, CAST(0x0000A2C201348DB9 AS DateTime), CAST(0x0000A2C201348DB9 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (70, N'Shanghai Roll', 10, 1, 1, CAST(0x0000A2C201348DB9 AS DateTime), CAST(0x0000A2C201348DB9 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (71, N'Corn Samosa', 10, 1, 1, CAST(0x0000A2C201348DBA AS DateTime), CAST(0x0000A2C201348DBA AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (72, N'Corn Roll', 10, 1, 1, CAST(0x0000A2C201348DBB AS DateTime), CAST(0x0000A2C201348DBB AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (73, N'Palak Roll', 10, 1, 1, CAST(0x0000A2C201348DBB AS DateTime), CAST(0x0000A2C201348DBB AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (74, N'Gold Coin', 10, 1, 1, CAST(0x0000A2C201348DBB AS DateTime), CAST(0x0000A2C201348DBB AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (75, N'Corn Cutlet', 10, 1, 1, CAST(0x0000A2C201348DBB AS DateTime), CAST(0x0000A2C201348DBB AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (76, N'Paneer Vada', 10, 1, 1, CAST(0x0000A2C201348DBC AS DateTime), CAST(0x0000A2C201348DBC AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (77, N'Paneer Tikka', 10, 1, 1, CAST(0x0000A2C201348DBC AS DateTime), CAST(0x0000A2C201348DBC AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (78, N'Cutlet', 10, 1, 1, CAST(0x0000A2C201348DBC AS DateTime), CAST(0x0000A2C201348DBC AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (79, N'Masala Vada', 10, 1, 1, CAST(0x0000A2C201348DBD AS DateTime), CAST(0x0000A2C201348DBD AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (80, N'Mirchi Bajji', 10, 1, 1, CAST(0x0000A2C201348DBD AS DateTime), CAST(0x0000A2C201348DBD AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (81, N'Masala Kulcha', 11, 1, 1, CAST(0x0000A2C201348DBD AS DateTime), CAST(0x0000A2C201348DBD AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (82, N'Rumali Roti', 11, 1, 1, CAST(0x0000A2C201348DBE AS DateTime), CAST(0x0000A2C201348DBE AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (83, N'Pulka', 11, 1, 1, CAST(0x0000A2C201348DBE AS DateTime), CAST(0x0000A2C201348DBE AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (84, N'Paratha', 11, 1, 1, CAST(0x0000A2C201348DBE AS DateTime), CAST(0x0000A2C201348DBE AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (85, N'Lachha Paratha', 11, 1, 1, CAST(0x0000A2C201348DBE AS DateTime), CAST(0x0000A2C201348DBE AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (86, N'Pudhina Paratha', 11, 1, 1, CAST(0x0000A2C201348DBF AS DateTime), CAST(0x0000A2C201348DBF AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (87, N'Tandoori Roti', 11, 1, 1, CAST(0x0000A2C201348DBF AS DateTime), CAST(0x0000A2C201348DBF AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (88, N'Butter Naan', 11, 1, 1, CAST(0x0000A2C201348DBF AS DateTime), CAST(0x0000A2C201348DBF AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (89, N'Palak Paratha', 11, 1, 1, CAST(0x0000A2C201348DC0 AS DateTime), CAST(0x0000A2C201348DC0 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (90, N'Baby Naan', 11, 1, 1, CAST(0x0000A2C201348DC0 AS DateTime), CAST(0x0000A2C201348DC0 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (91, N'Naan', 11, 1, 1, CAST(0x0000A2C201348DC0 AS DateTime), CAST(0x0000A2C201348DC0 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (92, N'Methi Chaman Kurma', 12, 1, 1, CAST(0x0000A2C201348DC1 AS DateTime), CAST(0x0000A2C201348DC1 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (93, N'Paneer Kurma', 12, 1, 1, CAST(0x0000A2C201348DC1 AS DateTime), CAST(0x0000A2C201348DC1 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (94, N'Paneer Butter Masala', 12, 1, 1, CAST(0x0000A2C201348DC1 AS DateTime), CAST(0x0000A2C201348DC1 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (95, N'Palak Paneer Kurma', 12, 1, 1, CAST(0x0000A2C201348DC3 AS DateTime), CAST(0x0000A2C201348DC3 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (96, N'Veg Biryani', 13, 1, 1, CAST(0x0000A2C201348DC4 AS DateTime), CAST(0x0000A2C201348DC4 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (97, N'Fried Rice', 13, 1, 1, CAST(0x0000A2C201348DC6 AS DateTime), CAST(0x0000A2C201348DC6 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (98, N'All Mix Biryani', 13, 1, 1, CAST(0x0000A2C201348DC7 AS DateTime), CAST(0x0000A2C201348DC7 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (99, N'Panasakaya Biryani', 13, 1, 1, CAST(0x0000A2C201348DC7 AS DateTime), CAST(0x0000A2C201348DC7 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (100, N'Pudhina Rice', 13, 1, 1, CAST(0x0000A2C201348DC8 AS DateTime), CAST(0x0000A2C201348DC8 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (101, N'Tomato Rice', 13, 1, 1, CAST(0x0000A2C201348DC9 AS DateTime), CAST(0x0000A2C201348DC9 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (102, N'Kobbari Rice', 13, 1, 1, CAST(0x0000A2C201348DCA AS DateTime), CAST(0x0000A2C201348DCA AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (103, N'Kothimeera Rice', 13, 1, 1, CAST(0x0000A2C201348DCB AS DateTime), CAST(0x0000A2C201348DCB AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (104, N'Sweet Corn Biryani', 13, 1, 1, CAST(0x0000A2C201348DCB AS DateTime), CAST(0x0000A2C201348DCB AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (105, N'Mushroom Biryani', 13, 1, 1, CAST(0x0000A2C201348DCC AS DateTime), CAST(0x0000A2C201348DCC AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (106, N'Baby Corn Biryani', 13, 1, 1, CAST(0x0000A2C201348DCD AS DateTime), CAST(0x0000A2C201348DCD AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (107, N'Pulihora', 13, 1, 1, CAST(0x0000A2C201348DCE AS DateTime), CAST(0x0000A2C201348DCE AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (108, N'Raita', 14, 1, 1, CAST(0x0000A2C201348DCF AS DateTime), CAST(0x0000A2C201348DCF AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (109, N'Vegetable Kurma', 15, 1, 1, CAST(0x0000A2C201348DCF AS DateTime), CAST(0x0000A2C201348DCF AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (110, N'Mirchi Gasala Kurma', 15, 1, 1, CAST(0x0000A2C201348DD0 AS DateTime), CAST(0x0000A2C201348DD0 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (111, N'Phool Makhan Kurma', 15, 1, 1, CAST(0x0000A2C201348DD1 AS DateTime), CAST(0x0000A2C201348DD1 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (112, N'Aloo Kurma', 15, 1, 1, CAST(0x0000A2C201348DD2 AS DateTime), CAST(0x0000A2C201348DD2 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (113, N'Meal Maker Kurma', 15, 1, 1, CAST(0x0000A2C201348DD3 AS DateTime), CAST(0x0000A2C201348DD3 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (114, N'Capsicum Kaju Kurma', 15, 1, 1, CAST(0x0000A2C201348DD3 AS DateTime), CAST(0x0000A2C201348DD3 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (115, N'Kadai Veg', 15, 1, 1, CAST(0x0000A2C201348DD6 AS DateTime), CAST(0x0000A2C201348DD6 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (116, N'Baby Corn Kaju Kurma', 15, 1, 1, CAST(0x0000A2C201348DD7 AS DateTime), CAST(0x0000A2C201348DD7 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (117, N'Mushroom Kaju Kurma', 15, 1, 1, CAST(0x0000A2C201348DDC AS DateTime), CAST(0x0000A2C201348DDC AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (118, N'Mixed Veg Kurma', 15, 1, 1, CAST(0x0000A2C201348DDF AS DateTime), CAST(0x0000A2C201348DDF AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (119, N'White Rice With Ghee', 16, 1, 1, CAST(0x0000A2C201348DE3 AS DateTime), CAST(0x0000A2C201348DE3 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (120, N'Pappu Tomato', 17, 1, 1, CAST(0x0000A2C201348DE8 AS DateTime), CAST(0x0000A2C201348DE8 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (121, N'Aakukura Pappu', 17, 1, 1, CAST(0x0000A2C201348DE9 AS DateTime), CAST(0x0000A2C201348DE9 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (122, N'Pappu Dosakaya', 17, 1, 1, CAST(0x0000A2C201348DEA AS DateTime), CAST(0x0000A2C201348DEA AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (123, N'Mudda Pappu Dapalam', 17, 1, 1, CAST(0x0000A2C201348DEB AS DateTime), CAST(0x0000A2C201348DEB AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (124, N'Avakaya Pappu', 17, 1, 1, CAST(0x0000A2C201348DEC AS DateTime), CAST(0x0000A2C201348DEC AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (125, N'Chinta Chiguru Pappu', 17, 1, 1, CAST(0x0000A2C201348DEE AS DateTime), CAST(0x0000A2C201348DEE AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (126, N'Vakkaya Pappu', 17, 1, 1, CAST(0x0000A2C201348DEE AS DateTime), CAST(0x0000A2C201348DEE AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (127, N'Chinna Usirikaya Pappu', 17, 1, 1, CAST(0x0000A2C201348DF0 AS DateTime), CAST(0x0000A2C201348DF0 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (128, N'Bendi Kobbari Jeedi Pappu Fry', 18, 1, 1, CAST(0x0000A2C201348DF1 AS DateTime), CAST(0x0000A2C201348DF1 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (129, N'Dondakay Cheelikalu Fry', 18, 1, 1, CAST(0x0000A2C201348DF2 AS DateTime), CAST(0x0000A2C201348DF2 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (130, N'Vankay Pakodi Fry', 18, 1, 1, CAST(0x0000A2C201348DF3 AS DateTime), CAST(0x0000A2C201348DF3 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (131, N'Aloo Carrot Mirchi Fry', 18, 1, 1, CAST(0x0000A2C201348DF4 AS DateTime), CAST(0x0000A2C201348DF4 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (132, N'Beans Carrot Fry', 18, 1, 1, CAST(0x0000A2C201348DF5 AS DateTime), CAST(0x0000A2C201348DF5 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (133, N'Cabbage 65', 18, 1, 1, CAST(0x0000A2C201348DF6 AS DateTime), CAST(0x0000A2C201348DF6 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (134, N'Gobi 65', 18, 1, 1, CAST(0x0000A2C201348DF7 AS DateTime), CAST(0x0000A2C201348DF7 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (135, N'Dosakaya 65', 18, 1, 1, CAST(0x0000A2C201348DF8 AS DateTime), CAST(0x0000A2C201348DF8 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (136, N'Baby Corn 65', 18, 1, 1, CAST(0x0000A2C201348DF9 AS DateTime), CAST(0x0000A2C201348DF9 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (137, N'Corn Liver Fry', 18, 1, 1, CAST(0x0000A2C201348DFA AS DateTime), CAST(0x0000A2C201348DFA AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (138, N'Thotakura Liver Fry', 18, 1, 1, CAST(0x0000A2C201348DFB AS DateTime), CAST(0x0000A2C201348DFB AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (139, N'Baby Corn Ulavacharu Fry', 18, 1, 1, CAST(0x0000A2C201348DFC AS DateTime), CAST(0x0000A2C201348DFC AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (140, N'Mushroom Ulavacharu Fry', 18, 1, 1, CAST(0x0000A2C201348DFD AS DateTime), CAST(0x0000A2C201348DFD AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (141, N'Chikkudukaya Fry', 18, 1, 1, CAST(0x0000A2C201348DFE AS DateTime), CAST(0x0000A2C201348DFE AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (142, N'Mixed Veg Fry', 18, 1, 1, CAST(0x0000A2C201348DFF AS DateTime), CAST(0x0000A2C201348DFF AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (143, N'Mushroom Kaju', 19, 1, 1, CAST(0x0000A2C201348E00 AS DateTime), CAST(0x0000A2C201348E00 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (144, N'Baby Corn Kaju', 19, 1, 1, CAST(0x0000A2C201348E01 AS DateTime), CAST(0x0000A2C201348E01 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (145, N'Macaroni Gongura', 19, 1, 1, CAST(0x0000A2C201348E02 AS DateTime), CAST(0x0000A2C201348E02 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (146, N'Dosakaya Jeedi Gullu', 19, 1, 1, CAST(0x0000A2C201348E03 AS DateTime), CAST(0x0000A2C201348E03 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (147, N'Tomato Mulakaya Kaju', 19, 1, 1, CAST(0x0000A2C201348E03 AS DateTime), CAST(0x0000A2C201348E03 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (148, N'Sorakaya Masala', 19, 1, 1, CAST(0x0000A2C201348E04 AS DateTime), CAST(0x0000A2C201348E04 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (149, N'Beerakaya Senagapappu', 19, 1, 1, CAST(0x0000A2C201348E05 AS DateTime), CAST(0x0000A2C201348E05 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (150, N'Capsicum Kaju', 19, 1, 1, CAST(0x0000A2C201348E06 AS DateTime), CAST(0x0000A2C201348E06 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (151, N'Pachi Jeedi Gullu', 19, 1, 1, CAST(0x0000A2C201348E07 AS DateTime), CAST(0x0000A2C201348E07 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (152, N'Mushroom', 19, 1, 1, CAST(0x0000A2C201348E08 AS DateTime), CAST(0x0000A2C201348E08 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (153, N'Vankaya Tomato Kaju', 19, 1, 1, CAST(0x0000A2C201348E09 AS DateTime), CAST(0x0000A2C201348E09 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (154, N'Tomato Mulakaya', 19, 1, 1, CAST(0x0000A2C201348E0A AS DateTime), CAST(0x0000A2C201348E0A AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (155, N'Vankaya Batani', 19, 1, 1, CAST(0x0000A2C201348E0C AS DateTime), CAST(0x0000A2C201348E0C AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (156, N'Gutti Vankaya', 19, 1, 1, CAST(0x0000A2C201348E0D AS DateTime), CAST(0x0000A2C201348E0D AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (157, N'Mango', 20, 1, 1, CAST(0x0000A2C201348E0E AS DateTime), CAST(0x0000A2C201348E0E AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (158, N'Tomato', 20, 1, 1, CAST(0x0000A2C201348E0F AS DateTime), CAST(0x0000A2C201348E0F AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (159, N'Gongura Pandu Mirchi', 20, 1, 1, CAST(0x0000A2C201348E10 AS DateTime), CAST(0x0000A2C201348E10 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (160, N'Allam', 20, 1, 1, CAST(0x0000A2C201348E11 AS DateTime), CAST(0x0000A2C201348E11 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (161, N'Pachi Boppayee', 20, 1, 1, CAST(0x0000A2C201348E12 AS DateTime), CAST(0x0000A2C201348E12 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (162, N'Chow Chow Avakaya', 20, 1, 1, CAST(0x0000A2C201348E13 AS DateTime), CAST(0x0000A2C201348E13 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (163, N'Chinna Ullipaya Avakaya', 20, 1, 1, CAST(0x0000A2C201348E14 AS DateTime), CAST(0x0000A2C201348E14 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (164, N'Velluli Jeedi Gullu', 20, 1, 1, CAST(0x0000A2C201348E15 AS DateTime), CAST(0x0000A2C201348E15 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (165, N'Pandu Mirchi', 20, 1, 1, CAST(0x0000A2C201348E16 AS DateTime), CAST(0x0000A2C201348E16 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (166, N'Tomato Chutney', 21, 1, 1, CAST(0x0000A2C201348E17 AS DateTime), CAST(0x0000A2C201348E17 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (167, N'Vankaya Dosakaya Tomato Chutney', 21, 1, 1, CAST(0x0000A2C201348E18 AS DateTime), CAST(0x0000A2C201348E18 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (168, N'Dosakaya Chutney', 21, 1, 1, CAST(0x0000A2C201348E19 AS DateTime), CAST(0x0000A2C201348E19 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (169, N'Jamakaya Chutney', 21, 1, 1, CAST(0x0000A2C201348E1A AS DateTime), CAST(0x0000A2C201348E1A AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (170, N'Cabbage Chutney', 21, 1, 1, CAST(0x0000A2C201348E1B AS DateTime), CAST(0x0000A2C201348E1B AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (171, N'Beerakaya Dondakaya Mukkala Chutney', 21, 1, 1, CAST(0x0000A2C201348E1B AS DateTime), CAST(0x0000A2C201348E1B AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (172, N'Kobbari Chintakaya Roti Chutney', 21, 1, 1, CAST(0x0000A2C201348E1C AS DateTime), CAST(0x0000A2C201348E1C AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (173, N'Gongura Ullipaya Chutney', 21, 1, 1, CAST(0x0000A2C201348E1D AS DateTime), CAST(0x0000A2C201348E1D AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (174, N'Sambar', 22, 1, 1, CAST(0x0000A2C201348E1E AS DateTime), CAST(0x0000A2C201348E1E AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (175, N'Tomato Rasam', 22, 1, 1, CAST(0x0000A2C201348E1F AS DateTime), CAST(0x0000A2C201348E1F AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (176, N'Ulavacharu With Cream', 22, 1, 1, CAST(0x0000A2C201348E20 AS DateTime), CAST(0x0000A2C201348E20 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (177, N'Miryala Rasam', 22, 1, 1, CAST(0x0000A2C201348E21 AS DateTime), CAST(0x0000A2C201348E21 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (178, N'Menthi Majjiga', 22, 1, 1, CAST(0x0000A2C201348E22 AS DateTime), CAST(0x0000A2C201348E22 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (179, N'Pachi Pulusu', 22, 1, 1, CAST(0x0000A2C201348E23 AS DateTime), CAST(0x0000A2C201348E23 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (180, N'Pesarapappu Charu', 22, 1, 1, CAST(0x0000A2C201348E26 AS DateTime), CAST(0x0000A2C201348E26 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (181, N'Mamidikaya Pachi Pulusu', 22, 1, 1, CAST(0x0000A2C201348E28 AS DateTime), CAST(0x0000A2C201348E28 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (182, N'Pappu Charu', 22, 1, 1, CAST(0x0000A2C201348E2A AS DateTime), CAST(0x0000A2C201348E2A AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (183, N'Papads & Vadiyalu', 23, 1, 1, CAST(0x0000A2C201348E2C AS DateTime), CAST(0x0000A2C201348E2C AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (184, N'Papads', 23, 1, 1, CAST(0x0000A2C201348E2F AS DateTime), CAST(0x0000A2C201348E2F AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (185, N'Curd In Pot', 24, 1, 1, CAST(0x0000A2C201348E31 AS DateTime), CAST(0x0000A2C201348E31 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (186, N'Caramel Nuts', 25, 1, 1, CAST(0x0000A2C201348E33 AS DateTime), CAST(0x0000A2C201348E33 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (187, N'Honey Moon Delight', 25, 1, 1, CAST(0x0000A2C201348E36 AS DateTime), CAST(0x0000A2C201348E36 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (188, N'Kaju Kismiss', 25, 1, 1, CAST(0x0000A2C201348E38 AS DateTime), CAST(0x0000A2C201348E38 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (189, N'Butter Scotch', 25, 1, 1, CAST(0x0000A2C201348E3A AS DateTime), CAST(0x0000A2C201348E3A AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (190, N'Vanilla', 25, 1, 1, CAST(0x0000A2C201348E3C AS DateTime), CAST(0x0000A2C201348E3C AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (191, N'Strawberry', 25, 1, 1, CAST(0x0000A2C201348E3D AS DateTime), CAST(0x0000A2C201348E3D AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (192, N'Mango Bars', 25, 1, 1, CAST(0x0000A2C201348E3E AS DateTime), CAST(0x0000A2C201348E3E AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (193, N'Choco Bars', 25, 1, 1, CAST(0x0000A2C201348E3F AS DateTime), CAST(0x0000A2C201348E3F AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (194, N'Orange Bars', 25, 1, 1, CAST(0x0000A2C201348E40 AS DateTime), CAST(0x0000A2C201348E40 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (195, N'Sapota', 25, 1, 1, CAST(0x0000A2C201348E41 AS DateTime), CAST(0x0000A2C201348E41 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (196, N'Plain Pista', 25, 1, 1, CAST(0x0000A2C201348E42 AS DateTime), CAST(0x0000A2C201348E42 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (197, N'Sada Paan', 26, 1, 1, CAST(0x0000A2C201348E44 AS DateTime), CAST(0x0000A2C201348E44 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (198, N'Sweet Paan', 26, 1, 1, CAST(0x0000A2C201348E45 AS DateTime), CAST(0x0000A2C201348E45 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (199, N'Live Paan', 26, 1, 1, CAST(0x0000A2C201348E46 AS DateTime), CAST(0x0000A2C201348E46 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (200, N'Paan With Cherry & Tooth Pick', 26, 1, 1, CAST(0x0000A2C201348E47 AS DateTime), CAST(0x0000A2C201348E47 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (201, N'Paan With Dry Fruits', 26, 1, 1, CAST(0x0000A2C201348E48 AS DateTime), CAST(0x0000A2C201348E48 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (202, N'Mineral Water', 27, 1, 1, CAST(0x0000A2C201348E49 AS DateTime), CAST(0x0000A2C201348E49 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (203, N'500ml Water Bottles', 27, 1, 1, CAST(0x0000A2C201348E4B AS DateTime), CAST(0x0000A2C201348E4B AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (204, N'Papaya', 28, 1, 1, CAST(0x0000A2C201348E4C AS DateTime), CAST(0x0000A2C201348E4C AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (205, N'Grape', 28, 1, 1, CAST(0x0000A2C201348E4E AS DateTime), CAST(0x0000A2C201348E4E AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (206, N'Apple', 28, 1, 1, CAST(0x0000A2C201348E4E AS DateTime), CAST(0x0000A2C201348E4E AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (207, N'Karbuja', 28, 1, 1, CAST(0x0000A2C201348E50 AS DateTime), CAST(0x0000A2C201348E50 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (208, N'One Seasonal Fruit', 28, 1, 1, CAST(0x0000A2C201348E51 AS DateTime), CAST(0x0000A2C201348E51 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (209, N'Australian Grape', 28, 1, 1, CAST(0x0000A2C201348E52 AS DateTime), CAST(0x0000A2C201348E52 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (210, N'Sweet Tamarind', 28, 1, 1, CAST(0x0000A2C201348E53 AS DateTime), CAST(0x0000A2C201348E53 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (211, N'Kiwi Fruit Or Kimia Dates', 28, 1, 1, CAST(0x0000A2C201348E54 AS DateTime), CAST(0x0000A2C201348E54 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (212, N'Bajji Masala', 6, 1, 1, CAST(0x0000A2C201348E55 AS DateTime), CAST(0x0000A2C201348E55 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (213, N'Maramarala Masala', 6, 1, 1, CAST(0x0000A2C201348E57 AS DateTime), CAST(0x0000A2C201348E57 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (214, N'Tomato Bajji Masala', 6, 1, 1, CAST(0x0000A2C201348E57 AS DateTime), CAST(0x0000A2C201348E57 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (215, N'Kaju Masala', 6, 1, 1, CAST(0x0000A2C201348E59 AS DateTime), CAST(0x0000A2C201348E59 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (216, N'Atukula Masala', 6, 1, 1, CAST(0x0000A2C201348E5A AS DateTime), CAST(0x0000A2C201348E5A AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (217, N'Vankay Bajji Masala', 6, 1, 1, CAST(0x0000A2C201348E5B AS DateTime), CAST(0x0000A2C201348E5B AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (218, N'Matka Kachori', 5, 1, 1, CAST(0x0000A2C201348E5C AS DateTime), CAST(0x0000A2C201348E5C AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (219, N'Kothimeer Vada', 5, 1, 1, CAST(0x0000A2C201348E5D AS DateTime), CAST(0x0000A2C201348E5D AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (220, N'Coconut Patiz', 5, 1, 1, CAST(0x0000A2C201348E5F AS DateTime), CAST(0x0000A2C201348E5F AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (221, N'Gujarathi Kachori', 5, 1, 1, CAST(0x0000A2C201348E60 AS DateTime), CAST(0x0000A2C201348E60 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (222, N'Noodle Samosa', 5, 1, 1, CAST(0x0000A2C201348E61 AS DateTime), CAST(0x0000A2C201348E61 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (223, N'Onion Pizza', 5, 1, 1, CAST(0x0000A2C201348E62 AS DateTime), CAST(0x0000A2C201348E62 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (224, N'Noodle Pops', 5, 1, 1, CAST(0x0000A2C201348E63 AS DateTime), CAST(0x0000A2C201348E63 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (225, N'Cheese Roll', 5, 1, 1, CAST(0x0000A2C201348E65 AS DateTime), CAST(0x0000A2C201348E65 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (226, N'Dhania Biscuit', 5, 1, 1, CAST(0x0000A2C201348E66 AS DateTime), CAST(0x0000A2C201348E66 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (227, N'Karela', 5, 1, 1, CAST(0x0000A2C201348E67 AS DateTime), CAST(0x0000A2C201348E67 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (228, N'Paneer Crunchy', 5, 1, 1, CAST(0x0000A2C201348E68 AS DateTime), CAST(0x0000A2C201348E68 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (229, N'Veg Samosa', 5, 1, 1, CAST(0x0000A2C201348E6A AS DateTime), CAST(0x0000A2C201348E6A AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (230, N'Dry Samosa', 5, 1, 1, CAST(0x0000A2C201348E6C AS DateTime), CAST(0x0000A2C201348E6C AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (231, N'Mutter Sandwich', 5, 1, 1, CAST(0x0000A2C201348E6C AS DateTime), CAST(0x0000A2C201348E6C AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (232, N'Nylon Dhokla', 5, 1, 1, CAST(0x0000A2C201348E6E AS DateTime), CAST(0x0000A2C201348E6E AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (233, N'Bread Sandwich', 5, 1, 1, CAST(0x0000A2C201348E6F AS DateTime), CAST(0x0000A2C201348E6F AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (234, N'Dhokla Pizza', 5, 1, 1, CAST(0x0000A2C201348E74 AS DateTime), CAST(0x0000A2C201348E74 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (235, N'Dhokla Sandwich', 5, 1, 1, CAST(0x0000A2C201348E79 AS DateTime), CAST(0x0000A2C201348E79 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (236, N'Raswin Sandwich', 5, 1, 1, CAST(0x0000A2C201348E7D AS DateTime), CAST(0x0000A2C201348E7D AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (237, N'Maithi Biscuit', 5, 1, 1, CAST(0x0000A2C201348E82 AS DateTime), CAST(0x0000A2C201348E82 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (238, N'Palak Mutty', 5, 1, 1, CAST(0x0000A2C201348E86 AS DateTime), CAST(0x0000A2C201348E86 AS DateTime))
GO
INSERT [dbo].[CatererMasterMenu] ([Id], [Name], [CategoryId], [PartnerId], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (239, N'Pan Mutty', 5, 1, 1, CAST(0x0000A2C201348E8B AS DateTime), CAST(0x0000A2C201348E8B AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CatererMasterMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[CatererPackage] ON 

GO
INSERT [dbo].[CatererPackage] ([Id], [Name], [PartnerId], [Price], [MinPerson], [ItemsCount], [IsVeg], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1, N'Package-1', 1, 180.0000, 50, 16, 1, 1, CAST(0x0000A2BC011E4A0E AS DateTime), CAST(0x0000A2BC011E4A0E AS DateTime))
GO
INSERT [dbo].[CatererPackage] ([Id], [Name], [PartnerId], [Price], [MinPerson], [ItemsCount], [IsVeg], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (2, N'Package-2', 1, 230.0000, 50, 22, 1, 1, CAST(0x0000A2BC011E6A06 AS DateTime), CAST(0x0000A2BC011E6A06 AS DateTime))
GO
INSERT [dbo].[CatererPackage] ([Id], [Name], [PartnerId], [Price], [MinPerson], [ItemsCount], [IsVeg], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (3, N'Package-3', 1, 270.0000, 50, 29, 1, 1, CAST(0x0000A2BC011E7ADE AS DateTime), CAST(0x0000A2BC011E7ADE AS DateTime))
GO
INSERT [dbo].[CatererPackage] ([Id], [Name], [PartnerId], [Price], [MinPerson], [ItemsCount], [IsVeg], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (4, N'Package-4', 1, 320.0000, 50, 32, 1, 1, CAST(0x0000A2BC011E8F7D AS DateTime), CAST(0x0000A2BC011E8F7D AS DateTime))
GO
INSERT [dbo].[CatererPackage] ([Id], [Name], [PartnerId], [Price], [MinPerson], [ItemsCount], [IsVeg], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (5, N'Package-5', 1, 280.0000, 50, 32, 1, 0, CAST(0x0000A2BC011EA369 AS DateTime), CAST(0x0000A2BC011EA369 AS DateTime))
GO
INSERT [dbo].[CatererPackage] ([Id], [Name], [PartnerId], [Price], [MinPerson], [ItemsCount], [IsVeg], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6, N'Package-6', 1, 310.0000, 500, 37, 1, 0, CAST(0x0000A2BC011EC857 AS DateTime), CAST(0x0000A2BC011EC857 AS DateTime))
GO
INSERT [dbo].[CatererPackage] ([Id], [Name], [PartnerId], [Price], [MinPerson], [ItemsCount], [IsVeg], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (7, N'Package-7', 1, 350.0000, 500, 40, 1, 0, CAST(0x0000A2BC011ED988 AS DateTime), CAST(0x0000A2BC011ED988 AS DateTime))
GO
INSERT [dbo].[CatererPackage] ([Id], [Name], [PartnerId], [Price], [MinPerson], [ItemsCount], [IsVeg], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (8, N'Package-8', 1, 400.0000, 500, 43, 1, 0, CAST(0x0000A2BC011EEDA4 AS DateTime), CAST(0x0000A2BC011EEDA4 AS DateTime))
GO
INSERT [dbo].[CatererPackage] ([Id], [Name], [PartnerId], [Price], [MinPerson], [ItemsCount], [IsVeg], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (9, N'Package-9', 1, 450.0000, 500, 47, 1, 0, CAST(0x0000A2BC011F0A42 AS DateTime), CAST(0x0000A2BC011F0A42 AS DateTime))
GO
INSERT [dbo].[CatererPackage] ([Id], [Name], [PartnerId], [Price], [MinPerson], [ItemsCount], [IsVeg], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (10, N'Package-10', 1, 500.0000, 500, 51, 1, 0, CAST(0x0000A2BC011F25AB AS DateTime), CAST(0x0000A2BC011F25AB AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CatererPackage] OFF
GO
INSERT [dbo].[CatererPackageMenu] ([PackageId], [PackageXML], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1, N'<Menu><Category><Id>9</Id><Choice>2</Choice><Item>42,43,63,64,65</Item></Category><Category><Id>10</Id><Choice>1</Choice><Item>66,67,68,78,79,80</Item></Category><Category><Id>13</Id><Choice>1</Choice><Item>96,97,98,107</Item></Category><Category><Id>14</Id><Choice>0</Choice><Item>108</Item></Category><Category><Id>15</Id><Choice>1</Choice><Item>109,112,113,118</Item></Category><Category><Id>16</Id><Choice>0</Choice><Item>119</Item></Category><Category><Id>17</Id><Choice>1</Choice><Item>120,121,122,123</Item></Category><Category><Id>18</Id><Choice>1</Choice><Item>128,129,130,131,132</Item></Category><Category><Id>19</Id><Choice>1</Choice><Item>148,154,155,156</Item></Category><Category><Id>21</Id><Choice>1</Choice><Item>166,167,168,169,170</Item></Category><Category><Id>22</Id><Choice>1</Choice><Item>174,175,182</Item></Category><Category><Id>23</Id><Choice>0</Choice><Item>184</Item></Category><Category><Id>24</Id><Choice>0</Choice><Item>185</Item></Category><Category><Id>25</Id><Choice>1</Choice><Item>190,191</Item></Category><Category><Id>27</Id><Choice>0</Choice><Item>202</Item></Category></Menu>', CAST(0x0000A2BC011E4A12 AS DateTime), CAST(0x0000A2BC011E4A12 AS DateTime))
GO
INSERT [dbo].[CatererPackageMenu] ([PackageId], [PackageXML], [DbModifiedUtc], [DbCreatedUtc]) VALUES (2, N'<Menu><Category><Id>8</Id><Choice>1</Choice><Item>31,33,34,35</Item></Category><Category><Id>9</Id><Choice>2</Choice><Item>42,43,44,45,50,59,60,61,62</Item></Category><Category><Id>10</Id><Choice>1</Choice><Item>66,67,68,69,70,71,78</Item></Category><Category><Id>11</Id><Choice>1</Choice><Item>81,82,83,84</Item></Category><Category><Id>12</Id><Choice>1</Choice><Item>92,93</Item></Category><Category><Id>13</Id><Choice>1</Choice><Item>96,97,98,99,100,101</Item></Category><Category><Id>14</Id><Choice>0</Choice><Item>108</Item></Category><Category><Id>15</Id><Choice>1</Choice><Item>109,110,111,112,113</Item></Category><Category><Id>16</Id><Choice>0</Choice><Item>119</Item></Category><Category><Id>17</Id><Choice>1</Choice><Item>120,121,122,123,124</Item></Category><Category><Id>18</Id><Choice>2</Choice><Item>128,129,130,131,132,133,135</Item></Category><Category><Id>19</Id><Choice>1</Choice><Item>145,148,149,152,153</Item></Category><Category><Id>20</Id><Choice>1</Choice><Item>157,158,159,160,161,165</Item></Category><Category><Id>21</Id><Choice>1</Choice><Item>166,167,168,170</Item></Category><Category><Id>22</Id><Choice>1</Choice><Item>174,175,176,177,182</Item></Category><Category><Id>23</Id><Choice>0</Choice><Item>184</Item></Category><Category><Id>24</Id><Choice>0</Choice><Item>185</Item></Category><Category><Id>25</Id><Choice>1</Choice><Item>190,191,196</Item></Category><Category><Id>26</Id><Choice>1</Choice><Item>197,198,199,200</Item></Category><Category><Id>27</Id><Choice>0</Choice><Item>202</Item></Category></Menu>', CAST(0x0000A2BC011E6A0A AS DateTime), CAST(0x0000A2BC011E6A0A AS DateTime))
GO
INSERT [dbo].[CatererPackageMenu] ([PackageId], [PackageXML], [DbModifiedUtc], [DbCreatedUtc]) VALUES (3, N'<Menu><Category><Id>8</Id><Choice>2</Choice><Item>31,33,34,35,36,37,38,39</Item></Category><Category><Id>9</Id><Choice>2</Choice><Item>42,43,44,45,46,47,48,49,50,51,52,53</Item></Category><Category><Id>10</Id><Choice>2</Choice><Item>66,67,68,69,70,71,72,73,74,75,76</Item></Category><Category><Id>11</Id><Choice>2</Choice><Item>81,82,83,84,85,86,87,91</Item></Category><Category><Id>12</Id><Choice>1</Choice><Item>92,93,94,95</Item></Category><Category><Id>13</Id><Choice>2</Choice><Item>96,97,98,99,100,101,102,103,104</Item></Category><Category><Id>14</Id><Choice>0</Choice><Item>108</Item></Category><Category><Id>15</Id><Choice>1</Choice><Item>109,110,111,112,113</Item></Category><Category><Id>16</Id><Choice>0</Choice><Item>119</Item></Category><Category><Id>17</Id><Choice>1</Choice><Item>120,121,122,123,124</Item></Category><Category><Id>18</Id><Choice>2</Choice><Item>128,129,130,131,132,133,135,136,137,138,139,140,141,142</Item></Category><Category><Id>19</Id><Choice>1</Choice><Item>143,144,145,146,147,148,149</Item></Category><Category><Id>20</Id><Choice>1</Choice><Item>157,158,159,160,161,162,163,165</Item></Category><Category><Id>21</Id><Choice>1</Choice><Item>166,167,168,169,170,171,173</Item></Category><Category><Id>22</Id><Choice>2</Choice><Item>174,175,176,177,178,179</Item></Category><Category><Id>23</Id><Choice>0</Choice><Item>183</Item></Category><Category><Id>24</Id><Choice>0</Choice><Item>185</Item></Category><Category><Id>25</Id><Choice>2</Choice><Item>189,190,191,195</Item></Category><Category><Id>26</Id><Choice>1</Choice><Item>197,198,199,200</Item></Category><Category><Id>27</Id><Choice>0</Choice><Item>203</Item></Category><Category><Id>28</Id><Choice>0</Choice><Item>204,205,206,207,208</Item></Category></Menu>', CAST(0x0000A2BC011E7AE2 AS DateTime), CAST(0x0000A2BC011E7AE2 AS DateTime))
GO
INSERT [dbo].[CatererPackageMenu] ([PackageId], [PackageXML], [DbModifiedUtc], [DbCreatedUtc]) VALUES (4, N'<Menu><Category><Id>1</Id><Choice>2</Choice><Item>1,2,3,4</Item></Category><Category><Id>2</Id><Choice>1</Choice><Item>5,6,7,8</Item></Category><Category><Id>8</Id><Choice>2</Choice><Item>31,33,34,35,36,37,38,39</Item></Category><Category><Id>9</Id><Choice>2</Choice><Item>42,43,44,45,46,47,48,49,50,51,52,53</Item></Category><Category><Id>10</Id><Choice>2</Choice><Item>66,67,68,69,70,71,72,73,74,75,76,77</Item></Category><Category><Id>11</Id><Choice>2</Choice><Item>81,82,83,84,85,86,87,91</Item></Category><Category><Id>12</Id><Choice>1</Choice><Item>92,93,94,95</Item></Category><Category><Id>13</Id><Choice>2</Choice><Item>96,97,98,99,100,101,102,103,104,105</Item></Category><Category><Id>14</Id><Choice>0</Choice><Item>108</Item></Category><Category><Id>15</Id><Choice>1</Choice><Item>109,110,111,112,113</Item></Category><Category><Id>16</Id><Choice>0</Choice><Item>119</Item></Category><Category><Id>17</Id><Choice>1</Choice><Item>120,121,122,123,124</Item></Category><Category><Id>18</Id><Choice>2</Choice><Item>128,129,130,131,132,133,135,136,137,138,139,140,141,142</Item></Category><Category><Id>19</Id><Choice>1</Choice><Item>143,144,145,146,147,148,149,150,151</Item></Category><Category><Id>20</Id><Choice>1</Choice><Item>157,158,159,160,161,162,163,165</Item></Category><Category><Id>21</Id><Choice>1</Choice><Item>166,167,168,169,170,171,173</Item></Category><Category><Id>22</Id><Choice>2</Choice><Item>174,175,176,177,178,179</Item></Category><Category><Id>23</Id><Choice>0</Choice><Item>183</Item></Category><Category><Id>24</Id><Choice>0</Choice><Item>185</Item></Category><Category><Id>25</Id><Choice>2</Choice><Item>189,190,191,195</Item></Category><Category><Id>26</Id><Choice>1</Choice><Item>197,198,199,200</Item></Category><Category><Id>27</Id><Choice>0</Choice><Item>203</Item></Category><Category><Id>28</Id><Choice>0</Choice><Item>204,205,206,207,208</Item></Category></Menu>', CAST(0x0000A2BC011E8F7D AS DateTime), CAST(0x0000A2BC011E8F7D AS DateTime))
GO
INSERT [dbo].[CatererPackageMenu] ([PackageId], [PackageXML], [DbModifiedUtc], [DbCreatedUtc]) VALUES (5, N'<Menu><Category><Id>1</Id><Choice>2</Choice><Item>1,2,3,4</Item></Category><Category><Id>2</Id><Choice>1</Choice><Item>5,6,7,8</Item></Category><Category><Id>8</Id><Choice>2</Choice><Item>31,33,34,35,36,37,38,39</Item></Category><Category><Id>9</Id><Choice>2</Choice><Item>42,43,44,45,46,47,48,49,50,51,52,53</Item></Category><Category><Id>10</Id><Choice>2</Choice><Item>66,67,68,69,70,71,72,73,74,75,76,77</Item></Category><Category><Id>11</Id><Choice>2</Choice><Item>81,82,83,84,85,86,87,91</Item></Category><Category><Id>12</Id><Choice>1</Choice><Item>92,93,94,95</Item></Category><Category><Id>13</Id><Choice>2</Choice><Item>96,97,98,99,100,101,102,103,104,105</Item></Category><Category><Id>14</Id><Choice>0</Choice><Item>108</Item></Category><Category><Id>15</Id><Choice>1</Choice><Item>109,110,111,112,113</Item></Category><Category><Id>16</Id><Choice>0</Choice><Item>119</Item></Category><Category><Id>17</Id><Choice>1</Choice><Item>120,121,122,123,124</Item></Category><Category><Id>18</Id><Choice>2</Choice><Item>128,129,130,131,132,133,135,136,137,138,139,140,141,142</Item></Category><Category><Id>19</Id><Choice>1</Choice><Item>143,144,145,146,147,148,149,150,151</Item></Category><Category><Id>20</Id><Choice>1</Choice><Item>157,158,159,160,161,162,163,165</Item></Category><Category><Id>21</Id><Choice>1</Choice><Item>166,167,168,169,170,171,173</Item></Category><Category><Id>22</Id><Choice>2</Choice><Item>174,175,176,177,178,179</Item></Category><Category><Id>23</Id><Choice>0</Choice><Item>183</Item></Category><Category><Id>24</Id><Choice>0</Choice><Item>185</Item></Category><Category><Id>25</Id><Choice>2</Choice><Item>189,190,191,195</Item></Category><Category><Id>26</Id><Choice>1</Choice><Item>197,198,199,200</Item></Category><Category><Id>27</Id><Choice>0</Choice><Item>203</Item></Category><Category><Id>28</Id><Choice>0</Choice><Item>204,205,206,207,208</Item></Category></Menu>', CAST(0x0000A2BC011EA36C AS DateTime), CAST(0x0000A2BC011EA36C AS DateTime))
GO
INSERT [dbo].[CatererPackageMenu] ([PackageId], [PackageXML], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6, N'<Menu><Category><Id>1</Id><Choice>2</Choice><Item>1,2,3,4</Item></Category><Category><Id>2</Id><Choice>1</Choice><Item>5,6,7,8</Item></Category><Category><Id>3</Id><Choice>4</Choice><Item>9,10,11,12,13,14,15</Item></Category><Category><Id>8</Id><Choice>2</Choice><Item>31,32,33,34,35,36,37,38,39,40</Item></Category><Category><Id>9</Id><Choice>2</Choice><Item>42,43,44,45,46,47,48,49,50,51,52,53</Item></Category><Category><Id>10</Id><Choice>2</Choice><Item>66,67,68,69,70,71,72,73,74,75,76,77</Item></Category><Category><Id>11</Id><Choice>2</Choice><Item>81,82,83,84,85,86,87,91</Item></Category><Category><Id>12</Id><Choice>1</Choice><Item>92,93,94,95</Item></Category><Category><Id>13</Id><Choice>2</Choice><Item>96,97,98,99,100,101,102,103,104,105</Item></Category><Category><Id>14</Id><Choice>0</Choice><Item>108</Item></Category><Category><Id>15</Id><Choice>1</Choice><Item>109,110,111,112,113</Item></Category><Category><Id>16</Id><Choice>0</Choice><Item>119</Item></Category><Category><Id>17</Id><Choice>1</Choice><Item>120,121,122,123,124</Item></Category><Category><Id>18</Id><Choice>2</Choice><Item>128,129,130,131,132,133,135,136,137,138,139,140,141,142</Item></Category><Category><Id>19</Id><Choice>1</Choice><Item>143,144,145,146,147,148,149,150,151</Item></Category><Category><Id>20</Id><Choice>1</Choice><Item>157,158,159,160,161,162,163,164,165</Item></Category><Category><Id>21</Id><Choice>1</Choice><Item>166,167,168,169,170,171,172</Item></Category><Category><Id>22</Id><Choice>2</Choice><Item>174,175,176,177,178,179,180,182</Item></Category><Category><Id>23</Id><Choice>0</Choice><Item>183</Item></Category><Category><Id>24</Id><Choice>0</Choice><Item>185</Item></Category><Category><Id>25</Id><Choice>3</Choice><Item>186,189,190,191,192,193,194</Item></Category><Category><Id>26</Id><Choice>1</Choice><Item>197,198,199,200</Item></Category><Category><Id>27</Id><Choice>0</Choice><Item>203</Item></Category><Category><Id>28</Id><Choice>0</Choice><Item>204,205,206,207,208</Item></Category></Menu>', CAST(0x0000A2BC011EC85B AS DateTime), CAST(0x0000A2BC011EC85B AS DateTime))
GO
INSERT [dbo].[CatererPackageMenu] ([PackageId], [PackageXML], [DbModifiedUtc], [DbCreatedUtc]) VALUES (7, N'<Menu><Category><Id>1</Id><Choice>2</Choice><Item>1,2,3,4</Item></Category><Category><Id>2</Id><Choice>1</Choice><Item>5,6,7,8</Item></Category><Category><Id>3</Id><Choice>4</Choice><Item>9,10,11,12,13,14,15</Item></Category><Category><Id>6</Id><Choice>0</Choice><Item>212,213,214,215,216,217</Item></Category><Category><Id>8</Id><Choice>2</Choice><Item>31,32,33,34,35,36,37,38,39,40</Item></Category><Category><Id>9</Id><Choice>3</Choice><Item>42,43,44,45,46,47,48,49,50,51,52,53</Item></Category><Category><Id>10</Id><Choice>2</Choice><Item>66,67,68,69,70,71,72,73,74,75,76,77</Item></Category><Category><Id>11</Id><Choice>2</Choice><Item>81,82,83,84,85,86,87,91</Item></Category><Category><Id>12</Id><Choice>1</Choice><Item>92,93,94,95</Item></Category><Category><Id>13</Id><Choice>2</Choice><Item>96,97,98,99,100,101,102,103,104,105</Item></Category><Category><Id>14</Id><Choice>0</Choice><Item>108</Item></Category><Category><Id>15</Id><Choice>1</Choice><Item>109,110,111,112,113</Item></Category><Category><Id>16</Id><Choice>0</Choice><Item>119</Item></Category><Category><Id>17</Id><Choice>1</Choice><Item>120,121,122,123,124</Item></Category><Category><Id>18</Id><Choice>2</Choice><Item>128,129,130,131,132,133,135,136,137,138,139,140,141,142</Item></Category><Category><Id>19</Id><Choice>1</Choice><Item>143,144,145,146,147,148,149,150,151</Item></Category><Category><Id>20</Id><Choice>1</Choice><Item>157,158,159,160,161,162,163,164,165</Item></Category><Category><Id>21</Id><Choice>1</Choice><Item>166,167,168,169,170,171,172</Item></Category><Category><Id>22</Id><Choice>3</Choice><Item>174,175,176,177,178,179,180,181</Item></Category><Category><Id>23</Id><Choice>0</Choice><Item>183</Item></Category><Category><Id>24</Id><Choice>0</Choice><Item>185</Item></Category><Category><Id>25</Id><Choice>3</Choice><Item>186,189,190,191,192,193,194</Item></Category><Category><Id>26</Id><Choice>1</Choice><Item>197,198,199,200</Item></Category><Category><Id>27</Id><Choice>0</Choice><Item>203</Item></Category><Category><Id>28</Id><Choice>0</Choice><Item>205,206,209,210,211</Item></Category></Menu>', CAST(0x0000A2BC011ED98B AS DateTime), CAST(0x0000A2BC011ED98B AS DateTime))
GO
INSERT [dbo].[CatererPackageMenu] ([PackageId], [PackageXML], [DbModifiedUtc], [DbCreatedUtc]) VALUES (8, N'<Menu><Category><Id>1</Id><Choice>2</Choice><Item>1,2,3,4</Item></Category><Category><Id>2</Id><Choice>1</Choice><Item>5,6,7,8</Item></Category><Category><Id>3</Id><Choice>4</Choice><Item>9,10,11,12,13,14,15</Item></Category><Category><Id>6</Id><Choice>0</Choice><Item>212,213,214,215,216,217</Item></Category><Category><Id>7</Id><Choice>0</Choice><Item>26,27,28,29,30</Item></Category><Category><Id>8</Id><Choice>2</Choice><Item>31,32,33,34,35,36,37,38,39,40,41</Item></Category><Category><Id>9</Id><Choice>3</Choice><Item>42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58</Item></Category><Category><Id>10</Id><Choice>2</Choice><Item>66,67,68,69,70,71,72,73,74,75,76,77</Item></Category><Category><Id>11</Id><Choice>2</Choice><Item>81,82,83,84,85,86,87,88,89,90</Item></Category><Category><Id>12</Id><Choice>1</Choice><Item>92,93,94,95</Item></Category><Category><Id>13</Id><Choice>2</Choice><Item>96,97,98,99,100,101,102,103,104,105,106</Item></Category><Category><Id>14</Id><Choice>0</Choice><Item>108</Item></Category><Category><Id>15</Id><Choice>1</Choice><Item>109,110,111,112,113,114,115,116,117</Item></Category><Category><Id>16</Id><Choice>0</Choice><Item>119</Item></Category><Category><Id>17</Id><Choice>1</Choice><Item>120,121,122,123,124,125,126,127</Item></Category><Category><Id>18</Id><Choice>2</Choice><Item>128,129,130,131,132,133,135,136,137,138,139,140,141,142</Item></Category><Category><Id>19</Id><Choice>2</Choice><Item>143,144,145,146,147,148,149,150,151</Item></Category><Category><Id>20</Id><Choice>2</Choice><Item>157,158,159,160,161,162,163,164,165</Item></Category><Category><Id>21</Id><Choice>1</Choice><Item>166,167,168,169,170,171,172</Item></Category><Category><Id>22</Id><Choice>3</Choice><Item>174,175,176,177,178,179,180,181</Item></Category><Category><Id>23</Id><Choice>0</Choice><Item>183</Item></Category><Category><Id>24</Id><Choice>0</Choice><Item>185</Item></Category><Category><Id>25</Id><Choice>3</Choice><Item>186,187,189,190,191,192,193,194</Item></Category><Category><Id>26</Id><Choice>1</Choice><Item>197,198,199,200</Item></Category><Category><Id>27</Id><Choice>0</Choice><Item>203</Item></Category><Category><Id>28</Id><Choice>0</Choice><Item>205,206,209,210,211</Item></Category></Menu>', CAST(0x0000A2BC011EEDA8 AS DateTime), CAST(0x0000A2BC011EEDA8 AS DateTime))
GO
INSERT [dbo].[CatererPackageMenu] ([PackageId], [PackageXML], [DbModifiedUtc], [DbCreatedUtc]) VALUES (9, N'<Menu><Category><Id>1</Id><Choice>2</Choice><Item>1,2,3,4</Item></Category><Category><Id>2</Id><Choice>1</Choice><Item>5,6,7,8</Item></Category><Category><Id>3</Id><Choice>4</Choice><Item>9,10,11,12,13,14,15</Item></Category><Category><Id>4</Id><Choice>4</Choice><Item>16,17,18,19,20,21,22,23,24,25</Item></Category><Category><Id>6</Id><Choice>0</Choice><Item>212,213,214,215,216,217</Item></Category><Category><Id>7</Id><Choice>0</Choice><Item>26,27,28,29,30</Item></Category><Category><Id>8</Id><Choice>2</Choice><Item>31,32,33,34,35,36,37,38,39,40,41</Item></Category><Category><Id>9</Id><Choice>3</Choice><Item>42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58</Item></Category><Category><Id>10</Id><Choice>2</Choice><Item>66,67,68,69,70,71,72,73,74,75,76,77</Item></Category><Category><Id>11</Id><Choice>2</Choice><Item>81,82,83,84,85,86,87,88,89,90</Item></Category><Category><Id>12</Id><Choice>1</Choice><Item>92,93,94,95</Item></Category><Category><Id>13</Id><Choice>2</Choice><Item>96,97,98,99,100,101,102,103,104,105,106</Item></Category><Category><Id>14</Id><Choice>0</Choice><Item>108</Item></Category><Category><Id>15</Id><Choice>1</Choice><Item>109,110,111,112,113,114,115,116,117</Item></Category><Category><Id>16</Id><Choice>0</Choice><Item>119</Item></Category><Category><Id>17</Id><Choice>1</Choice><Item>120,121,122,123,124,125,126,127</Item></Category><Category><Id>18</Id><Choice>2</Choice><Item>128,129,130,131,132,133,135,136,137,138,139,140,141,142</Item></Category><Category><Id>19</Id><Choice>2</Choice><Item>143,144,145,146,147,148,149,150,151</Item></Category><Category><Id>20</Id><Choice>2</Choice><Item>157,158,159,160,161,162,163,164,165</Item></Category><Category><Id>21</Id><Choice>1</Choice><Item>166,167,168,169,170,171,172</Item></Category><Category><Id>22</Id><Choice>3</Choice><Item>174,175,176,177,178,179,180,181</Item></Category><Category><Id>23</Id><Choice>0</Choice><Item>183</Item></Category><Category><Id>24</Id><Choice>0</Choice><Item>185</Item></Category><Category><Id>25</Id><Choice>3</Choice><Item>186,187,188,189,190,191,192,193,194</Item></Category><Category><Id>26</Id><Choice>1</Choice><Item>197,198,199,200,201</Item></Category><Category><Id>27</Id><Choice>0</Choice><Item>203</Item></Category><Category><Id>28</Id><Choice>0</Choice><Item>205,206,209,210,211</Item></Category></Menu>', CAST(0x0000A2BC011F0A46 AS DateTime), CAST(0x0000A2BC011F0A46 AS DateTime))
GO
INSERT [dbo].[CatererPackageMenu] ([PackageId], [PackageXML], [DbModifiedUtc], [DbCreatedUtc]) VALUES (10, N'<Menu><Category><Id>1</Id><Choice>2</Choice><Item>1,2,3,4</Item></Category><Category><Id>2</Id><Choice>1</Choice><Item>5,6,7,8</Item></Category><Category><Id>3</Id><Choice>4</Choice><Item>9,10,11,12,13,14,15</Item></Category><Category><Id>4</Id><Choice>4</Choice><Item>16,17,18,19,20,21,22,23,24,25</Item></Category><Category><Id>5</Id><Choice>5</Choice><Item>218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239</Item></Category><Category><Id>7</Id><Choice>0</Choice><Item>26,27,28,29,30</Item></Category><Category><Id>8</Id><Choice>2</Choice><Item>31,32,33,34,35,36,37,38,39,40,41</Item></Category><Category><Id>9</Id><Choice>3</Choice><Item>42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58</Item></Category><Category><Id>10</Id><Choice>2</Choice><Item>66,67,68,69,70,71,72,73,74,75,76,77</Item></Category><Category><Id>11</Id><Choice>2</Choice><Item>81,82,83,84,85,86,87,88,89,90</Item></Category><Category><Id>12</Id><Choice>1</Choice><Item>92,93,94,95</Item></Category><Category><Id>13</Id><Choice>2</Choice><Item>96,97,98,99,100,101,102,103,104,105,106</Item></Category><Category><Id>14</Id><Choice>0</Choice><Item>108</Item></Category><Category><Id>15</Id><Choice>1</Choice><Item>109,110,111,112,113,114,115,116,117</Item></Category><Category><Id>16</Id><Choice>0</Choice><Item>119</Item></Category><Category><Id>17</Id><Choice>1</Choice><Item>120,121,122,123,124,125,126,127</Item></Category><Category><Id>18</Id><Choice>2</Choice><Item>128,129,130,131,132,133,135,136,137,138,139,140,141,142</Item></Category><Category><Id>19</Id><Choice>2</Choice><Item>143,144,145,146,147,148,149,150,151</Item></Category><Category><Id>20</Id><Choice>2</Choice><Item>157,158,159,160,161,162,163,164,165</Item></Category><Category><Id>21</Id><Choice>1</Choice><Item>166,167,168,169,170,171,172</Item></Category><Category><Id>22</Id><Choice>3</Choice><Item>174,175,176,177,178,179,180,181</Item></Category><Category><Id>23</Id><Choice>0</Choice><Item>183</Item></Category><Category><Id>24</Id><Choice>0</Choice><Item>185</Item></Category><Category><Id>25</Id><Choice>3</Choice><Item>186,187,188,189,190,191,192,193,194</Item></Category><Category><Id>26</Id><Choice>1</Choice><Item>197,198,199,200,201</Item></Category><Category><Id>27</Id><Choice>0</Choice><Item>203</Item></Category><Category><Id>28</Id><Choice>0</Choice><Item>205,206,209,210,211</Item></Category></Menu>', CAST(0x0000A2BC011F25AF AS DateTime), CAST(0x0000A2BC011F25AF AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CateringOrder] ON 

GO
INSERT [dbo].[CateringOrder] ([Id], [Name], [Phone], [Email], [Address], [PackageId], [EventDate], [IsCancelled], [GUID], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1, N'Subramaniam', N'9440696547', N'prasanna.madineni@gmail.com', N'D.No: 41-4-40, Metlabazar, Krishnalanka, Vijayawada-520010', 5, CAST(0x52360B00 AS Date), 0, N'53b767f9-2c3f-4c98-89b7-489560058049', CAST(0x0000A2E001247901 AS DateTime), CAST(0x0000A2E001247901 AS DateTime))
GO
INSERT [dbo].[CateringOrder] ([Id], [Name], [Phone], [Email], [Address], [PackageId], [EventDate], [IsCancelled], [GUID], [DbModifiedUtc], [DbCreatedUtc]) VALUES (2, N'Uday Kiran', N'7204283869', N'uday.mca1@gmail.com', N'Krishnalanka, Vijayawada-10', 4, CAST(0x11370B00 AS Date), 0, N'2c7e96fe-ef80-4a04-bebc-64151361bdbd', CAST(0x0000A2E4011D6920 AS DateTime), CAST(0x0000A2E4011D6920 AS DateTime))
GO
INSERT [dbo].[CateringOrder] ([Id], [Name], [Phone], [Email], [Address], [PackageId], [EventDate], [IsCancelled], [GUID], [DbModifiedUtc], [DbCreatedUtc]) VALUES (3, N'Ramgopal', N'9677242040', N'madhuram17@gmail.com', N'Vijayawada', 1, CAST(0x16370B00 AS Date), 0, N'e448da29-bc13-4ff5-899a-e54991c19710', CAST(0x0000A2E8012EE837 AS DateTime), CAST(0x0000A2E8012EE837 AS DateTime))
GO
INSERT [dbo].[CateringOrder] ([Id], [Name], [Phone], [Email], [Address], [PackageId], [EventDate], [IsCancelled], [GUID], [DbModifiedUtc], [DbCreatedUtc]) VALUES (4, N'Srikanth', N'09985244933', N'chintugmc@gmail.com', N'Vijayawada', 2, CAST(0x4E380B00 AS Date), 0, N'41a5998e-ea08-4614-955d-4ec5db41a614', CAST(0x0000A2F600C6E375 AS DateTime), CAST(0x0000A2F600C6E375 AS DateTime))
GO
INSERT [dbo].[CateringOrder] ([Id], [Name], [Phone], [Email], [Address], [PackageId], [EventDate], [IsCancelled], [GUID], [DbModifiedUtc], [DbCreatedUtc]) VALUES (5, N'Lankesh Naidu', N'09030016242', N'madhususan15@gmail.com', N'Bhavanipuram, Vijayawada', 1, CAST(0x51380B00 AS Date), 0, N'16b7ff48-aecd-4257-b008-f34bad35751e', CAST(0x0000A2F600C72723 AS DateTime), CAST(0x0000A2F600C72723 AS DateTime))
GO
INSERT [dbo].[CateringOrder] ([Id], [Name], [Phone], [Email], [Address], [PackageId], [EventDate], [IsCancelled], [GUID], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6, N'First Customer', N'9043037693', N'noemail@noemail.com', N'DonkaRoad,Vijaywada', 1, CAST(0x48380B00 AS Date), 0, N'a6b5ae49-cf58-4ecc-882f-d0d0df99fc97', CAST(0x0000A31C0105D0F8 AS DateTime), CAST(0x0000A31C0105D0F8 AS DateTime))
GO
INSERT [dbo].[CateringOrder] ([Id], [Name], [Phone], [Email], [Address], [PackageId], [EventDate], [IsCancelled], [GUID], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1006, N'Prasad', N'8142234445', N'prasad@jun42014.com', N'Vijayawada', 2, CAST(0x9B380B00 AS Date), 0, N'6c60443f-0a34-4b73-a502-d55f36c62247', CAST(0x0000A35801179E73 AS DateTime), CAST(0x0000A35801179E73 AS DateTime))
GO
INSERT [dbo].[CateringOrder] ([Id], [Name], [Phone], [Email], [Address], [PackageId], [EventDate], [IsCancelled], [GUID], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1007, N'Ranganayak', N'9640003805', N'no@emai.com', N'Vijayawada', 1, CAST(0x51390B00 AS Date), 0, N'0045b6fd-9106-482e-b44d-e04742d2d4b3', CAST(0x0000A3F701155E4F AS DateTime), CAST(0x0000A3F701155E4F AS DateTime))
GO
INSERT [dbo].[CateringOrder] ([Id], [Name], [Phone], [Email], [Address], [PackageId], [EventDate], [IsCancelled], [GUID], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1008, N'Srinvas Reddy', N'9652678999', N'no@emai.com', N'Vijayawada', 6, CAST(0x55390B00 AS Date), 0, N'4290ad72-8a17-485b-ae22-f3d02b85e9b1', CAST(0x0000A3F70115AE40 AS DateTime), CAST(0x0000A3F70115AE40 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CateringOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[CateringReview] ON 

GO
INSERT [dbo].[CateringReview] ([Id], [DisplayName], [OrderId], [Rating], [Review], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1, N'Subramaniam', 1, 4, N'Food was very tasty and hygienic. I personally received appreciation from guests on food :)', 1, CAST(0x0000A2E00126E6B4 AS DateTime), CAST(0x0000A2E00126E6B4 AS DateTime))
GO
INSERT [dbo].[CateringReview] ([Id], [DisplayName], [OrderId], [Rating], [Review], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (2, N'Srikanth', 4, 5, N'Your food was delicious....!! We will definitely contact you for future events ', 1, CAST(0x0000A2F900F78247 AS DateTime), CAST(0x0000A2F900F78247 AS DateTime))
GO
INSERT [dbo].[CateringReview] ([Id], [DisplayName], [OrderId], [Rating], [Review], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (3, N'Lankesh Naidu', 5, 5, N'The vegetarian food is excellent, The timing is super, we got appreciation from all my relatives beyond all,The people who look the review they can trust me.', 1, CAST(0x0000A2FA00F8B289 AS DateTime), CAST(0x0000A2FA00F8B289 AS DateTime))
GO
INSERT [dbo].[CateringReview] ([Id], [DisplayName], [OrderId], [Rating], [Review], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1002, N'Prasad', 1006, 4, N'Excellent food with good quality and hygiene at best price!! ', 1, CAST(0x0000A35801184238 AS DateTime), CAST(0x0000A35801184238 AS DateTime))
GO
INSERT [dbo].[CateringReview] ([Id], [DisplayName], [OrderId], [Rating], [Review], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1004, N'Harish', 1, 4, N'Thanks a lot vamsi for handling more guests then expected. You made us happy with the tasty food :)', 1, CAST(0x0000A39C01287F29 AS DateTime), CAST(0x0000A39C01287F29 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CateringReview] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

GO
INSERT [dbo].[City] ([Id], [Name], [PartnerOnly], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1, N'Vijayawada', 0, 1, CAST(0x0000A2BC011E03C7 AS DateTime), CAST(0x0000A2BC011E03C7 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1, N'Sreenivasa Reddy', N'nivas1729@gmail.com', N'919900405906', N'Query', N'Hi esayevents.in,

All the best :)

Regards,
Future customer', 1, CAST(0x0000A2C000278A91 AS DateTime), CAST(0x0000A2C000278957 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (2, N'Manikandan', N'manikandan.digi@gmail.com', N'9788758495', N'Query', N'Hello,

I am looking for a Weekend job in Chennai. Please respond is any in your company.

Regards,
Manikandan Rajakumar.', 1, CAST(0x0000A2D000801E04 AS DateTime), CAST(0x0000A2D000801DEC AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (3, N'Prabhugouda i patil', N'prabhugouda.i.patil@gmail.com', N'8892425676', N'Query', N'marketing Internship  permission', 1, CAST(0x0000A2E20071B055 AS DateTime), CAST(0x0000A2E20071B022 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (4, N'lankesh naidu', N'madhususan15@gmail.com', N'9030016242', N'Book', N'we need food for 100 people on     ( 22 march 2014)', 1, CAST(0x0000A2F20143E6A1 AS DateTime), CAST(0x0000A2F20143E683 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (5, N'Sandeep', N'yesitssandeep@gmail.com', N'9880493388', N'Query', N'Test checking', 1, CAST(0x0000A30100FEBD2F AS DateTime), CAST(0x0000A30100FEBD12 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6, N'Sandeep', N'yesitssandeep@gmail.com', N'9880493388', N'Query', N'Test with new forms', 1, CAST(0x0000A302011197AD AS DateTime), CAST(0x0000A3020111960C AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1005, N'purna chandra rao', N'hello_purna_123@yahoo.co.in', N'8886669433', N'Query', N'looking for a function hall for arranging marriage lunch/dinner which is near to Kothapeta area', 1, CAST(0x0000A30E010120DC AS DateTime), CAST(0x0000A30E010120B7 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (2005, N'venkatesh', N'julurivenkatesh50@gmail.com', N'9032634561', N'Book', N'hai this is venkatesh from bhimavaram I am going to marry at this august 14 so if free can u make a call  ', 1, CAST(0x0000A331005BF551 AS DateTime), CAST(0x0000A331005BF51D AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (2006, N'mani', N'maniexinsp@gmail.com', N'9989523351', N'Query', N'catering wanted', 1, CAST(0x0000A34700C95C2F AS DateTime), CAST(0x0000A34700C95BFC AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (3005, N'Sandeep Polavarapu', N'yesitssandeep@gmail.com', N'919880493388', N'Query', N'test for catering', 1, CAST(0x0000A37C00B7D940 AS DateTime), CAST(0x0000A37C00B7D915 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (4005, N'Nitin Rane ', N'nitinrr84@gmail.com', N'9821346956', N'Book', N'Booking package-1', 1, CAST(0x0000A3B20087E3BF AS DateTime), CAST(0x0000A3B20087E37D AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (5005, N'vijayalakshmi.k', N'janakikollipara@gmail.com', N'9441040418', N'Query', N'ayodya nagar,vijayawada', 1, CAST(0x0000A3E9007BBC82 AS DateTime), CAST(0x0000A3E9007BBC52 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6005, N'Jophin Michael', N'jophinmichael@gmail.com', N'9916111128', N'Query', N'Hi Sandeep, how are you?', 1, CAST(0x0000A40A00871833 AS DateTime), CAST(0x0000A40A0087180D AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6006, N'pcbabu', N'palaparthi.babu1966@gmail.com', N'9989037668', N'Book', N'Booking package-2', 1, CAST(0x0000A40B00473EB9 AS DateTime), CAST(0x0000A40B00473E97 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6007, N'pcbabu', N'palaparthi.babu1966@gmail.com', N'9989037668', N'Book', N'Booking package-3', 1, CAST(0x0000A40B004AE785 AS DateTime), CAST(0x0000A40B004AE781 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6008, N'Maheswara Reddy', N'maheswara2010@gmail.com', N'07353763011', N'Query', N'want chef for master', 1, CAST(0x0000A418007E20D0 AS DateTime), CAST(0x0000A418007E20A6 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6009, N' A VENKATESWARA RAO', N'avridc@gmail.com', N'9490959803', N'Query', N'I WANT A BAUNQUET HALL FOR 100 MUMBERS ON 21ST JAN FOR ENGAGEMENT', 1, CAST(0x0000A41A00E3C173 AS DateTime), CAST(0x0000A41A00E3C127 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (7008, N'Sandeep Polavarapu', N'sandeep@gmail.com', N'09880493388', N'Query', N'Test New version', 1, CAST(0x0000A46300EF2C8D AS DateTime), CAST(0x0000A46300EF2BDC AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (7009, N'ramu', N'ramuktummala@yahoo.com', N'9247331444', N'Query', N'i want aahvanam kalyanamandapam rent for marriage details', 1, CAST(0x0000A467004174AC AS DateTime), CAST(0x0000A46700417421 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (8008, N'rajasekhar', N'rajasekhar.adi@gmail.com', N'9963571344', N'Query', N'I am looking for  a A/C marriage function hall with capacity of 200-250 people in Vijayawada.
Would like to know the package details.
Please help me in this regard. ', 1, CAST(0x0000A474012DAFF9 AS DateTime), CAST(0x0000A474012DAF81 AS DateTime))
GO
INSERT [dbo].[ContactUs] ([Id], [Name], [Email], [Phone], [QueryType], [Message], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (9008, N'K.SRINIVASAN ', N'adftrading@gmail.com', N'9444498765', N'Query', N'Dear Sir,

We are one of the leading suppliers of ROYAL CHEF BRAND Basmati Rice,Dubar Rice,Union Rice,boiled Rice, Raw Rice,Idli Rice,Steam Rice and Ghee.

Please contact us in my mobile no 9444498765

regards', 1, CAST(0x0000A4DE006B7468 AS DateTime), CAST(0x0000A4DE006B7397 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
GO
SET IDENTITY_INSERT [dbo].[Partner] ON 

GO
INSERT [dbo].[Partner] ([Id], [Login], [Password], [PartnerTypeId], [DisplayName], [EmailId], [Phone], [IsActive], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1, N'vamsievents', N'vamsievents', 1, N'Vamsi Events & Caterers', N'vamsepolavarapu@gmail.com', N'8143776677', 1, CAST(0x0000A2BC011E0487 AS DateTime), CAST(0x0000A2BC011E0487 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Partner] OFF
GO
INSERT [dbo].[PartnerType] ([Id], [Name], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1, N'Caterer', CAST(0x0000A2BC011E0426 AS DateTime), CAST(0x0000A2BC011E0426 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Venue] ON 

GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (1, N'Asha Function Hall', N'73-7-12,Donka Road,Opp Sweet Magic', N'Patamata', N'520010', 1, N'0866 2494525, 9848110525', N'16.49194444', N'80.66583333', 10000.0000, 500, 0, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46C4 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (2, N'Sri Lakkireddy Narayanamagarla Kalyana Mandapam', N'Swati Theatre Road,HB Colony', N'Bhavani Puram', N'521241', 1, N'0866 2413407', N'16.5325', N'80.59694444', 20000.0000, 800, 0, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46D4 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (3, N'Sri Vidya Sadan', N'Near Stella College', N'Benz Circle', N'520008', 1, N'9440030116, 9963291166', N'16.50138889', N'80.65861111', 20000.0000, 500, 0, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46D8 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (4, N'Sri Srinivasa Kalyana Mandapam', N'Bandar Road', N'Papulla Mill Centre', N'520007', 1, N'0866 2550394, 9290779684, 9290779685', N'16.48583333', N'80.68', 25000.0000, 1000, 0, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46DC AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (5, N'Funtimes Club', N'Teachers Colony,Sai Baba Temple Road', N'Patamata', N'520008', 1, N'9703329992', N'16.50055556', N'80.66388889', 30000.0000, 1000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46DD AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (6, N'Lakshmi Narasimha Gardens', N'Bandar Road,Opp Srinivasa Theatre,', N'Poranki', N'521137', 1, N'9701104444', N'16.47361111', N'80.7125', 40000.0000, 1000, 0, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46DF AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (7, N'Paritala Omkar Kalyana Mandapam', N'Bharati Nagar', N'Bharatinagar', N'520008', 1, N'', N'16.51138889', N'80.67194444', 40000.0000, 500, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46E1 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (8, N'Subhalagna Vedika', N'Near Don Bosco School,Vijayanagar Colony', N'Gurunanak Colony', N'      ', 1, N'9848992302', N'16.50222222', N'80.66833333', 40000.0000, 500, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46E2 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (9, N'Sri Koraganji Surya Narayana Function Hall', N'Gulam Muhaddin Street,Near Fish Market', N'One Town', N'520001', 1, N'', N'', N'', 50000.0000, 600, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46E4 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (10, N'Sree Rasthu Function Hall', N'Near Reliance Fresh,Vinnakota Vari Street,Islampet', N'One Town', N'520001', 1, N'9966998000, 9848630675, 9247199377', N'16.51777778', N'80.61138889', 50000.0000, 1000, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46E6 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (11, N'Sri Desu Subbarao Nagaratnamma Vasavi Kalyana Mandapam', N'Shivalayam Road', N'Bhavani Puram', N'521241', 1, N'0866 6574485, 9246499154', N'16.53083333', N'80.59555556', 50116.0000, 800, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46E8 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (12, N'Amma kalyana Mandapam', N'ITI College Road,Siddhartha Nagar', N'Sunapubatillu Centre', N'520010', 1, N'0866 6699084, 0866 2474984', N'16.50805556', N'80.65055556', 55000.0000, 1000, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46E9 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (13, N'Sri Raghu Ram Vedika', N'Mohandas Complex,Bandar Road', N'Patamata', N'520010', 1, N'9440030116, 9963291166', N'16.49472222', N'80.66111111', 60000.0000, 1000, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46EB AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (14, N'SVS Kalyana Mandapam', N'NH5 Frontage Road,Opp Jyothi Mahal,Near Benz Circle', N'Patamata Lanka', N'520014', 1, N'0866 2470563,9490754715', N'16.49555556', N'80.65111111', 60000.0000, 1000, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46ED AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (15, N'Sri Datta Kalyana Mandapam', N'Near Ayyapa Swamy Temple', N'Gollapudi', N'521225', 1, N'0866 6456865', N'16.54666667', N'80.57583333', 70000.0000, 1200, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46EE AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (16, N'Parinaya Kalyana Mandapam', N'Near Varun Motors,Opp NTR Health University', N'Currency Nagar', N'521108', 1, N'9390141440', N'16.51666667', N'80.67222222', 80000.0000, 1000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46F0 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (17, N'Sri Sai Baba Kalyana Mandapam', N'Bandar Road,Opp Auto Nagar Check Post', N'Auto Nagar', N'520007', 1, N'9885253000', N'16.49', N'80.67055556', 80000.0000, 1000, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46F1 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (18, N'Sri Sai Balaji Kalyana Vedika', N'Bandar Road,Opp Srinivasa Theatre', N'Poranki', N'521137', 1, N'9246412573, 9246452573', N'16.47361111', N'80.71277778', 80000.0000, 800, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46F3 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (19, N'Sree Seetha Rama Gardens', N'Bandar Road, Eedupugallu', N'Kankipadu', N'521151', 1, N'9985011966, 0866 2821755, 0866 2821555', N'16.45638889', N'80.74027778', 90000.0000, 2000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46F5 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (20, N'Subham Kalyana Vedika', N'Eluru Road,Ramavarapadu Ring', N'Ramavarapadu', N'521108', 1, N'9397970001', N'16.52416667', N'80.68027778', 90000.0000, 1500, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46F6 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (21, N'Dhanekula Kalyana Mandapam', N'Bandar Road,Sanath Nagar', N'Papulla Mill Centre', N'520007', 1, N'0866 2554300, 9949911458', N'16.48861111', N'80.68194444', 100000.0000, 1500, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46F8 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (22, N'Kilaru Anil Estates Kalyana Vedika', N'Bandar Road,Near Priya Pickles,Penamaluru Mandal', N'Penamaluru', N'521139', 1, N'9440214033,9490113680,0866 2585456,8008887575', N'16.47138889', N'80.71944444', 100000.0000, 1000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46FA AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (23, N'Sri Padmavathi Kalyana Mandapam', N'Near Ayyapa Swamy Temple', N'Gollapudi', N'521225', 1, N'9848238688, 9849429599, 9848585121', N'16.54805556', N'80.57611111', 100000.0000, 1200, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46FB AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (24, N'NAC Kalyana Vedika', N'LIG-18,Opp Don Bosco School,Gurunanak Colony Road', N'Gurunanak Colony', N'520008', 1, N'0866 2547111, 9542264999', N'16.50277778', N'80.66888889', 100000.0000, 3000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46FD AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (25, N'Subhamastu Kalyana Vedika', N'Near Gollapudi Wholesale Market,HB Colony', N'Gollapudi', N'521225', 1, N'0866 2414440, 9493924440', N'16.53833333', N'80.59833333', 100000.0000, 2000, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A46FE AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (26, N'Samyuktha Vedika', N'NH-5 Frontage Road,Teachers Colony,Near Saibaba Temple,Stella College Road', N'Benz Circle', N'520010', 1, N'0866 6594567, 9949947087', N'16.5194444', N'80.67583333', 100000.0000, 1000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4700 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (27, N'Sai jewels kalyana mandapam', N'Road No-1,Sai Baba Temple Road,Near Stella Complex,Teachers Colony', N'Benz Circle', N'520008', 1, N'0866 6654660', N'16.5025', N'80.66361111', 100000.0000, 1000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4702 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (28, N'Vedika Kalyana Mandapam', N'Near Anjaneya Swamy Temple,Benz Circle', N'Benz Circle', N'520008', 1, N'9704783469, 9492223315', N'16.49722222', N'80.68194444', 100000.0000, 2000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4703 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (29, N'Aahvanam Kalyana Mandapam', N'Bandar Road,Sanath Nagar', N'Papulla Mill Centre', N'520007', 1, N'0866 2554300, 9949911458', N'16.48861111', N'80.68194444', 120000.0000, 2000, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4705 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (30, N'Mana Kalyana Vedika', N'Road No-2,Dr.Pinnamaneni Teachers colony,Ashok Nagar', N'Ashok Nagar', N'520007', 1, N'9399934570,8341577417,0866 2550405,0866 2550505', N'16.48861111', N'80.68388889', 150000.0000, 2000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4706 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (31, N'Sri Sesha Sai Kalyana Vedika', N'Behind HDFC Bank,Opp M&M Showroom,Valluri complex,Bandar Road', N'P&T Colony', N'520010', 1, N'0866 2492272, 0866 2494926, 9490754713,9490754708', N'16.49972222', N'80.64916667', 150000.0000, 2500, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4708 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (32, N'24K Golden Events', N'D.No: 3-34/2,Eluru Road,Enikepadu', N'Enikepadu', N'521108', 1, N'0866 2844116, 9948411116, 9948611116', N'16.51777778', N'80.69805556', 250000.0000, 5000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4709 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (33, N'A Convention Center', N'40-5-6A,Valluru Poorna Chandra Rao Road,Brundavan Colony', N'Labbipet', N'520010', 1, N'0866 2472345, 9248007818, 9248008818', N'16.49722222', N'80.64805556', 250000.0000, 3000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A470B AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (34, N'Tankasala Sree Seetha Ramulu Vari Kalyana Mandapam', N'Eluru Road,Enikepadu', N'Enikepadu', N'521108', 1, N'0866 2843255, 0866 2842888, 9440175144,8885587888', N'16.52777778', N'80.69472222', 250000.0000, 4000, 1, 1, 1, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A470C AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (35, N'Koduri Function Hall', N'24-28/4-10C,BRTS Road,Opp SN Puram Railway Quarters', N'Durga Puram', N'520003', 1, N'9440026677, 9441441551, 0866 2440234', N'16.52194444', N'80.6425', 0.0000, 0, 1, 0, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A470E AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (36, N'The Krishna District Lorry Owners Association Hall', N'Chandramouli Puram', N'Benz Circle', N'520010', 1, N'0866  2477742,0866 2473235,9701773344', N'16.49694444', N'80.6525', 0.0000, 0, 1, 0, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A470F AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (37, N'Kandukuri Kalyana Mandapam', N'Near Gymkana Grounds,Gandhi Nagar', N'Gandhi Nagar', N'520003', 1, N'', N'16.51933333', N'80.6183333', 0.0000, 0, 0, 0, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4711 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (38, N'Sri Vasavi Seva Sangam', N'D.No: 41-4-14,Metla Bazar,Krishna Lanka', N'Krishna Lanka', N'520013', 1, N'0866 2523042', N'', N'', 0.0000, 0, 1, 0, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4712 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (39, N'Milk Project Function Hall', N'Near Milk Project,Chitti Nagar', N'Milk Project', N'520009', 1, N'9703975582, 9441418954', N'16.53944444', N'80.61416667', 0.0000, 1000, 0, 0, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4714 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (40, N'Nadars Function Hall', N'23-2-6, Labour Office Near Maruthi Gas Agency, Bhagath Singh Road Or vt Press Road', N'Satya Narayana Puram', N'520011', 1, N'9393422144,0866 6462144', N'16.52194444', N'80.6375', 0.0000, 0, 1, 0, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4715 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (41, N'The Automobile Technicians Association Hall', N'21-10-11 Main Road ,Autonagar,Near sub station', N'Auto Nagar', N'520007', 1, N'0866 2543535,0866 2540606', N'16.50083333', N'80.67222222', 0.0000, 0, 0, 0, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4717 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (42, N'TTD Kalyana Mandapam', N'Punnama Thota,Behind All India Radio,MG Road', N'Bandar Road', N'520010', 1, N'0866 2470377', N'16.5075', N'80.63555556', 0.0000, 0, 0, 0, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4718 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (43, N'Vigneshwara Kalyana Mandapam', N'Bandar Road,Sanath Nagar', N'Papulla Mill Centre', N'520007', 1, N'0866 2554300, 9949911458', N'16.48861111', N'80.68194444', 40000.0000, 500, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4719 AS DateTime))
GO
INSERT [dbo].[Venue] ([Id], [Name], [Address], [Area], [Pincode], [CityId], [Phone], [Latitude], [Longitude], [Rent], [Capacity], [IsAirConditioned], [IsActive], [HasPhotos], [DbModifiedUtc], [DbCreatedUtc]) VALUES (44, N'N Convention Center', N'B.R. Ambedkar Road, Near Sitara Theater', N'Vidyadharapuram', N'520012', 1, N'93909 94455', N'16.536564', N'80.606522', 40000.0000, 1000, 1, 1, 0, CAST(0x0000A2A000000000 AS DateTime), CAST(0x0000A2BC009A4719 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Venue] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [AK_CategoryName]    Script Date: 11/24/2015 7:46:34 AM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [AK_CategoryName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [AK_CityName]    Script Date: 11/24/2015 7:46:34 AM ******/
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [AK_CityName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__PartnerT__3214EC066CD797B3]    Script Date: 11/24/2015 7:46:34 AM ******/
ALTER TABLE [dbo].[PartnerType] ADD UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getutcdate()) FOR [DbModifiedUtc]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getutcdate()) FOR [DbCreatedUtc]
GO
ALTER TABLE [dbo].[CatererMasterMenu] ADD  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[CatererMasterMenu] ADD  DEFAULT ((0)) FOR [PartnerId]
GO
ALTER TABLE [dbo].[CatererMasterMenu] ADD  DEFAULT (getutcdate()) FOR [DbModifiedUtc]
GO
ALTER TABLE [dbo].[CatererMasterMenu] ADD  DEFAULT (getutcdate()) FOR [DbCreatedUtc]
GO
ALTER TABLE [dbo].[CatererPackage] ADD  DEFAULT ((0)) FOR [PartnerId]
GO
ALTER TABLE [dbo].[CatererPackage] ADD  DEFAULT (getutcdate()) FOR [DbModifiedUtc]
GO
ALTER TABLE [dbo].[CatererPackage] ADD  DEFAULT (getutcdate()) FOR [DbCreatedUtc]
GO
ALTER TABLE [dbo].[CatererPackageMenu] ADD  DEFAULT ((0)) FOR [PackageId]
GO
ALTER TABLE [dbo].[CatererPackageMenu] ADD  DEFAULT (getutcdate()) FOR [DbModifiedUtc]
GO
ALTER TABLE [dbo].[CatererPackageMenu] ADD  DEFAULT (getutcdate()) FOR [DbCreatedUtc]
GO
ALTER TABLE [dbo].[CateringOrder] ADD  DEFAULT ((0)) FOR [PackageId]
GO
ALTER TABLE [dbo].[CateringOrder] ADD  DEFAULT (getutcdate()) FOR [DbModifiedUtc]
GO
ALTER TABLE [dbo].[CateringOrder] ADD  DEFAULT (getutcdate()) FOR [DbCreatedUtc]
GO
ALTER TABLE [dbo].[CateringReview] ADD  DEFAULT ((0)) FOR [OrderId]
GO
ALTER TABLE [dbo].[CateringReview] ADD  DEFAULT (getutcdate()) FOR [DbModifiedUtc]
GO
ALTER TABLE [dbo].[CateringReview] ADD  DEFAULT (getutcdate()) FOR [DbCreatedUtc]
GO
ALTER TABLE [dbo].[City] ADD  DEFAULT (getutcdate()) FOR [DbModifiedUtc]
GO
ALTER TABLE [dbo].[City] ADD  DEFAULT (getutcdate()) FOR [DbCreatedUtc]
GO
ALTER TABLE [dbo].[ContactUs] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ContactUs] ADD  DEFAULT (getutcdate()) FOR [DbModifiedUtc]
GO
ALTER TABLE [dbo].[ContactUs] ADD  DEFAULT (getutcdate()) FOR [DbCreatedUtc]
GO
ALTER TABLE [dbo].[Partner] ADD  DEFAULT ((0)) FOR [PartnerTypeId]
GO
ALTER TABLE [dbo].[Partner] ADD  DEFAULT (getutcdate()) FOR [DbModifiedUtc]
GO
ALTER TABLE [dbo].[Partner] ADD  DEFAULT (getutcdate()) FOR [DbCreatedUtc]
GO
ALTER TABLE [dbo].[PartnerType] ADD  DEFAULT (getutcdate()) FOR [DbModifiedUtc]
GO
ALTER TABLE [dbo].[PartnerType] ADD  DEFAULT (getutcdate()) FOR [DbCreatedUtc]
GO
ALTER TABLE [dbo].[Venue] ADD  DEFAULT ((0)) FOR [CityId]
GO
ALTER TABLE [dbo].[Venue] ADD  DEFAULT (getutcdate()) FOR [DbModifiedUtc]
GO
ALTER TABLE [dbo].[Venue] ADD  DEFAULT (getutcdate()) FOR [DbCreatedUtc]
GO
ALTER TABLE [dbo].[CatererMasterMenu]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[CatererMasterMenu]  WITH CHECK ADD FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([Id])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[CatererPackage]  WITH CHECK ADD FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([Id])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[CatererPackageMenu]  WITH CHECK ADD FOREIGN KEY([PackageId])
REFERENCES [dbo].[CatererPackage] ([Id])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[CateringOrder]  WITH CHECK ADD FOREIGN KEY([PackageId])
REFERENCES [dbo].[CatererPackage] ([Id])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[CateringReview]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[CateringOrder] ([Id])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD FOREIGN KEY([PartnerTypeId])
REFERENCES [dbo].[PartnerType] ([Id])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Venue]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
ON DELETE SET DEFAULT
GO
USE [master]
GO
ALTER DATABASE [easyevents] SET  READ_WRITE 
GO
