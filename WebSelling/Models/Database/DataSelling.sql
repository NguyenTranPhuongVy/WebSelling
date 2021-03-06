USE [master]
GO
/****** Object:  Database [WebSelling]    Script Date: 12/14/2020 11:36:57 AM ******/
CREATE DATABASE [WebSelling]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebSelling', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WebSelling.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebSelling_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WebSelling_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebSelling] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebSelling].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebSelling] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebSelling] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebSelling] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebSelling] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebSelling] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebSelling] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebSelling] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WebSelling] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebSelling] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebSelling] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebSelling] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebSelling] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebSelling] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebSelling] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebSelling] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebSelling] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebSelling] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebSelling] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebSelling] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebSelling] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebSelling] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebSelling] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebSelling] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebSelling] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebSelling] SET  MULTI_USER 
GO
ALTER DATABASE [WebSelling] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebSelling] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebSelling] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebSelling] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [WebSelling]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_ID] [int] IDENTITY(1,1) NOT NULL,
	[Admin_Pass] [nvarchar](100) NULL,
	[Admin_Pass2] [nvarchar](100) NULL,
	[Admin_Email] [nvarchar](200) NULL,
	[Admin_Role] [int] NULL,
	[Admin_Token] [varchar](200) NULL,
	[Admin_Activate] [bit] NULL,
	[Admin_DateCreate] [datetime] NULL,
	[Admin_DateLogin] [datetime] NULL,
	[Admin_Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Cart_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cart_TotalPament] [money] NULL,
	[Cart_Activate] [bit] NULL,
	[Cart_TotalProduct] [int] NULL,
	[User_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Cart_DateCreate] [datetime] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Cart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](100) NULL,
	[Category_Img] [nvarchar](2000) NULL,
	[Category_DateCreate] [datetime] NULL,
	[Category_DateEdit] [datetime] NULL,
	[Category_Activate] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[City_ID] [int] IDENTITY(1,1) NOT NULL,
	[City_Name] [nvarchar](200) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Comment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Comment_DateCreate] [datetime] NULL,
	[Comment_Content] [nvarchar](max) NULL,
	[Comment_Spam] [bit] NULL,
	[User_ID] [int] NULL,
	[Product_ID] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Comment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetailsInvoices]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailsInvoices](
	[DetailsInvoices_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Invoices_ID] [int] NULL,
 CONSTRAINT [PK_DetailsInvoices] PRIMARY KEY CLUSTERED 
(
	[DetailsInvoices_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoices](
	[Invoices_ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoices_Buyer] [nvarchar](300) NULL,
	[Invoices_Seller] [nvarchar](300) NULL,
	[Invoices_Address] [nvarchar](500) NULL,
	[Invoices_Phone] [varchar](12) NULL,
	[User_ID] [int] NULL,
	[Invoices_TotalPay] [int] NULL,
	[Invoices_DateCreate] [datetime] NULL,
	[Invoices_Note] [nvarchar](max) NULL,
	[StatusBill_ID] [int] NULL,
	[Invoices_EmailSeller] [nvarchar](100) NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[Invoices_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](100) NULL,
	[Product_Img] [nvarchar](2000) NULL,
	[Product_DateSubmit] [datetime] NULL,
	[Product_Activate] [bit] NULL,
	[Product_Price] [money] NULL,
	[Product_SalePrice] [money] NULL,
	[Product_Ship] [bit] NULL,
	[Product_View] [int] NULL,
	[Product_Love] [int] NULL,
	[Product_Amount] [int] NULL,
	[Product_Description] [nvarchar](max) NULL,
	[Product_Detail] [nvarchar](max) NULL,
	[Product_Option] [bit] NULL,
	[Product_DateCreate] [datetime] NULL,
	[Product_DateEdit] [datetime] NULL,
	[User_ID] [int] NULL,
	[SubCategory_ID] [int] NULL,
	[Category_ID] [int] NULL,
	[SubProduct_ID] [int] NULL,
	[Product_Bin] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Province]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[Province_ID] [int] IDENTITY(1,1) NOT NULL,
	[Province_Name] [nvarchar](200) NULL,
	[City_ID] [int] NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[Province_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RepLi]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepLi](
	[Repli_ID] [int] IDENTITY(1,1) NOT NULL,
	[Repli_DateCreate] [datetime] NULL,
	[Repli_Content] [nvarchar](max) NULL,
	[Comment_ID] [int] NULL,
	[User_ID] [int] NULL,
 CONSTRAINT [PK_RepLi] PRIMARY KEY CLUSTERED 
(
	[Repli_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StatusBill]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusBill](
	[StatusBill_ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusBill_Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_StatusBill] PRIMARY KEY CLUSTERED 
(
	[StatusBill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategory_ID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategory_Name] [nvarchar](100) NULL,
	[SubCategory_Img] [nvarchar](2000) NULL,
	[SubCategory_DateCreate] [datetime] NULL,
	[SubCategory_DateEdit] [datetime] NULL,
	[SubCategory_Activate] [bit] NULL,
	[Category_ID] [int] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubProduct]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubProduct](
	[SubProduct_ID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategory_ID] [int] NULL,
	[SubProduct_Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_SubProduct] PRIMARY KEY CLUSTERED 
(
	[SubProduct_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_LastName] [nvarchar](50) NULL,
	[User_Name] [nvarchar](50) NULL,
	[User_Token] [varchar](200) NULL,
	[User_Activate] [bit] NULL,
	[User_Pass] [nvarchar](60) NULL,
	[User_Email] [nvarchar](100) NULL,
	[User_Phone] [varchar](12) NULL,
	[User_Role] [int] NULL,
	[User_LinkF] [nvarchar](2000) NULL,
	[User_Img] [nvarchar](2000) NULL,
	[User_DateCreate] [datetime] NULL,
	[User_DateLogin] [datetime] NULL,
	[User_DateBirth] [date] NULL,
	[User_Sex] [int] NULL,
	[User_Address] [nvarchar](300) NULL,
	[Province_ID] [int] NULL,
	[City_ID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Views]    Script Date: 12/14/2020 11:36:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Views](
	[View_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[User_ID] [int] NULL,
	[View_Date] [datetime] NULL,
	[View_Bin] [bit] NULL,
 CONSTRAINT [PK_Views] PRIMARY KEY CLUSTERED 
(
	[View_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Admin_ID], [Admin_Pass], [Admin_Pass2], [Admin_Email], [Admin_Role], [Admin_Token], [Admin_Activate], [Admin_DateCreate], [Admin_DateLogin], [Admin_Name]) VALUES (1, N'AdminSelling1!!', N'Phuongvy99**', N'admin@gmail.com', 1, N'fb1edfde-42d5-4364-ad9c-db5cb8a58a46', 1, CAST(N'2020-10-20 16:15:06.083' AS DateTime), CAST(N'2020-12-14 11:32:00.580' AS DateTime), N'Nguyễn Trần Phương Vy')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (1, N'Xe Cộ', N'download.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-10-30 09:39:46.043' AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (2, N'Đồ Điện Tử', N'vi_smartphone-large-2013121017506.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-23 10:58:07.787' AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (3, N'Thú Cưng', N'lam-the-nao-thu-cung-co-the-cai-thien-suc-khoe-cua-ban2.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-23 14:57:04.250' AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (4, N'Giải Trí, Thể Thao', N'myKplus-laptop.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-23 15:33:20.127' AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (5, N'Đồ Văn Phòng', N'ban-ghe-van-phong-thanh-ly-03.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-23 15:33:29.950' AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (6, N'Đồ Nông Nghiệp', N'160036_P14_Nong_nghiYp.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-23 15:40:01.053' AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (7, N'Dịch Vụ', N'cong-so-3.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-23 15:40:19.040' AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (8, N'Mẹ Và Bé', N'kinh_nghiem_ban_hang_online_cac_shop_me_va_be_1.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-23 15:40:31.703' AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (9, N'Đồ Gia Dụng, Nội Thất', N'1554273577-can-dinh-huong-chu-de-cho-phong-giai-tri-tai-gia.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-23 15:40:44.430' AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (10, N'Cây Cảnh', N'33-1567649196717622170194-crop-15676492145021350614745.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-23 15:40:55.080' AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (12, N'Bất Động Sản', N'unnamed.jpg', CAST(N'2020-10-26 10:45:18.123' AS DateTime), CAST(N'2020-11-23 15:41:05.447' AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (13, N'Việc Làm', N'shutterstock_162650096.jpg', CAST(N'2020-10-26 10:53:26.883' AS DateTime), CAST(N'2020-11-23 15:39:49.477' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (1, N'Cần Thơ')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (2, N'TP.Hồ Chí Minh')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (3, N'Bình Dương')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (4, N'Hà Nội')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (5, N'Bình Phước')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (1, CAST(N'2020-11-18 00:00:00.000' AS DateTime), N'Cmm1', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (2, CAST(N'2020-11-18 00:00:00.000' AS DateTime), N'Hello', NULL, 7, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (3, CAST(N'2020-11-18 00:00:00.000' AS DateTime), N'Hello', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (4, CAST(N'2020-11-18 11:27:02.087' AS DateTime), N'hkhkhkh', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (5, CAST(N'2020-11-18 11:29:43.003' AS DateTime), N'sdadada', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (6, CAST(N'2020-11-18 11:29:49.843' AS DateTime), N'Xong', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (7, CAST(N'2020-11-18 12:47:25.243' AS DateTime), N'Yes', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (8, CAST(N'2020-11-18 12:47:41.060' AS DateTime), N'dâdadadaadad', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (9, CAST(N'2020-11-18 12:49:12.777' AS DateTime), N'Test', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (10, CAST(N'2020-11-18 13:00:53.013' AS DateTime), N'12456', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (11, CAST(N'2020-11-18 14:04:59.453' AS DateTime), N'addadadadad', NULL, 7, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (12, CAST(N'2020-11-18 14:07:09.060' AS DateTime), N'saddaaaddssss', NULL, 7, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (13, CAST(N'2020-11-18 14:07:59.830' AS DateTime), N'sdaddaaadad', NULL, 7, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (14, CAST(N'2020-11-18 14:10:28.747' AS DateTime), N'sdaddaadadadssdadaadadads', NULL, 7, 14)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (2, N'Tablet Galaxxy S3', N'but-s-pen-tablet-galaxy-tab-s3.jpg', CAST(N'2020-11-23 15:56:16.660' AS DateTime), 0, 8000000.0000, NULL, NULL, 132, 123123, NULL, N'<h2>Samsung Galaxy Tab S3</h2><p>Gây náo động nhất thị trường máy tính bảng trong thời gian vừa qua không thể không kể đến Samsung Galaxy Tab S3. Có thể nói dòng <a href="https://www.nguyenkim.com/may-tinh-ban-samsung/">tablet Samsung</a> này đã tiên phong trong cuộc cách mạng thiết kế khi cả hai mặt trước và sau đều là kính sáng bóng như gương, và được viền bởi bộ khung nhôm, mang đến cảm giác sang trọng. Nút Home cứng vẫn đảm nhận công việc cảm biến vân tay trên chiếc máy tính màn hình AMOLED 9.7 inch.</p>', N'<h2><strong>Thông số kỹ thuật chi tiết Máy tính bảng Samsung Galaxy Tab S3</strong></h2><ul><li>Màn hình.</li><li>Công nghệ màn hình:Super AMOLED.</li><li>Độ phân giải:1536 x 2048 Pixels.</li><li>Kích thước màn hình:9.7"</li><li>Hệ điều hành &amp; CPU.</li><li>Hệ điều hành:Android 7.</li><li>Chip xử lý (CPU):Snapdragon 820 4 nhân.</li><li>Tốc độ CPU:2 nhân 2.15 GHz &amp; 2 nhân 1.6 GHz.</li></ul>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-23 15:56:16.660' AS DateTime), 3, 1, 2, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (3, N'Chó Poodle', N'ThuCung.jpg', CAST(N'2020-11-24 08:11:17.783' AS DateTime), 1, 9000000.0000, NULL, NULL, 51, 28, NULL, N'Chó săn vịt là một giống chó săn dùng để săn các loại thủy cầm trong đó chủ yếu là vịt. Ngày nay giống chó này được lai tạo để trở thành dòng chó cảnh. Tên "Poodle" của chúng xuất phát từ chữ "Pudel" trong tiếng Đức, nghĩa là "thợ lặn" hay là "chó lội nước" và bộ lông của chúng có thể đè bẹp cơ thể khi ở trong nước.', N'<p>CÁC LƯU Ý KHI NUÔI CHÓ POODLE – Chó Poodle 2 tháng tuổi đã cai sữa mẹ và đang ở giai đoạn tập ăn, hệ tiêu hóa vẫn còn chưa phát triển toàn diện nên cần 1 chế độ ăn uống hợp lý. – Nên cho chó ăn 2 lần/ngày, đảm bảo bữa ăn đầy đủ các chất dinh dưỡng. Đối với Poodle size Standard cần 1,5 – 3 chén thức ăn khô mỗi ngày; Mini Poodle thì cần ¾ – 1 chén; Toy Poodle có kích thước khá nhỏ thì chỉ cần ¼ – ½ chén mỗi ngày. Đặc biệt nên chú ý cho chó ăn đúng bữa, đúng tiêu chuẩn để kiểm soát cân nặng, tránh những vấn đề sức khỏe xấu có thể xảy ra. – Dù là giống chó nhỏ, không cần không gian quá rộng lớn, nhưng bạn cần để chó vui chơi thoải mái. Nên đưa chúng ra ngoài đi dạo, chơi đùa và vận động thể lực thường xuyên. LƯU Ý KHI HUẤN LUYỆN - Cần phải huấn luyện Poodle ngay từ khi còn nhỏ để sớm hình thành những thói quen tốt cho chúng. Thời gian và cách thức huấn luyện cần được lên lịch bài bản và hợp lý. Tốt nhất là dạy chó vào buổi sáng hoặc chiều, duy trì khoảng 25 phút mỗi ngày. Dạy từ dễ đến khó, tránh để chó phải hoạt động quá sức. - Khi ra lệnh huấn luyện phải ngắn gọn, rõ ràng, dứt khoát. Các bài tập nên dãn cách từ 25 – 30 giây để chó có thời gian nghe hiểu và thực hiện. Tránh dạy dồn dập và ra các lệnh quá khó làm chó không hiểu được. - Thái độ huấn luyện cần cương quyết nhưng phải kiên nhẫn, không nên quát mắng hay làm chó sợ hãi. Mỗi lần chó hoàn thành bài tập, cần khen thưởng bằng đồ ăn hay vuốt ve chúng.</p>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-24 08:11:17.783' AS DateTime), 3, 14, 3, 4, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (4, N'Đàn Guitar', N'guitar.jpg', CAST(N'2020-11-26 13:09:18.087' AS DateTime), 1, 10000000.0000, NULL, NULL, 33, 28, NULL, N'<p>Đàn guitar Acoustic Fender CD-60SCE Dreadnought cutaway tự hào với các tính năng bạn mong muốn trên các phiên bản đắt hơn nhiều, với mặt top thùng đàn gỗ spruce nguyên khối. Cây guitar acoustic cutaway dreadnought Đàn guitar CD-60SCE có dáng Cutaway dreadnought (hay còn gọi là dáng D khuyết). Thùng đàn lớn cho tiếng đàn to, ấm và đầy hơn, phù hợp cho các bạn chơi đệm và dùng pick. Dễ dàng sử dụng Các phím đàn trọn trịa trên mặt phím Rosewood tạo cảm giác thoải mái vô cùng, lý tưởng cho người chơi bắt đầu hoặc những người chưa có nhiều kinh nghiệm.</p>', N'<p><strong>Mặt sau và bên hông được làm từ gỗ mahogany</strong></p><p><strong>Gỗ mahogany được dùng làm mặt sau và hai bên hông đàn guitar CD-60SCE cho âm thanh rất rõ ràng. Âm thanh ấm và hợp với nhạc blues và kỹ thuật fingerpicking.</strong></p><p>&nbsp;</p><p><strong>Mặt trước đàn bằng gỗ spruce rắn chắc</strong></p><p><strong>Spruce là loại gỗ có độ bền và độ dẻo dai cao, được sử dụng rất phổ biến để làm soundboard đàn. Đặc tính của gỗ Spruce là rất cứng và nhẹ, chính vì vậy đây cũng là loại gỗ có tốc độ truyền âm thanh, độ vang rất cao, giai điệu rất rõ ràng và đầy đủ, phản ứng tốt với bất kỳ phong cách chơi acoustic nào, từ hard strumming đếm fast flatpicking hay delicate fingerpicking.</strong></p><p>&nbsp;</p><p><strong>Hệ thống pickup của Fishman</strong></p><p><strong>CD-60SCE sử dụng pick-up của Fishman với EQ 3-band với các tùy chỉnh: bass, mid, treble và một nút điều chỉnh âm lượng. Đặc biệt còn có chức năng chromatic tuner tích hợp sẵn giúp bạn giữ cây đàn đúng tông, và chromatic tuner giúp bạn dễ dàng chỉnh dây theo những tông khác nhau (Half step down, D tuning, Open E...) hơn những loại tuner thông thường. Preamp của Fishman® mang lại hiệu suất khuếch đại vô song cho cây đàn của bạn, phù hợp với những ai có nhu cầu chơi biểu diễn trên sân khấu với hệ thống âm thanh lớn.</strong></p>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-26 13:09:18.087' AS DateTime), 3, 15, 4, 5, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (5, N'Mèo Ragdoll', N'meo-ragdoll-7.jpg', CAST(N'2020-11-26 14:06:26.427' AS DateTime), 1, 20000000.0000, NULL, NULL, 31, 28, NULL, N'<p>Người tìm thấy Ragdoll lần đầu tiên vào thập niên 60 là Ann Baker, một chuyên gia gây giống mèo Ba Tư ở California. <strong>Mèo Ragdoll</strong> xuất hiện là do sự lai tạo phức tạp từ nhiều giống mèo khác nhau, khởi điểm là một cô mèo cái xinh xắn tên là Josephine. Sau một vụ tai nạn giao thông, Josephine phải trải qua các thí nghiệm về di truyền và dường như từ đó cấu trúc gen của cô mèo này đã bị thay đổi.</p><p>Ann Baker thấy rằng cô mèo Josephine trở nên ngoan ngoãn, dễ bảo và thân thiện hơn, cũng giỏi chịu đau hơn và cơ thể sẽ mềm nhũn khi được bế lên. Sau khi khỏi bệnh, những chú mèo mà Josephine sinh ra cũng mặc một chứng tương tự như mẹ nó đó là cơ thể khi được con người bế lên sẽ nhũn ra. Tính cách của đám mèo con cũng hiền hòa như mèo mẹ. Cũng từ đây, Ann Baker đã bắt tay vào gây giống Ragdoll Cat. Và hiệp hội <i>mèo Ragdoll</i> được thành lập và xây dựng lên nhiều tiêu chuẩn, quy định nghiêm ngặt. Sau một khoảng thời gian dài đấu tranh nhằm mục đích tìm kiếm sự thừa nhận cho Ragdoll thì đến năm 2002, giống mèo này đã được công nhận toàn thế giới là nòi mèo riêng biệt.</p><h3>Chế độ ăn cho mèo Ragdoll</h3><p>Bản tính lười nhác đã “ăn sâu trong máu” nên bạn cần để ý đến việc lựa chọn <a href="https://petmaster.vn/shop-cho-meo/thuc-an-cho-meo/">thức ăn cho mèo</a> và tập luyện của giống mèo này. Nếu những loài mèo khác mỗi bữa ăn 1 thìa hạt khô thì với Ragdoll cần tăng lên là 1.5 hoặc 2 thìa. Tuy nhiên, sau khi ăn xong từ 30 phút – 1 tiếng, bạn cần kéo chúng ngồi dậy chơi đùa hoặc cho đi dạo để tiêu hao bớt năng lượng, tránh tình trạng thừa cân.</p><p>Các loại thực phẩm dành cho <i>mèo Ragdoll</i> cũng tương tự như các loài mèo cảnh khác. Nhóm đồ ăn tươi như thịt bò, thịt gà, nội tạng động vật, rau củ quả,… đều cung cấp đầy đủ protein, chất xơ cho mèo tuy nhiên cần được chế biến kĩ càng để mèo không bị rối loạn tiêu hóa. Bạn có thể cho mèo ăn hạt khô nếu không có nhiều thời gian nấu nướng. Nhưng cách tiết kiệm nhất vẫn là tự làm pate tại nhà, rẻ mà vẫn đầy đủ chất dinh dưỡng.</p><h3>Chăm sóc lông cho mèo Ragdoll</h3><p><i>Mèo Ragdoll</i> có bộ lông dài và dày, chính vì thế việc lông rụng quanh năm là điều không thể tránh hỏi. Để hạn chế tình trạng này, bạn nên chải lông thường xuyên cho mèo 1 lần/ngày bằng lược chải chuyên dụng cho mèo. Chú ý gỡ những phần lông bết dính, bị rối tránh cho mèo liếm lông quá nhiều.</p><p>Bên cạnh đó, nên chăm chỉ tắm cho chúng mỗi tuần một lần để bộ lông luôn bóng mượt, thơm tho, loại bỏ bụi bẩn và chất rận. Nếu lười một chút thì có thể để 2 – 3 tuần tắm 1 lần. Bạn cũng có thể đem mèo ra những tiệm spa thú cưng với chi phí mỗi lần tắm từ 100.000 VNĐ. Sau khi tắm xong bạn nên sấy khô lông cho chúng, lông mèo còn ướt sẽ gây ra cảm lạnh, ho hoặc viêm phổi.<br>&nbsp;</p>', N'<p>Ragdoll có đầy đủ sự tinh tế, duyên dáng của một con mèo, nhưng lại có những nét tính cách đặc trưng của loài chó.</p><ul><li>Xếp loại: mèo cỡ lớn</li><li>Nguồn gốc: Mỹ</li><li>Mắt: màu xanh</li><li>Lông: nhiều màu trắng</li><li>Tuổi thọ: 12-15 năm</li><li>Chiều cao: 38-50 cm</li><li>Giá bán tham khảo: 12.000.000 – 20.000.000 VNĐ</li><li>Cân nặng: 4-9 kg</li><li>Đặc điểm: thân thiện, quấn chủ</li></ul><h2>Thang điểm đánh giá chung</h2><ul><li>Mức độ quấn chủ 100%</li><li>Mức độ kêu 80%</li><li>Mức độ rụng lông 60%</li><li>Mức độ mùi hôi 20%</li><li>Mức độ dễ làm đẹp 20%</li><li>Thân thiện với trẻ em 100%</li><li>Thân thiện với động vật khác 80%</li><li>Khả năng vận động 80%</li><li>Khả năng học hỏi 80%</li><li>Khả năng chịu lạnh 80%</li></ul>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-26 14:06:26.427' AS DateTime), 3, 2, 3, 6, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (6, N'Xe Huyndai Palisade', N'hyundai-palisade-xe-7-cho-co-lon-tai-viet-nam-1563766660_1200x0.jpg', CAST(N'2020-12-07 13:40:15.213' AS DateTime), 1, 650000000.0000, NULL, NULL, 48, 28, NULL, N'<p><strong>Palisade 2020</strong> là một mẫu SUV có vẻ ngoài to lớn, đồ sộ với phong cách thiết kế thiên về sự sang trọng.</p><p>Xe nhà đi được 120000 km.</p><p>Vui lòng liên hệ trước để xem xe.</p>', N'<h2><strong>Thông số kỹ thuật Hyundai Palisade 2020</strong></h2><figure class="table"><table><tbody><tr><td>Tên xe</td><td>Hyundai Palisade 2020</td></tr><tr><td>Số chỗ ngồi</td><td>08</td></tr><tr><td>Kiểu xe</td><td>SUV cỡ lớn</td></tr><tr><td>Xuất xứ</td><td>Nhập khẩu</td></tr><tr><td>Kích thước tổng thể DxRxC (mm)</td><td>4980 x 1975 x 1750</td></tr><tr><td>Chiều dài cơ sở (mm)</td><td>2900</td></tr><tr><td>Tự trọng</td><td>2030 kg</td></tr><tr><td>Động cơ</td><td>Diesel 2.2L 4 xy lanh thẳng hàng</td></tr><tr><td>Dung tích công tác</td><td>2199cc</td></tr><tr><td>Công suất tối đa</td><td>197 mã lực tại 3800 vòng/phút</td></tr><tr><td>Mô men xoắn cực đại</td><td>441 Nm tại 1750-2750 vòng/phút</td></tr><tr><td>Hộp số</td><td>Tự động 8 cấp</td></tr><tr><td>Hệ dẫn động</td><td>2 bánh hoặc 4 bánh HTRAC</td></tr><tr><td>Khoảng sáng gầm xe (mm)</td><td>225</td></tr><tr><td>Cỡ mâm</td><td>18 inch, tuỳ chọn 20 inch</td></tr></tbody></table></figure>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-12-07 13:40:15.213' AS DateTime), 7, 6, 1, 7, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (7, N'Xe Innova 7 chỗ ', N'Ve-mua-o-to-cho-xe-toyota-innova-1.jpg', CAST(N'2020-12-07 13:42:21.020' AS DateTime), 1, 500000000.0000, NULL, NULL, 41, 28, NULL, N'<h2>Liên hệ báo giá xe + kèm theo ưu đãi mới nhất</h2><p>Mọi thắc mắc cũng như giải đáp, qúy khách hàng vui lòng gọi với chúng tôi qua số hotline dưới góc màn hình.</p>', N'<h3>Innova số tự động</h3><figure class="table"><table><tbody><tr><td>&nbsp;</td><td><strong>Innova 2.0 V</strong></td><td><strong>Innova Venturer</strong></td><td><strong>Innova 2.0 G</strong></td></tr><tr><td>D x R x C</td><td>4735 x 1830 x 1795</td><td>4735x1830x1795</td><td>4735 x 1830 x 1795</td></tr><tr><td>Chiều dài cơ sở</td><td>2750</td><td>2750</td><td>2750</td></tr><tr><td>Chiều rộng cơ sở (Trước/ sau)</td><td>1540 x 1540</td><td>1540/1540</td><td>1540 x 1540</td></tr><tr><td>Khoảng sáng gầm xe</td><td>178</td><td>178</td><td>178</td></tr><tr><td>Góc thoát (Trước/ sau)</td><td>21/ 25</td><td>21/25</td><td>21/25</td></tr><tr><td>Bán kính vòng quay tối thiểu</td><td>5,4</td><td>5.4</td><td>5,4</td></tr><tr><td>Trọng lượng không tải</td><td>1755</td><td>1725</td><td>1720-1725</td></tr><tr><td>Trọng lượng toàn tải</td><td>2330</td><td>2360</td><td>2370</td></tr><tr><td>Loại động cơ</td><td>Động cơ xăng, VVT-i kép, 4 xy lanh thẳng hàng, 16 van DOHC</td><td>Động cơ xăng, VVT-i kép, 4 xy lanh thẳng hàng, 16 van DOHC</td><td>Động cơ xăng, VVT-i kép, 4 xy lanh thẳng hàng, 16 van DOHC</td></tr><tr><td>Dung tích công tác</td><td>1998</td><td>1998</td><td>1998</td></tr><tr><td>Công suất tối đa</td><td>102 / 5600</td><td>102/5600</td><td>102 / 5600</td></tr><tr><td>Mô men xoắn tối đa</td><td>183 / 4000</td><td>183/4000</td><td>183 / 4000</td></tr><tr><td>Dung tích bình nhiên liệu</td><td>55</td><td>55</td><td>55</td></tr><tr><td>&nbsp;</td><td>Euro 4</td><td>Euro 4</td><td>Euro 4</td></tr><tr><td>&nbsp;</td><td>Tự động 6 cấp</td><td>Tự động 6 cấp</td><td>Tự động 6 cấp</td></tr><tr><td>Trước</td><td>Tay đòn kép, lò xo cuộn và thanh cân bằng</td><td>Tay đòn kép, lò xo cuộn và thanh cân bằng</td><td>Tay đòn kép, lò xo cuộn và thanh cân bằng</td></tr><tr><td>Sau</td><td>Liên kết 4 điểm, lò xo cuộn và tay đòn bên</td><td>Liên kết 4 điểm, lò xo cuộn và tay đòn bên</td><td>Liên kết 4 điểm, lò xo cuộn và tay đòn bên</td></tr><tr><td>Loại vành</td><td>Mâm đúc</td><td>Mâm đúc màu đen</td><td>Mâm đúc</td></tr><tr><td>Kích thước lốp</td><td>215/55R17</td><td>205/65R16</td><td>205/65R16</td></tr><tr><td>Trước</td><td>Đĩa thông gió</td><td>Đĩa thông gió</td><td>Đĩa thông gió</td></tr><tr><td>Sau</td><td>Tang trống</td><td>Tang trống</td><td>Tang trống</td></tr><tr><td>Trong đô thị</td><td>11.4</td><td>–</td><td>–</td></tr><tr><td>Ngoài đô thị</td><td>7.8</td><td>–</td><td>–</td></tr><tr><td>Kết hợp</td><td>9.1</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>Đèn chiếu gần</td><td>LED, dạng thấu kính</td><td>Halogen, phản xạ đã chiều</td><td>Halogen phản xạ đa chiều</td></tr><tr><td>Đèn chiếu xa</td><td>Halogen, phản xạ đa chiều</td><td>Halogen, phản xạ đã chiều</td><td>Halogen phản xạ đa chiều</td></tr><tr><td>Hệ thống điều khiển đèn tự động</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>Hệ thống điều chỉnh góc chiếu</td><td>Tự động</td><td>Chỉnh tay</td><td>Chỉnh tay</td></tr><tr><td>Chế độ đèn chờ dẫn đường</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;</td><td>Bóng đèn thường</td><td>Bóng đèn thường</td><td>Bóng đèn thường</td></tr><tr><td>&nbsp;</td><td>LED</td><td>LED</td><td>LED</td></tr><tr><td>Trước</td><td>Có</td><td>Có (Màu MLM)</td><td>Có</td></tr><tr><td>Chức năng điều chỉnh điện</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Chức năng gập điện</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Tích hợp đèn báo rẽ</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Mạ Crôm</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;</td><td>Gián đoạn, điều chỉnh thời gian</td><td>Gián đoạn, điều chỉnh thời gian</td><td>Gián đoạn, điều chỉnh thời gian</td></tr><tr><td>&nbsp;</td><td>Dạng vây cá</td><td>Dạng vây cá</td><td>Dạng vây cá</td></tr><tr><td>&nbsp;</td><td>Mạ crôm</td><td>Cùng màu thân xe</td><td>Cùng màu thân xe</td></tr><tr><td>&nbsp;</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Loại tay lái</td><td>3 chấu, bọc da, ốp gỗ, mạ bạc</td><td>3 chấu, bọc da, ốp gỗ, mạc bạc</td><td>3 chấu, urethane, mạ bạc</td></tr><tr><td>Chất liệu</td><td>Da</td><td>Da</td><td>Urethane</td></tr><tr><td>Nút bấm điều khiển tích hợp</td><td>Hệ thống âm thanh, điện thoại rảnh tay, màn hình hiển thị đa thông tin</td><td>Hệ thống âm thanh, điện thoại rảnh tay, màn hình hiển thị đa thông tin</td><td>Hệ thống âm thanh, điện thoại rảnh tay, màn hình hiển thị đa thông tin</td></tr><tr><td>Điều chỉnh</td><td>Chỉnh tay 4 hướng</td><td>Chỉnh tay 4 hướng</td><td>Chỉnh tay 4 hướng</td></tr><tr><td>Trợ lực lái</td><td>Thủy lực</td><td>Thủy lực</td><td>Thủy lực</td></tr><tr><td>&nbsp;</td><td>2 chế độ ngày &amp; đêm</td><td>2 chế độ ngày/đêm</td><td>2 chế độ ngày &amp; đêm</td></tr><tr><td>&nbsp;</td><td>Ốp gỗ, viền trang trí mạ bạc</td><td>Ốp gỗ, viền trang trí mạ bạc</td><td>Viền trang trí mạ bạc</td></tr><tr><td>&nbsp;</td><td>Mạ crôm</td><td>Mạ Crôm</td><td>Mạ crôm</td></tr><tr><td>Loại đồng hồ</td><td>Optitron</td><td>Optitron</td><td>Optitron</td></tr><tr><td>Đèn báo chế độ Eco</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Chức năng báo lượng tiêu thụ nhiên liệu</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Chức năng báo vị trí cần số</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Màn hình hiển thị đa thông tin</td><td>Màn hình TFT 4.2-inch</td><td>Màn hình TFT 4.2 inch</td><td>Màn hình TFT 4.2-inch</td></tr><tr><td>&nbsp;</td><td>Da</td><td>Nỉ cao cấp</td><td>Nỉ cao cấp</td></tr><tr><td>Loại ghế</td><td>Loại thường</td><td>Loại thường</td><td>Loại thường</td></tr><tr><td>Điều chỉnh ghế lái</td><td>Chỉnh điện 8 hướng</td><td>Chỉnh cơ 6 hướng</td><td>Chỉnh tay 6 hướng</td></tr><tr><td>Điều chỉnh ghế hành khách</td><td>Chỉnh tay 4 hướng</td><td>Chỉnh cơ 4 hướng</td><td>Chỉnh tay 4 hướng</td></tr><tr><td>Hàng ghế thứ hai</td><td>Ghế rời, chỉnh cơ 4 hướng, có tựa tay</td><td>Gập 60:40, chỉnh cơ 4 hướng</td><td>Gập 60:40, chỉnh cơ 4 hướng</td></tr><tr><td>Hàng ghế thứ ba</td><td>Ngả lưng ghế, gấp 50:50, gập sang 2 bên</td><td>Ngả lưng ghế, gập 50:50, gập sang 2 bên</td><td>Ngả lưng ghế, gấp 50:50, gập sang 2 bên</td></tr><tr><td>Tựa tay hàng ghế thứ hai</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;Hệ thống điều hòa</td><td>2 dàn lạnh, tự động</td><td>2 dàn lạnh, tự động</td><td>2 dàn lạnh, tự động</td></tr><tr><td>Cửa gió sau</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Loại loa</td><td>Loại thường</td><td>Loại thường</td><td>Loại thường</td></tr><tr><td>Đầu đĩa</td><td>DVD 1 đĩa, màn hình cảm ứng 7 inch</td><td>DVD 1 đĩa, màn hình cảm ứng 7 inch</td><td>DVD 1 đĩa, màn hình cảm ứng 7 inch</td></tr><tr><td>Số loa</td><td>6</td><td>6</td><td>6</td></tr><tr><td>Cổng kết nối AUX</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Cổng kết nối USB</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Đầu đọc thẻ</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>Kết nối Bluetooth</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống điều khiển bằng giọng nói</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>&nbsp;</td><td>Có, một chạm, chống kẹt tất cả các cửa</td><td>Có, một chạm cho tất cả các cửa, chống kẹt (phía người lái)</td><td>Có, một chạm, chống kẹt (phía người lái)</td></tr><tr><td>&nbsp;</td><td>Chế độ Eco và chế độ Power</td><td>Chế độ tiết kiệm và công suất cao</td><td>Chế độ Eco và chế độ Power</td></tr><tr><td>&nbsp;</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống chống bó cứng phanh</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống hỗ trợ lực phanh khẩn cấp</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống phân phối lực phanh điện tử</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống cân bằng điện tử</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống kiểm soát lực kéo</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống hỗ trợ khởi hành ngang dốc</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Đèn báo phanh khẩn cấp</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Camera lùi</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;Cảm biến Sau</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Túi khí người lái &amp; hành khách phía trước</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Túi khí bên hông phía trước</td><td>Có</td><td>Có</td><td>Không</td></tr><tr><td>Túi khí rèm</td><td>Có</td><td>Có</td><td>Không</td></tr><tr><td>Túi khí đầu gối người lái</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Dây đai an toàn</td><td>3 điểm (7 vị trí)</td><td>3 điểm (8 vị trí)</td><td>3 điểm (8 vị trí)</td></tr><tr><td>&nbsp;Cột lái tự đổ</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Ghế có cấu trúc giảm chấn thương cổ</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống báo động</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống mã hóa khóa động cơ</td><td>Có</td><td>Có</td><td>Có</td></tr></tbody></table></figure>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-12-07 13:42:21.020' AS DateTime), 7, 6, 1, 3, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (8, N'EXCITER 150 ', N'exciter.jpg', CAST(N'2020-12-11 19:42:43.733' AS DateTime), 1, 48500000.0000, NULL, NULL, 35, 28, NULL, N'<p><strong>EXCITER 150 PHIÊN BẢN GP</strong></p><p><strong>Cần sang gấp con xe.</strong></p>', N'<p><strong>Động cơ</strong></p><p>&nbsp;</p><figure class="table"><table><tbody><tr><td>Loại</td><td><strong>4 thì, 4 van, SOHC, làm mát bằng dung dịch</strong></td></tr><tr><td>Bố trí xi lanh</td><td><strong>Xy lanh đơn</strong></td></tr><tr><td>Dung tích xy lanh (CC)</td><td><strong>150</strong></td></tr><tr><td>Đường kính và hành trình piston</td><td><strong>57.0 x 58.7 mm</strong></td></tr><tr><td>Tỷ số nén</td><td><strong>10.4:1</strong></td></tr><tr><td>Công suất tối đa</td><td><strong>11,3 kW (15,4 PS) / 8.500 vòng/phút</strong></td></tr><tr><td>Mô men cực đại</td><td><strong>13,8 N·m (1,4 kgf·m) / 7.000 vòng/phút</strong></td></tr><tr><td>Hệ thống khởi động</td><td><strong>Điện</strong></td></tr><tr><td>Hệ thống bôi trơn</td><td><strong>Cácte ướt</strong></td></tr><tr><td>Dung tích bình xăng</td><td><strong>4,2 lít</strong></td></tr><tr><td>Mức tiêu thụ nhiên liệu (l/100km)</td><td><strong>2,00</strong></td></tr><tr><td>Bộ chế hòa khí</td><td><strong>Phun xăng (1 vòi phun)</strong></td></tr><tr><td>Hệ thống đánh lửa</td><td><strong>T.C.I (kỹ thuật số)</strong></td></tr><tr><td>Hệ thống ly hợp</td><td><strong>Ly tâm loại ướt</strong></td></tr><tr><td>Tỷ số truyền động</td><td><strong>1: 2.833 / 2: 1.875 / 3: 1.429 / 4: 1.143 / 5: 0.957</strong></td></tr><tr><td>Kiểu hệ thống truyền lực</td><td><strong>5 số</strong></td></tr></tbody></table></figure><p><strong>Khung xe</strong></p><p>&nbsp;</p><figure class="table"><table><tbody><tr><td>Loại khung</td><td><strong>Ống thép – cấu trúc kim cương</strong></td></tr><tr><td>Hệ thống giảm xóc trước</td><td><strong>Ống lồng</strong></td></tr><tr><td>Độ lệch phương trục lái</td><td><strong>26/ 81.0 mm</strong></td></tr><tr><td>Hệ thống giảm xóc sau</td><td><strong>Cánh tay đòn</strong></td></tr><tr><td>Phanh trước</td><td><strong>Đĩa thủy lực (đường kính 245.0 mm)</strong></td></tr><tr><td>Phanh sau</td><td><strong>Đĩa thủy lực (đường kính 203.0 mm)</strong></td></tr><tr><td>Lốp trước</td><td><strong>90/80-17M/C 46P (lốp không săm)</strong></td></tr><tr><td>Lốp sau</td><td><strong>120/70-17M/C 58P (lốp không săm)</strong></td></tr><tr><td>Giảm xóc trước</td><td><strong>Cuộn lò xo</strong></td></tr><tr><td>Giảm xóc sau</td><td><strong>Van điều tiết thuỷ lực</strong></td></tr><tr><td>Đèn trước</td><td><strong>Bóng đèn LED 12V 10W x2</strong></td></tr><tr><td>Đèn sau</td><td><strong>Bóng đèn LED 12V 10W x2</strong></td></tr></tbody></table></figure><p><strong>Kích thước</strong></p><p>&nbsp;</p><figure class="table"><table><tbody><tr><td>Kích thước (dài x rộng x cao)</td><td><strong>1,985 mm × 670 mm × 1,100 mm</strong></td></tr><tr><td>Độ cao yên xe</td><td><strong>795 mm</strong></td></tr><tr><td>Khoảng cách giữa 2 trục bánh xe</td><td><strong>1,290 mm</strong></td></tr><tr><td>Độ cao gầm xe</td><td><strong>155mm</strong></td></tr><tr><td>Trọng lượng ướt</td><td><strong>117 kg</strong></td></tr></tbody></table></figure><p><strong>Bảo hành</strong></p><p>&nbsp;</p><figure class="table"><table><tbody><tr><td>Thời gian bảo hành</td><td><strong>3 năm/ 30,000km</strong></td></tr></tbody></table></figure>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-12-11 19:42:43.733' AS DateTime), 3, 7, 1, 9, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (9, N'Xe Camry 2.4G 2009', N'932-216-toyota-camry-2009.jpg', CAST(N'2020-12-11 18:33:46.467' AS DateTime), 1, 450000000.0000, NULL, NULL, 13, 28, NULL, N'<p>Toyota Camry màu bạc, số tự động, máy 2.4 sản xuất 2009, biển HN, xe zin nguyên còn tốt.<br>Trang bị: cảm biến xung quanh xe, điều hòa tự động, volang tích hợp, ghế chỉnh điện, màn hình, xi nhan gương,...<br>Cam kết không đâm đụng ngập nước</p>', N'<h3><strong>Thông số cơ bản</strong></h3><p>&nbsp; Xuất xứ:Lắp ráp trong nước</p><p>&nbsp; Tình trạng:Xe đã dùng</p><p>&nbsp; Dòng xe:Sedan</p><p>&nbsp; Số Km đã đi:0 Km</p><p>&nbsp; Màu ngoại thất:Đen</p><p>&nbsp; Màu nội thất:</p><p>&nbsp; Số cửa:4 cửa</p><p>&nbsp; Số chỗ ngồi:5 chỗ</p><h3><strong>Nhiên liệu - động cơ</strong></h3><p>&nbsp; Động cơ:Xăng 2.4 L</p><p>&nbsp; Hệ thống nạp nhiên liệu:</p><h3><strong>Hộp số chuyển động</strong></h3><p>&nbsp; Hộp số:Số tự động</p><p>&nbsp; Dẫn động:FWD - Dẫn động cầu trước</p><p>&nbsp; Tiêu thụ nhiên liệu:L/100Km</p>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-12-11 18:33:46.467' AS DateTime), 7, 6, 1, 3, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (14, N'SamsungJ7 Pro', N'samsung_galaxy_j7_pro.jpg', CAST(N'2020-12-07 13:49:22.047' AS DateTime), 1, 7000000.0000, NULL, NULL, 297, 1, NULL, N'<p>Không có</p>', N'<h4><strong>Thông số kỹ thuật chi tiết Điện thoại Samsung Galaxy J7 Pro</strong></h4><p>Màn hình.</p><p>Công nghệ màn hình:Super AMOLED.</p><p>Độ phân giải:Full HD (1080 x 1920 Pixels)</p><p>Màn hình rộng:5.5"</p><p>Mặt kính cảm ứng:Kính cường lực Corning Gorilla Glass 4.</p><p>Độ phân giải:13 MP.</p><p>Quay phim:Có quay phim.</p><p>Đèn Flash:Có</p>', NULL, CAST(N'2020-11-07 21:20:11.000' AS DateTime), CAST(N'2020-12-07 13:49:22.047' AS DateTime), 3, 8, 2, 2, 1)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (15, N'Mèo Lông Ngắn (Đen)', N'meo-anh-long-ngan2.jpg', CAST(N'2020-12-11 19:43:40.770' AS DateTime), 1, 6500000.0000, NULL, NULL, 58, 0, NULL, N'<h2>Nguồn gốc của mèo Anh lông ngắn</h2><p>Cái tên của loài mèo này đã nói lên quê hương chúng rồi, đó là vương quốc Anh xinh đẹp. Chúng xuất hiện vào khoảng 100 năm TCN. Qua nhiều quá trình lai tạo giống mèo Ai Cập và giống mèo bản địa Anh, thêm với giống mèo Ba Tư, mèo Anh mà chúng ta nhìn thấy ngày nay vô cùng đáng yêu, xinh đẹp.</p><p>Với những phẩm chất cũng đáng yêu</p>', N'<p><strong>Aln</strong> tỏ ra vô cùng dễ tính trong ăn uống, chủ nhân cho ăn gì là sẽ ăn ngon lành, từ thức hạt chế biến sẵn cho đến đồ tự nấu. Tuy nhiên, cần xây dựng một thực đơn ăn uống khoa học, cung cấp đầy đủ chất dinh dưỡng có lợi cho sự phát triển của mèo như: protein (có trong thịt, cá), rau kèm 1 miếng pate hoặc phô mai – món ăn khoái khẩu, nên nhớ là luôn luôn kết hợp với nước uống sạch sẽ đảm bảo mèo đủ uống cả ngày nhé!</p><p>Chia nhỏ bữa ăn theo từng độ tuổi phát triển.&nbsp;</p><ul><li>2 – 3 tháng tuổi, cho chúng ăn 4 – 5 bữa nhỏ/ ngày, nên ăn cháo thịt xay nhuyễn.</li><li>3 – 5 tháng tuổi: tăng lượng thức ăn mỗi bữa, nhưng giảm thành 3 bữa mỗi ngày.</li><li>Giai đoạn trưởng thành thì Aln chỉ cần ăn 2 bữa lớn là đủ.</li></ul><p>Chớ nên cho <strong>mèo Anh lông ngắn</strong> ăn quá nhiều tinh bột, những đồ ăn chứa nhiều chất béo, đồ dầu mỡ, chocolate bởi chúng sẽ không hấp thụ được hết, dễ béo phì bởi ít vận động.</p>', NULL, CAST(N'2020-11-26 15:34:42.000' AS DateTime), CAST(N'2020-12-11 19:43:40.770' AS DateTime), 3, 2, 3, 6, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (16, N'Bonsai Nhà Dưỡng', N'unnamed (1).jpg', CAST(N'2020-12-11 19:52:52.710' AS DateTime), 1, 2900000.0000, NULL, NULL, 1, 0, NULL, N'<p>Vui lòng liên hệ trước khi đặt hàng.</p>', N'<h2>Giới thiệu sản phẩm Chậu cây bonsai handmade -CR11</h2><p>Hoa giấy cao cấp Carrot được làm bằng tay với kỹ thuật tinh xảo, chất liệu giấy cao cấp, màu sắc sống động và đẹp mắt, sản phẩm chắc chắn sẽ làm bạn hài lòng. Hãy thể hiện gu thẩm mỹ tinh tế của mình trong việc trang trí nội thất với sản phẩm hoa giấy Carrot.<br>Màu sắc trang nhã của hoa cùng sự phối hợp hài hoà với màu sắ́c của cành và lá sẽ mang đến sức sống mới cũng như tạo nên sự sinh động một cách tự nhiên cho không gian sống của bạn.<br>Những cành hoa nhỏ tươi tắn sẽ giúp bạn dễ dàng kết hợp cùng nhau để tạo nên những lọ hoa xinh xắn, mang đến một góc nhỏ lãng mạn, tươi mới cho không gian nhà ở, văn phòng hoặc hành lang của bạn. Sản phẩm cũng là món quà mang đậm giá trị nghệ thuật dành cho bạn bè, người thân vào các dịp đặc biệt.</p>', NULL, CAST(N'2020-12-11 19:12:47.000' AS DateTime), CAST(N'2020-12-11 19:52:52.710' AS DateTime), 3, 16, 10, 8, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (20, N'Lenovo Tab E10 TB-X104L', N'lenovo-tab-e10-tb-x104l-den-1-1-org.jpg', CAST(N'2020-12-14 10:07:30.003' AS DateTime), 1, 2990000.0000, NULL, NULL, 9, 0, NULL, N'<p>Cần bán gấp máy tính bảng Lenovo.</p>', N'<h3><a href="https://www.dienmayxanh.com/may-tinh-bang/lenovo-tab-e10-tb-x104l-den">Lenovo Tab E10 TB-X104L</a> là chiếc <a href="https://www.dienmayxanh.com/may-tinh-bang">máy tính bảng</a> có nhiều ưu điểm để người dùng dễ lựa chọn: Mức giá dễ chịu, màn hình lớn tiện cho việc giải trí, hỗ trợ cả mạng 4G,..</h3><h3><a href="https://www.dienmayxanh.com/kinh-nghiem-hay/man-hinh-ips-la-gi-593859">Màn hình IPS LCD</a> có kích thước lớn</h3><p>Chiếc <a href="https://www.dienmayxanh.com/may-tinh-bang-lenovo">tablet Lenovo</a> này có kích thước màn hình lên đến 10.1 inch, cùng với tấm nền IPS LCD có ưu điểm là cho góc nhìn rộng và tái tạo màu sắc tốt.</p><figure class="image"><img src="https://cdn.tgdd.vn/Products/Images/522/200691/lenovo-tab-e10-tb-x104l-den9.jpg" alt="Máy tính bảng Lenovo Tab E10 TB-X104L - Trên tay trải nghiệm"></figure><p>Việc xem phim hay chơi 1 số game nhẹ trên máy sẽ cho cảm giác "đã mắt" và rộng hơn, hạn chế được phần nào tình trạng mỏi mắt.</p><figure class="image"><img src="https://cdn.tgdd.vn/Products/Images/522/200691/lenovo-tab-e10-tb-x104l-den3.jpg" alt="Máy tính bảng Lenovo Tab E10 TB-X104L - Thiết kế màn hình"></figure><p>Máy phù hợp với những người dùng có nhu cầu xem phim nhiều, hay dành cho các bậc phụ huynh cho trẻ sử dụng.</p><h3>Hỗ trợ kết nối <a href="https://www.dienmayxanh.com/kinh-nghiem-hay/mang-4g-la-gi-824397">mạng 4G</a></h3><p>Ở Việt Nam hiện nay mạng 4G đã phủ sóng rộng khắp và được hầu hết các nhà mạng áp dụng.</p><p>Máy tính bảng&nbsp;Lenovo Tab E10 cũng cập nhật nhanh xu hướng này, máy hỗ trợ 4G cho phép người dùng được truy cập mạng với tốc độ nhanh chóng hơn.</p><figure class="image"><img src="https://cdn.tgdd.vn/Products/Images/522/200691/lenovo-tab-e10-tb-x104l-den8.jpg" alt="Máy tính bảng Lenovo Tab E10 TB-X104L - Hỗ trợ 2 sim"></figure><h3>Trang bị âm thanh <a href="https://www.dienmayxanh.com/kinh-nghiem-hay/cong-nghe-am-thanh-dolby-la-gi-827752">Dolby Atmos</a></h3><p>Lenovo Tab E10 là chiếc tablet hiếm hoi được ưu ái trang bị công nghệ âm thanh Dolby.</p><figure class="image"><img src="https://cdn.tgdd.vn/Products/Images/522/200691/lenovo-tab-e10-tb-x104l-den7.jpg" alt="Máy tính bảng Lenovo Tab E10 TB-X104L - Cụm loa trên máy"></figure><p>Dolby có thể được hiểu ngắn gọn là công nghệ âm thanh vòm, mang đến chất lượng âm thanh sống động và lôi cuốn hơn.</p><figure class="image"><img src="https://cdn.tgdd.vn/Products/Images/522/200691/lenovo-tab-e10-tb-x104l-den11.jpg" alt="Máy tính bảng Lenovo Tab E10 TB-X104L - Trải nghiệm và đánh giá"></figure><p>Chiếc máy tính bảng Lenovo Tab E10 chắc chắn sẽ làm hài lòng người dùng thích xem phim hay nghe nhạc.</p><h3>Có hỗ trợ camera trước và sau</h3><p>Camera trên máy tính bảng không phải là ưu điểm lớn được nhiều người dùng quan trọng.</p><p>Tuy nhiên trong 1 số trường hợp cần thiết, cụm camera trên máy sẽ là giải pháp giúp bạn ghi lại khoảnh khắc hay những hình ảnh cần lưu lại đột xuất.</p><figure class="image"><img src="https://cdn.tgdd.vn/Products/Images/522/200691/lenovo-tab-e10-tb-x104l-den10.jpg" alt="Máy tính bảng Lenovo Tab E10 TB-X104L - Giao diện camera"></figure><p>Độ nét hay tốc độ chụp của Lenovo Tab E10 không thể sánh bằng <a href="https://www.dienmayxanh.com/dien-thoai">điện thoại</a>, nhưng chất lượng hình khá ổn và đủ nhìn được các chi tiết.</p>', NULL, CAST(N'2020-12-14 10:07:30.003' AS DateTime), CAST(N'2020-12-14 10:07:30.003' AS DateTime), 3, 1, 2, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (22, N'Mèo Ba Tư', N'meo-ba-tu-5.jpg', CAST(N'2020-12-14 10:22:54.650' AS DateTime), 1, 6900000.0000, NULL, NULL, 0, 0, NULL, N'<h2><strong>Mèo Ba Tư</strong></h2><p>Mèo Ba Tư (còn gọi là mèo Persian) là một giống mèo cảnh có nguồn gốc từ <a href="https://vi.wikipedia.org/wiki/Iran">Ba Tư</a>. Chúng hiện được rất nhiều người yêu thích và săn lùng. Cùng tìm hiểu về loài mèo thú vị này trong bài viết dưới đây.</p><figure class="image"><img src="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5.jpg" alt="mèo ba tư" srcset="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5.jpg 800w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5-300x200.jpg 300w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5-768x513.jpg 768w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5-650x434.jpg 650w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5-272x182.jpg 272w" sizes="100vw" width="800"></figure><h2><strong>Lý Do Bạn Nên Nuôi Mèo Ba Tư</strong></h2><p><strong>Bộ lông quyến rũ</strong></p><p>Mèo Ba Tư có thể “hớp hồn” bất cứ người yêu mèo nào bởi bộ lông “quý tộc” thu hút của mình. Giống mèo này có&nbsp;2 lớp lông dày mềm mại và đặc biệt cần được chăm sóc tỉ mỉ mỗi ngày.</p><figure class="image"><img src="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-2-2.jpg" alt="mèo ba tư" srcset="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-2-2.jpg 800w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-2-2-300x213.jpg 300w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-2-2-768x546.jpg 768w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-2-2-650x462.jpg 650w" sizes="100vw" width="800"></figure><p><strong>Ngoan ngoãn, ôn hòa</strong></p><p>Bản tính của mèo 34 rất ôn hòa và thân thiện. Chúng thông minh, vui vẻ và vô cùng trung thành với chủ. Giống mèo này luôn biết cách thể hiện tình cảm một cách nhẹ nhàng, thích được chủ âu yếm, vuốt ve.</p><figure class="image"><img src="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-3-1.jpg" alt="mèo ba tư" srcset="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-3-1.jpg 800w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-3-1-300x200.jpg 300w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-3-1-768x513.jpg 768w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-3-1-650x434.jpg 650w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-3-1-272x182.jpg 272w" sizes="100vw" width="800"></figure><p><strong>Thích nghi tốt</strong></p><p>Tính cách dễ chịu của mèo 34 khiến cho chúng có thể dễ dàng hòa hợp với gia đình bạn ở bất cứ độ tuổi nào. Loài mèo này quá tuyệt vời để nuôi giữ trong nhà và chúng có thể thích nghi tốt ở bất cứ điều kiện nào.</p><figure class="image"><img src="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-4-1.jpg" alt="mèo ba tư" srcset="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-4-1.jpg 800w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-4-1-300x200.jpg 300w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-4-1-768x513.jpg 768w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-4-1-650x434.jpg 650w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-4-1-272x182.jpg 272w" sizes="100vw" width="800"></figure><p>Đây là giống mèo có các nhu cầu tương đối đơn giản và phù hợp với cuộc sống của nhiều gia đình. – Ảnh: Internet</p><h2><strong>Đặc Điểm Mèo Ba Tư</strong></h2><p>Mèo Ba Tư có kích cỡ trung bình, cơ thể săn chắc và đầy đặn. Chúng sở hữu đôi tai nhỏ, 2 mắt to và đặc biệt là chiếc mũi tẹt, đó là lý do chúng được mệnh danh là mèo mặt tịt. Đây cũng là điểm độc đáo riêng của giống mèo này.</p><figure class="image"><img src="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5-1.jpg" alt="mèo ba tư" srcset="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5-1.jpg 800w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5-1-300x200.jpg 300w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5-1-768x513.jpg 768w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5-1-650x434.jpg 650w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-5-1-272x182.jpg 272w" sizes="100vw" width="800"></figure><p>Ba Tư là giống mèo có chiếc mũi tẹt đặc biệt dễ thương. – Ảnh: Internet</p><p>Mèo 34 có rất nhiều màu lông khác nhau: Màu kem, màu cafe sữa, màu trắng, màu xám xanh, màu đỏ, màu nâu, vằn vện… Hiện nay, loài mèo này được lai tạo với nhiều giống mèo khác nhau, điều này khiến chúng có thêm giống Ba Tư lông ngắn, tiện cho việc chăm sóc và chải chuốt hàng ngày.</p><figure class="image"><img src="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-6.jpg" alt="mèo ba tư" srcset="https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-6.jpg 800w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-6-300x200.jpg 300w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-6-768x513.jpg 768w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-6-650x434.jpg 650w, https://azpet.com.vn/wp-content/uploads/2019/01/meo-ba-tu-6-272x182.jpg 272w" sizes="100vw" width="800"></figure>', N'<h2><strong>BẢNG GIÁ MÈO BA TƯ</strong></h2><p>(Bảng giá tham khảo, mức giá chính xác có thể thay đổi theo từng bé, mức độ xuất sắc, gia phả xuất xứ mèo bố mẹ, giấy tờ đi kèm…)</p><figure class="table"><table><tbody><tr><td colspan="3"><strong>Sinh Sản Tại Trại Nhân Giống AZPET</strong></td></tr><tr><td><strong>Màu Sắc</strong></td><td><strong>PK Phổ Thông</strong></td><td><strong>Phân Khúc Cao</strong></td></tr><tr><td>1 Màu</td><td>6.900.000 đ</td><td>10.900.000 đ</td></tr><tr><td>Bicolor</td><td>6.900.000 đ</td><td>10.900.000 đ</td></tr><tr><td>Tricolor</td><td>6.900.000 đ</td><td>10.900.000 đ</td></tr></tbody></table></figure><p><strong>ƯU ĐÃI ĐẶC BIỆT</strong></p><p><strong>Tặng gói dịch vụ Spa, chăm sóc trọn gói + Bộ phụ kiện khi mua mèo 34, bao gồm:</strong></p><p>– Bát ăn + Bình nước tự động.</p><p>– Xẻng xúc cát vệ sinh.</p><p>– Kìm cắt móng.</p><p>– Cần câu mèo.</p><p>– Vòng cổ chuông.</p><p>– Lược chải lông.</p>', NULL, CAST(N'2020-12-14 10:22:54.650' AS DateTime), CAST(N'2020-12-14 10:22:54.650' AS DateTime), 10, 2, 3, 6, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (23, N'Mèo Ba Tư', N'meo-ba-tu.jpg', CAST(N'2020-12-14 10:28:49.627' AS DateTime), 1, 15000000.0000, NULL, NULL, 2, 0, NULL, N'<p>Giống mắt tịt</p><h3><strong>Về thức ăn</strong></h3><p>Chế độ ăn của mèo Ba Tư cần có nhiều thịt, nhất là thịt bò, thịt gà và cá. Hạn chế cho mèo ăn thịt lợn vì có nhiều mỡ nhưng phần nội tạng lợn (gan, tim, óc, bầu dục) rất tốt cho mèo Ba Tư.</p><p>Không cho mèo Ba Tư ăn đồ sống. Thực đơn của mèo cũng cần có thêm cơm hoặc cháo, các loại rau củ quả để bổ sung vitamin, tăng sức đề kháng.</p><h3><strong>Cách vệ sinh cơ thể</strong></h3><ul><li>Chải chuốt lông thường xuyên, loại bỏ lông chết và cắt ngắn lông khi dài quá.</li><li>Những vùng nhạy cảm như: Mắt, mũi, tai, miệng, răng… cần được vệ sinh sạch sẽ thường xuyên.</li></ul><figure class="image"><img src="https://zoipet.com/wp-content/uploads/2020/03/cham-soc-meo-ba-tu.jpg" alt="chăm sóc mèo ba tư"></figure><p><i>Chải lông cho mèo Ba Tư thường xuyên để loại bỏ lông chết&nbsp; (Ảnh: Internet)</i></p><h3><strong>Bệnh vặt</strong></h3><p>Mèo Ba Tư có mũi ngắn và nhỏ nên dễ bị mắc các bệnh về đường hô hấp, tim, mắt và bệnh loạn sản xương hông. Vì vậy, người nuôi cần theo dõi sức khỏe của mèo để phát hiện và chữa trị kịp thời.</p>', N'<p>Giá của mèo Ba Tư còn tùy thuộc vào từng loại và sẽ có sự chênh lệch. Dưới đây là giá tham khảo:</p><ul><li>Mèo Ba Tư mặt tịt: 3 – 8 triệu/con không giấy tờ, từ 8 – 15 triệu/con có giấy tờ đầy đủ.</li><li>Mèo Ba Tư Himalayan: Từ 6 – 9 triệu/con.</li><li>Mèo Ba Tư Chinchilla: Trên 6 triệu/con (không có giấy).</li><li>Mèo Ba Tư Exotic: Từ 4 – 9 triệu/con (không giấy) và từ 10 – 20 triệu (sinh tại Việt Nam và có giấy). Riêng mèo nhập từ Thái sẽ có giá hơn $1000, nhập từ Châu Âu, Nga thì giá trên $3000.</li></ul><figure class="image"><img src="https://zoipet.com/wp-content/uploads/2020/03/meo-ba-tu-exotic.jpg" alt="Mèo Ba Tư Exotic"></figure>', NULL, CAST(N'2020-12-14 10:28:49.627' AS DateTime), CAST(N'2020-12-14 10:28:49.627' AS DateTime), 10, 2, 3, 6, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (24, N'Mèo Lông Dài', N'maxresdefault-768x513.jpg', CAST(N'2020-12-14 10:49:45.653' AS DateTime), 1, 2000000.0000, NULL, NULL, 3, 0, NULL, N'<h2>NGUỒN GỐC CỦA MÈO ANH LÔNG DÀI</h2><p>Mèo Anh lông dài có nguồn gốc từ nước Anh và xuất hiện khá muộn nếu so với những giống mèo khác trên thế giới. Chúng xuất hiện vào khoảng giữa thế kỷ 20, do sự lai tạo của giống mèo Anh lông ngắn bản địa và mèo Ba Tư. Sự xuất hiện của chúng đã góp phần dẫn tới sự suy giảm nghiêm trọng về số lượng của mèo Anh lông ngắn, nhất là sau chiến tranh thế giới thứ hai.&nbsp;Giống mèo thủy tổ này sau nhiều đời lai với những giống mèo lông dài ngoại nhập khác đã hấp thu nhiều yếu tố di truyền của các nòi mèo lông dài ở Ba Tư và hình thành kiểu hình với bộ lông dài và dày đặc trưng – thậm chí còn dày hơn cả những con mèo Ba Tư nguyên thủy.&nbsp;Ở đây mèo lông dài Anh và mèo Ba Tư có một mối quan hệ hơi rắc rối: trong thế kỷ 19 và đầu thế kỷ 20, mèo Ba Tư được coi như là những cá thể lông dài của mèo lông ngắn Anh; mãi đến nửa cuối thế kỷ 20 khi nòi mèo Ba Tư xuất hiện kiểu hình lông ngắn thì sự đánh đồng này mới chấm dứt. Từ đó, phiên bản mèo lông dài Ba Tư được đặt tên là mèo lông dài ngoại nhập và cái tên “mèo lông dài Anh” được trả về đúng chỗ của nó. Nói tóm lại, mèo lông dài Anh là phiên bản lông dài của mèo lông ngắn Anh. Giống như đồng hương lông ngắn, mèo lông dài Anh có đầu vuông và rộng. Mặc dù được công nhận ở một số nước khác nhưng mèo lông dài Anh không được công nhận rộng rãi ngay tại quê hương của nó.</p><p>Mọi chi tiết vui lòng liên hệ số điện thoại ngay bên dưới!!</p>', N'<h2>ĐẶC ĐIỂM MÈO ANH LÔNG DÀI</h2><h3>ĐẶC ĐIỂM NGOẠI HÌNH</h3><p>Mèo lông dài Anh có bộ lông óng ánh và thân hình chắc nịch. Đầu của chúng tròn với mắt sáng, hình tròn và tai ngắn. Chân của chúng ngắn nhưng khỏe. Đuôi cũng có lông dài và dày. Mèo lông dài Anh có bộ ngực sâu, gây cảm tưởng rằng chúng kích thước trung bình và chắc nịch. Mèo lông dài Anh có thể có nhiều màu lông khác nhau như đồng hương lông ngắn, tỉ như đen, trắng, đỏ, kem, xanh, nâu sôcôla, tím hoa cà, nâu vàng của quế hay nâu vàng của hươu nai. Sắc điệu của màu lông có thể là một màu, hai màu, mèo khoang, ba màu, smoke, tipped, and colourpointed.</p><p>Mèo Anh lông dài có bộ lông rất dài, rậm rạp giúp chúng giữ ấm tốt ở những nới khí hậu lạnh, trong khi mèo Anh lông ngắn thì ngược lại. Mèo Anh lông dài có khá nhiều màu sắc đa dạng như nâu vàng, đen, trắng, nâu socola, tím hoa cà, tuy nhiên phổ biến nhất vẫn là màu xám xanh.</p><figure class="image"><img src="https://xommeo.com/wp-content/uploads/2018/06/British-Longhair-cat-breed_022-300x199.jpg" alt="một chú mèo anh lông dài trưởng thành" srcset="https://xommeo.com/wp-content/uploads/2018/06/British-Longhair-cat-breed_022-300x199.jpg 300w, https://xommeo.com/wp-content/uploads/2018/06/British-Longhair-cat-breed_022.jpg 600w" sizes="100vw" width="635"></figure><p>một chú mèo anh lông dài trưởng thành</p><h3>ĐẶC ĐIỂM TÍNH CÁCH</h3><p>Mèo lông dài Anh có tính tình khá ôn hòa và dễ bảo. Chúng thích đùa giỡn và khá hiếu động, nhất là&nbsp;khi còn nhỏ. Chúng có thể nhanh chóng quấn quýt với chủ của mình. Mèo lông dài Anh tỏ ra là vật nuôi thích hợp đối với những người công chức hay lao động phải làm việc cả ngày ở cơ quan vì tính khí hiền lành, ít quậy phá, không nhất thiết phải có “bạn” và có thể ở yên ổn một mình trong nhiều giờ. Một số cá thể mèo lại thích sống chung với một người bạn lông dài có tính cách tương đồng với mình</p><h3><strong>MÈO ANH LÔNG DÀI NẶNG BAO NHIÊU KG</strong></h3><p>Mèo anh lông dài là một trong những giống mèo khá nặng ký, một chú mèo anh lông dài cái có thể nặng từ 4 – 6kg, trong khi đó con đực có thể nặng tới 8kg. Những chú mèo anh lông dài, lông ngắn con khi ra đời cũng có thể nặng tới gần 1kg, vì vậy bạn đừng ngạc nhiên khi thấy chúng to như vậy nhé.</p><figure class="image"><img src="https://xommeo.com/wp-content/uploads/2018/06/British-Shorthair-vs-British-Longhair-300x170.jpg" alt="cân nặng và tuổi thọ của mèo anh lông dài" srcset="https://xommeo.com/wp-content/uploads/2018/06/British-Shorthair-vs-British-Longhair-300x170.jpg 300w, https://xommeo.com/wp-content/uploads/2018/06/British-Shorthair-vs-British-Longhair.jpg 670w" sizes="100vw" width="621"></figure><p>cân nặng và tuổi thọ của mèo anh lông dài</p><h3><strong>TUỔI THỌ CỦA MÈO ANH LÔNG DÀI</strong></h3><p>Mèo anh lông dài là một trong những giống mèo có tuổi thọ khá dài, chúng có thể sống từ 14 – 20 năm tùy thuộc vào điều kiện sinh sống. Theo dữ liệu từ các phòng khám thú y đất nước sở tại (Anh) thì tuổi thọ trung bình của mèo aln là 11,8 năm, tại Thụy Điển là 12.5 năm, tại Việt Nam tuy chưa có thống kê nhưng do khí hậu khá khác biệt với quê hương của chúng nên các “sen” cần chú ý chăm sóc tốt hơn.</p><h3><strong>MÈO ANH LÔNG DÀI CÓ NHỮNG MÀU GÌ?</strong></h3><p><strong>Mèo anh lông dài ngày nay có rất nhiều màu khác nhau</strong>&nbsp;như&nbsp;kem, đỏ, trắng, đen, sô cô la, xanh dương, màu nâu vàng, quế, tabby,&nbsp; bicolour, tipped, smoke, tortoiseshell,…. nhưng đặc trưng nhất vẫn là màu xám xanh. Thế nhưng theo xu hướng khi nuôi một chú mèo anh lông dài, người ta thường chọn màu trắng hoặc các màu sáng chứ không chọn màu xám xanh truyền thống.</p>', NULL, CAST(N'2020-12-14 10:44:31.000' AS DateTime), CAST(N'2020-12-14 10:49:45.653' AS DateTime), 12, 2, 3, 6, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (25, N'Đàn Guitar Thùng', N'd9fee4980e28ad3f8eed74398d1135df-2697636190435820559.jpg', CAST(N'2020-12-14 10:48:44.040' AS DateTime), 1, 2500000.0000, NULL, NULL, 0, 0, NULL, N'<p>Bán nhanh cây đàn guitar thùng fender mới 100% tiếng hay có sẵn eq cắm Âm thanh ra loa. Đàn tiếng hay, thùng gỗ xịn, mua có tặng bao dạ và phụ kiện kèm theo đầy đủ</p>', N'<p>Có thể hoàn trả hàng nếu sản phẩm bị lỗi hoặc không giống như hình.</p><figure class="image"><img src="https://tongkhonhaccu.com/Data/upload/images/Tintuc/KienThuc/cac-bo-phan-cay-dan-guitar.jpg" alt="Bộ phận đàn guitar giá rẻ, chính hãng"></figure><h3><strong>. Thân đàn (Body):&nbsp;</strong></h3><figure class="image"><img src="https://tongkhonhaccu.com/Data/upload/images/Tintuc/KienThuc/thung-dan-guitar-acoustic.jpg" alt="Thùng đàn guitar acoustic"></figure><p>Thân đàn là phần lớn nhất trong các bộ phận của một <a href="https://tongkhonhaccu.com/guitar.html"><strong>cây&nbsp;đàn Guitar</strong></a>,<strong>&nbsp;</strong>có tác dụng cộng hưởng và khuếch đại âm thanh. Khi ta gảy dây đàn tức là làm cho dây đàn rung, thùng đàn sẽ cộng hưởng với tần số rung của dây đàn, làm cho lớp không khí xung quanh mặt thùng&nbsp;đàn guitar&nbsp;dao động với cùng tần số và tai ta nghe được âm thanh. Tùy theo tần số dao động của dây đàn mà tai ta sẽ&nbsp;nghe được các âm thanh trầm bổng khác nhau.</p><h3><strong>2. Cần đàn (Neck):</strong></h3><p>Cần&nbsp;<strong>đàn Guitar</strong>&nbsp;bằng gỗ thuôn dài nối đến đầu đàn. Mỗi dây đàn sẽ chạy dọc trên cần đàn. Và tùy thuộc vào nơi ngón tay của bạn được đặt trên cần đàn, bạn sẽ tạo ra những âm thanh khác nhau. Mặt của cần đàn là nơi đặt các phím đàn.</p><h3><strong>3. Đầu đàn (Headstock):</strong></h3><figure class="image"><img src="https://tongkhonhaccu.com/Data/upload/images/Tintuc/KienThuc/Chot-khoa-dan-guitar.jpg" alt="Đầu đàn guitar acoustic"></figure><p>Kết thúc cần đàn chính là đầu đàn,&nbsp;là bộ phận để gắn bộ khóa đàn&nbsp;dùng để chỉnh dây, thay đổi cao độ của cây đàn. Hình dạng của đầu đàn xác định cách bố trí của các bộ chỉnh dây. Một số Guitar có sáu bộ chỉnh dây&nbsp;trên một mặt và một số khác có thể có 3 bộ chỉnh dây&nbsp;mỗi bên. Hình dạng của đầu đàn có thể ảnh hưởng đến những giai điệu của cây đàn Guitar do&nbsp;cách nó dao động.</p><h3><strong>4. Ty chỉnh cần (Truss Rod):</strong></h3><figure class="image"><img src="https://tongkhonhaccu.com/Data/upload/images/Tintuc/KienThuc/Truss-Rod-Guitar.jpg" alt="Ty chỉnh cần đàn guitar"></figure><p>Là một&nbsp;thanh thép lục lăng được đặt nằm giữa cần đàn (neck) &amp; mặt phím (fretboard), có công&nbsp;dụng chỉnh cần đàn guitar bằng cách vặn chặt hoặc thả lỏng làm cho&nbsp;cần đàn ưỡn lên hoặc võng xuống. Ngoài ra, nó cũng tăng cường độ cứng cho cần đàn, giúp cây đàn guitar tránh được vấn đề cong cần.</p><h3><strong>5. Dây đàn (Strings):</strong></h3><p>Một cây đàn Guitar thường có sáu dây,&nbsp;dây của các loại Guitar khác nhau (Guitar Acoustic, Classic, Điện...)&nbsp;sẽ khác nhau và sự khác nhau này tạo sự khác biệt lớn trong âm thanh.</p><h3><strong>6. Phím đàn (Frets):</strong></h3><p>Phím đàn là các thanh kim loại để chia mặt phím thành các ngăn phím, mỗi một ngăn phím là một nốt nhạc.</p><h3><strong>7. Chốt, khóa đàn&nbsp;(Pegs/ Tuners):</strong></h3><p>Bộ phận này là chốt điều chỉnh sức căng của các dây đàn, phụ thuộc vào cao độ cao hay thấp mà bạn xoay theo chiều kim đồng hồ hoặc ngược chiều kim đồng hồ.</p><h3><strong>8. Lược đàn (Nut):</strong></h3><figure class="image"><img src="https://tongkhonhaccu.com/Data/upload/images/Tintuc/KienThuc/nut-luoc-dan-guitar.jpg" alt="Lược đàn guitar"></figure><p>Lược đàn thường được làm từ xương động vật&nbsp;hoặc nhựa tổng hợp&nbsp;(đôi khi có thể là đồng hoặc thép) là bộ phần nằm giữa đầu đàn và cần đàn. Tuy bé nhưng lược đàn lại giữ một vai trò quan trọng đó là “chia dây”, giúp cho dây đàn có 1 khoảng cách nhất định so với phím đàn, để các dây khi rung động không bị chạm vào phím gây rè (buzz) tiếng.</p><h3><strong>9. Mặt phím (Fingerboard):</strong></h3><p>Mặt phím là một miếng gỗ dài được gắn với cần đàn, là nơi các ngón tay trái thao tác trên đó.</p><h3><strong>10. Ngựa, xương&nbsp;đàn và Pin&nbsp;(Bridge, Saddle &amp; Pin):</strong></h3><figure class="image"><img src="https://tongkhonhaccu.com/Data/upload/images/Tintuc/KienThuc/bridge-guitar.jpg" alt="Ngựa, xương đàn"></figure><p><strong>Ngựa đàn</strong> là một miếng gỗ mỏng được đặt ở trên mặt đàn, là nơi giữ dây đàn vững chắc trên thùng đàn để chúng không bị thay đổi cao độ. Khi gảy dây đàn, rung động chạy dọc theo cần đàn từ ngựa đàn đến đầu đàn.&nbsp;</p><p><strong>Xương đàn</strong> thường được làm từ nhựa hoặc xương, cùng với lược đàn giúp cho dây đàn có khoảng cách so với mặt phím.</p><p><strong>Pin đàn&nbsp;</strong>là các chốt&nbsp;để giữ dây đàn với ngựa đàn.</p><h3><strong>11. Miếng bảo vệ mặt đàn (Pickguard):</strong></h3><figure class="image"><img src="https://tongkhonhaccu.com/Data/upload/images/Tintuc/KienThuc/pick-guard-guitar.jpg" alt="Miếng bảo vệ đàn guitar"></figure><p>Miếng bảo vệ đàn là một&nbsp;bộ phận nhỏ được dán ngay bên dưới lỗ thoát âm. Khi bạn accord (quạt chả), hoặc sử dụng các kỹ thuật ngón&nbsp;(fingerstyle) sẽ chạm gây xước và&nbsp;hỏng mặt đàn. Miếng dán sẽ có công dụng giúp bảo vệ mặt đàn.&nbsp;</p>', NULL, CAST(N'2020-12-14 10:48:44.040' AS DateTime), CAST(N'2020-12-14 10:48:44.040' AS DateTime), 12, 15, 4, 5, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (26, N'Mèo Đen', N'dan-wayman-Paw3cZH_YCY-unsplash.jpg', CAST(N'2020-12-14 11:17:41.107' AS DateTime), 1, 3000000.0000, NULL, NULL, 0, 0, NULL, N'<p>Hiện tại trại còn 3 bé mèo ba tư đen. Vui lòng liên hệ thông qua số điện thoại để giải đáp mọi thắc mắc.</p>', N'<h2><strong>BẢNG GIÁ MÈO BA TƯ</strong></h2><p>(Bảng giá tham khảo, mức giá chính xác có thể thay đổi theo từng bé, mức độ xuất sắc, gia phả xuất xứ mèo bố mẹ, giấy tờ đi kèm…)</p><figure class="table"><table><tbody><tr><td colspan="3"><strong>Sinh Sản Tại Trại Nhân Giống AZPET</strong></td></tr><tr><td><strong>Màu Sắc</strong></td><td><strong>PK Phổ Thông</strong></td><td><strong>Phân Khúc Cao</strong></td></tr><tr><td>1 Màu</td><td>6.900.000 đ</td><td>10.900.000 đ</td></tr><tr><td>Bicolor</td><td>6.900.000 đ</td><td>10.900.000 đ</td></tr><tr><td>Tricolor</td><td>6.900.000 đ</td><td>10.900.000 đ</td></tr></tbody></table></figure><p><strong>ƯU ĐÃI ĐẶC BIỆT</strong></p><p><strong>Tặng gói dịch vụ Spa, chăm sóc trọn gói + Bộ phụ kiện khi mua mèo 34, bao gồm:</strong></p><p>– Bát ăn + Bình nước tự động.</p><p>– Xẻng xúc cát vệ sinh.</p><p>– Kìm cắt móng.</p><p>– Cần câu mèo.</p><p>– Vòng cổ chuông.</p><p>– Lược chải lông.</p>', NULL, CAST(N'2020-12-14 11:14:03.000' AS DateTime), CAST(N'2020-12-14 11:17:41.107' AS DateTime), 13, 2, 3, 10, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (27, N'Chó Goldden Vàng', N'G4Oy2Fd8s-cho-golden-retriever-12.jpg', CAST(N'2020-12-14 11:17:19.020' AS DateTime), 1, 15000000.0000, NULL, NULL, 2, 0, NULL, N'<p>Thông tin</p><p><i>&nbsp;Du nhập vào Việt Nam khoảng 10 năm trở lại đây, giống chó Golden Retriever nhanh chóng trở thành một trong những giống chó phổ biến nhất. &nbsp;</i></p><p><i>Dogily là nhà nhân giống và mua bán chó Golden Retriever chuyên nghiệp và uy tín. Là thành viên chính thức của Hiệp hội những người nuôi chó giống tại Việt Nam (VKA).</i></p><p><i>Tham khảo thêm thông tin về giá và các đàn chó Golden Retriever đang bán của Dogily Petshop&nbsp;hoặc sốđiện thoại 0326323495</i></p><p>Mua chó Golden tại Dogily Petshop có hợp đồng rõ ràng. Bảo hành dài hạn. Được bác sỹ thú y của phòng khám Dogily Petshop khám tận nhà.</p><p><i>Bạn có thể mua chó Golden Retriever con giá rẻ online, hoặc tại hệ thống Dogily Petshop tại Hà Nội và Tphcm.</i></p><p><i>Bạn cần lựa chọn mua chó Golden Retriever con từ một người bán có uy tín.</i></p><p>Giống chó Golden Retriever với vẻ ngoài cực dễ thương, giá cả hợp lý, dễ bán. Vì vậy, chúng được nhân giống khá nhiều tại Hà Nội và Tphcm.</p><p>Tuổi thọ và sức khỏe của giống chó Golden từ 10 đến 12 năm Giá bán chó Golden Retriever hiện nay</p><p>Thường những chú chó Golden Retriever sinh ra tại Việt Nam sẽ có giá bán từ 7-9 triệu đồng/bé không giấy tờ. Chó Golden Retriever có giấy VKA hiện kháít, giá dao động từ 12-19 triệu đồng/bé.</p><p>Nếu muốn mua chó Golden Retriever nhập khẩu Thái Lan. Bạn sẽ phải bỏ ra từ 15-25 triệu đồng/bé.</p><p>Giá bán chó Golden Retriever nhập khẩu châu Âu (chủ yếu từ Nga, Ba Lan, Ucraina và một số nước Liên Xô cũ khác như Belarus, Latvia…) dao động từ 1.200-2.000 usd/bé (chưa bao gồm chi phí vận chuyển về Việt Nam). Chó cóđầy đủ giấy tờ như giấy khai sinh, giấy chứng nhận xuất khẩu của&nbsp;<a href="https://enbac.com/enbac_redirect.html?to=aHR0cDovL3d3dy5mY2kuYmUvZW4vbm9tZW5jbGF0dXJlL0dPTERFTi1SRVRSSUVWRVItMTExLmh0bWw=">FCI (Tổ chức chó giống quốc tế)</a>.</p><p>&nbsp;</p><p><i>Giá bán chó Golden Retriever nhập khẩu châu Âu (Nga, Ucraina, Ba Lan…) khoảng từ 2.000 – 2.500 usd/con.</i></p><p><i>Mua chó Golden tại Dogily Petshop</i></p>', N'<p>Bé được 3 tháng tuổi biết đi về sinh đúng chỗ. Mọi thông tin chi tiết vui lòng liên hệ.</p>', NULL, CAST(N'2020-12-14 11:17:19.020' AS DateTime), CAST(N'2020-12-14 11:17:19.020' AS DateTime), 13, 14, 3, 11, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (1, N'Quận 1', 2)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (2, N'Quận 2', 2)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (3, N'Quận 3', 2)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (4, N'Quận 4', 1)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (5, N'Quận 5', 2)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (6, N'Quận 6', 2)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (7, N'Quận 7', 2)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (8, N'Quận 8', 2)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (9, N'Bến Cát', 3)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (10, N'TP. Thủ Dầu Một', 3)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (11, N'Bàu Bàng', 3)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (12, N'Bắc Tân Uyên', 3)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (13, N'Dầu Tiếng', 3)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (14, N'Dĩ An', 3)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (15, N'Phú Giáo', 3)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (16, N'Tân Uyên', 3)
INSERT [dbo].[Province] ([Province_ID], [Province_Name], [City_ID]) VALUES (17, N'Thuận An', 3)
SET IDENTITY_INSERT [dbo].[Province] OFF
SET IDENTITY_INSERT [dbo].[RepLi] ON 

INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (1, CAST(N'2020-11-18 00:00:00.000' AS DateTime), N'alo', 1, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (2, CAST(N'2020-11-18 00:00:00.000' AS DateTime), N'alo', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (3, CAST(N'2020-11-18 00:00:00.000' AS DateTime), N'alo', 1, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (4, CAST(N'2020-11-18 00:00:00.000' AS DateTime), N'alo', 1, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (5, CAST(N'2020-11-18 12:47:47.530' AS DateTime), N'dâdadadad', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (6, CAST(N'2020-11-18 12:55:53.747' AS DateTime), N'âdadadadada', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (7, CAST(N'2020-11-18 12:57:33.460' AS DateTime), N'adadadada', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (8, CAST(N'2020-11-18 13:01:02.757' AS DateTime), N'test', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (9, CAST(N'2020-11-18 13:13:07.087' AS DateTime), N'ưdadadadadaadad', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (10, CAST(N'2020-11-18 13:23:34.927' AS DateTime), N'sadadadaaddaa', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (11, CAST(N'2020-11-18 13:34:37.640' AS DateTime), N'addasdadaddadada', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (12, CAST(N'2020-11-18 13:36:37.107' AS DateTime), N'ssss', 10, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (13, CAST(N'2020-11-18 13:57:37.387' AS DateTime), N'1', 10, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (14, CAST(N'2020-11-18 13:58:23.983' AS DateTime), N's', 10, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (15, CAST(N'2020-11-18 13:58:48.977' AS DateTime), N'd', 10, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (16, CAST(N'2020-11-18 14:04:38.920' AS DateTime), N'sdaadada', 9, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (17, CAST(N'2020-11-18 14:04:48.953' AS DateTime), N'adadadaadass', 9, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (18, CAST(N'2020-11-18 14:10:42.700' AS DateTime), N'Tessssssss', 1, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (19, CAST(N'2020-11-18 14:10:54.197' AS DateTime), N'ádadsdadfdadad', 2, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (20, CAST(N'2020-11-18 14:14:08.247' AS DateTime), N'ádadadsaddas', 10, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (21, CAST(N'2020-11-18 14:14:16.600' AS DateTime), N's', 14, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (22, CAST(N'2020-11-18 14:14:25.547' AS DateTime), N'sai', 14, 7)
SET IDENTITY_INSERT [dbo].[RepLi] OFF
SET IDENTITY_INSERT [dbo].[StatusBill] ON 

INSERT [dbo].[StatusBill] ([StatusBill_ID], [StatusBill_Name]) VALUES (1, N'Chưa Duyệt')
INSERT [dbo].[StatusBill] ([StatusBill_ID], [StatusBill_Name]) VALUES (2, N'Đã Xem')
INSERT [dbo].[StatusBill] ([StatusBill_ID], [StatusBill_Name]) VALUES (3, N'Đã Duyệt')
INSERT [dbo].[StatusBill] ([StatusBill_ID], [StatusBill_Name]) VALUES (4, N'Xác Nhận Giao Hàng')
INSERT [dbo].[StatusBill] ([StatusBill_ID], [StatusBill_Name]) VALUES (5, N'Đang Giao Hàng')
INSERT [dbo].[StatusBill] ([StatusBill_ID], [StatusBill_Name]) VALUES (6, N'Đã Thanh Toán')
INSERT [dbo].[StatusBill] ([StatusBill_ID], [StatusBill_Name]) VALUES (7, N'Huỷ Đơn')
SET IDENTITY_INSERT [dbo].[StatusBill] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (1, N'Máy Tính Bảng', N'304d41541f45f1c886b2c64762a4e6a8.jpg', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-12-14 11:33:17.817' AS DateTime), 1, 2)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (2, N'Mèo', N'meo.jpg', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-10-30 09:11:45.377' AS DateTime), 1, 3)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (3, N'Gà', N'gà.png', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-10-30 09:13:28.330' AS DateTime), 1, 3)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (4, N'Cá', N'184980.jpg', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-10-30 09:34:07.267' AS DateTime), 1, 3)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (5, N'Cá Sấu', N'184980.jpg', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-10-30 09:36:13.070' AS DateTime), 1, 3)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (6, N'Xe Hơi', N'184980.jpg', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-10-24 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (7, N'Xe Máy', N'184980.jpg', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-10-30 09:36:24.293' AS DateTime), 1, 1)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (8, N'Điện Thoại', N'184980.jpg', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-10-30 09:36:36.007' AS DateTime), 1, 2)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (9, N'Máy Tính', N'184980.jpg', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-10-30 09:36:45.940' AS DateTime), 1, 2)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (14, N'Chó', N'184980.jpg', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-10-24 00:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (15, N'Đàn', N'015-electric-guitar.svg', CAST(N'2020-11-24 09:07:01.070' AS DateTime), CAST(N'2020-11-24 09:07:01.070' AS DateTime), 1, 4)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (16, N'Bonsai', N'icon-2967800_960_720.png', CAST(N'2020-12-11 18:10:53.800' AS DateTime), CAST(N'2020-12-11 19:15:36.470' AS DateTime), 1, 10)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[SubProduct] ON 

INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (1, 1, N'Lenovo')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (2, 8, N'SamSung')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (3, 6, N'Toyota')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (4, 14, N'Chó Poodle')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (5, 15, N'Guitar')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (6, 2, N'Mèo Anh')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (7, 6, N'Huyndai')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (8, 16, N'Bonsai Vườn')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (9, 7, N'Honda')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (10, 2, N'Mèo Ba Tư')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (11, 14, N'Chó Goldden')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (12, 14, N'Chó Alasca')
SET IDENTITY_INSERT [dbo].[SubProduct] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [User_LastName], [User_Name], [User_Token], [User_Activate], [User_Pass], [User_Email], [User_Phone], [User_Role], [User_LinkF], [User_Img], [User_DateCreate], [User_DateLogin], [User_DateBirth], [User_Sex], [User_Address], [Province_ID], [City_ID]) VALUES (3, N'Nguyễn Trần ', N'Phương Vy', N'984cd928-9475-47f1-99c4-9d29dedf1915', 1, N'Phuongvy99^^', N'phuongvy99@gmail.com', N'0364338950', 0, N'https://www.facebook.com/voinguyen1999', N'304d41541f45f1c886b2c64762a4e6a8.jpg', CAST(N'2020-10-24 20:24:25.230' AS DateTime), CAST(N'2020-12-14 11:29:50.977' AS DateTime), CAST(N'1999-06-21' AS Date), 1, N'Số 14, Đường số 9, Hiệp Thành', 10, 3)
INSERT [dbo].[User] ([User_ID], [User_LastName], [User_Name], [User_Token], [User_Activate], [User_Pass], [User_Email], [User_Phone], [User_Role], [User_LinkF], [User_Img], [User_DateCreate], [User_DateLogin], [User_DateBirth], [User_Sex], [User_Address], [Province_ID], [City_ID]) VALUES (7, N'Nguyễn', N'Vy', N'b7b8eb9a-8fcf-4e79-9e6e-93d5201b1050', 1, N'Phuongvy99&&', N'vy@gmail.com', N'0364338950', 0, N'https://www.facebook.com/voinguyen1999', N'hinh-nen-pokemon-cho-may-tinh_035415126.jpg', CAST(N'2020-10-24 20:24:25.230' AS DateTime), CAST(N'2020-12-14 10:53:39.457' AS DateTime), CAST(N'1999-06-21' AS Date), 2, N'Số 14, Đường số 9', 1, 1)
INSERT [dbo].[User] ([User_ID], [User_LastName], [User_Name], [User_Token], [User_Activate], [User_Pass], [User_Email], [User_Phone], [User_Role], [User_LinkF], [User_Img], [User_DateCreate], [User_DateLogin], [User_DateBirth], [User_Sex], [User_Address], [Province_ID], [City_ID]) VALUES (10, N'Nguyễn Trần', N'Phương Vy', N'329206af-7b3d-4eb0-a137-29b5e842f294', 1, N'Phuongvy99**', N'jinnienguyen90@gmail.com', N'0364338950', 0, N'https://www.facebook.com/voinguyen1999', N'meo.jpg', CAST(N'2020-12-14 10:21:19.317' AS DateTime), CAST(N'2020-12-14 10:24:59.663' AS DateTime), CAST(N'1999-12-12' AS Date), 0, N'Số 14, Đường số 9, Hiệp Thành', 12, 3)
INSERT [dbo].[User] ([User_ID], [User_LastName], [User_Name], [User_Token], [User_Activate], [User_Pass], [User_Email], [User_Phone], [User_Role], [User_LinkF], [User_Img], [User_DateCreate], [User_DateLogin], [User_DateBirth], [User_Sex], [User_Address], [Province_ID], [City_ID]) VALUES (12, N'Nguyễn Trần', N'Phương Vy', N'ac9cf508-a8c6-47d2-a536-68c48c2b2781', 1, N'Phuongvy99@@', N'vynguyen99@gmail.com', N'0364338950', 0, N'https://www.facebook.com/voinguyen1999', N'meo-ba-tu-5.jpg', CAST(N'2020-12-14 10:36:07.200' AS DateTime), CAST(N'2020-12-14 10:55:06.713' AS DateTime), CAST(N'1999-06-21' AS Date), 0, N'Số 14, Đường số 9, Hiệp Thành', 10, 3)
INSERT [dbo].[User] ([User_ID], [User_LastName], [User_Name], [User_Token], [User_Activate], [User_Pass], [User_Email], [User_Phone], [User_Role], [User_LinkF], [User_Img], [User_DateCreate], [User_DateLogin], [User_DateBirth], [User_Sex], [User_Address], [Province_ID], [City_ID]) VALUES (13, N'Nguyễn Trần ', N'Phương Vy', N'696f64e2-82a3-43c5-894c-65f533818888', 1, N'Phuongvy99@@', N'nguyentranphuongvy99@gmail.com', N'0364338950', 0, N'https://www.facebook.com/voinguyen1999', N'meo-ba-tu-5.jpg', CAST(N'2020-12-14 11:08:21.863' AS DateTime), CAST(N'2020-12-14 11:26:01.700' AS DateTime), CAST(N'1999-06-21' AS Date), 0, N'Số 14, Đường số 9, Hiệp Thành', 10, 3)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Views] ON 

INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (9, 14, 3, CAST(N'2020-11-10 10:57:10.277' AS DateTime), 1)
INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (13, 6, 3, CAST(N'2020-11-26 12:54:26.407' AS DateTime), 0)
INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (14, 9, 3, CAST(N'2020-12-11 17:43:18.520' AS DateTime), 0)
INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (15, 20, 12, CAST(N'2020-12-14 10:40:02.733' AS DateTime), 1)
INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (16, 20, 12, CAST(N'2020-12-14 10:40:22.567' AS DateTime), 1)
INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (17, 7, 12, CAST(N'2020-12-14 10:51:11.767' AS DateTime), 0)
INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (18, 8, 13, CAST(N'2020-12-14 11:19:28.603' AS DateTime), 1)
INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (19, 20, 13, CAST(N'2020-12-14 11:20:18.623' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Views] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[DetailsInvoices]  WITH CHECK ADD  CONSTRAINT [FK_DetailsInvoices_Invoices] FOREIGN KEY([Invoices_ID])
REFERENCES [dbo].[Invoices] ([Invoices_ID])
GO
ALTER TABLE [dbo].[DetailsInvoices] CHECK CONSTRAINT [FK_DetailsInvoices_Invoices]
GO
ALTER TABLE [dbo].[DetailsInvoices]  WITH CHECK ADD  CONSTRAINT [FK_DetailsInvoices_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[DetailsInvoices] CHECK CONSTRAINT [FK_DetailsInvoices_Product]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_StatusBill] FOREIGN KEY([StatusBill_ID])
REFERENCES [dbo].[StatusBill] ([StatusBill_ID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_StatusBill]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([SubCategory_ID])
REFERENCES [dbo].[SubCategory] ([SubCategory_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubProduct] FOREIGN KEY([SubProduct_ID])
REFERENCES [dbo].[SubProduct] ([SubProduct_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
ALTER TABLE [dbo].[Province]  WITH CHECK ADD  CONSTRAINT [FK_Province_City] FOREIGN KEY([City_ID])
REFERENCES [dbo].[City] ([City_ID])
GO
ALTER TABLE [dbo].[Province] CHECK CONSTRAINT [FK_Province_City]
GO
ALTER TABLE [dbo].[RepLi]  WITH CHECK ADD  CONSTRAINT [FK_RepLi_Comment] FOREIGN KEY([Comment_ID])
REFERENCES [dbo].[Comment] ([Comment_ID])
GO
ALTER TABLE [dbo].[RepLi] CHECK CONSTRAINT [FK_RepLi_Comment]
GO
ALTER TABLE [dbo].[RepLi]  WITH CHECK ADD  CONSTRAINT [FK_RepLi_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[RepLi] CHECK CONSTRAINT [FK_RepLi_User]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
ALTER TABLE [dbo].[SubProduct]  WITH CHECK ADD  CONSTRAINT [FK_SubProduct_SubCategory] FOREIGN KEY([SubCategory_ID])
REFERENCES [dbo].[SubCategory] ([SubCategory_ID])
GO
ALTER TABLE [dbo].[SubProduct] CHECK CONSTRAINT [FK_SubProduct_SubCategory]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_City] FOREIGN KEY([City_ID])
REFERENCES [dbo].[City] ([City_ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_City]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Province] FOREIGN KEY([Province_ID])
REFERENCES [dbo].[Province] ([Province_ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Province]
GO
ALTER TABLE [dbo].[Views]  WITH CHECK ADD  CONSTRAINT [FK_Views_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Views] CHECK CONSTRAINT [FK_Views_Product]
GO
ALTER TABLE [dbo].[Views]  WITH CHECK ADD  CONSTRAINT [FK_Views_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Views] CHECK CONSTRAINT [FK_Views_User]
GO
USE [master]
GO
ALTER DATABASE [WebSelling] SET  READ_WRITE 
GO
