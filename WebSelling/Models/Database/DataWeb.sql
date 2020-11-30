USE [master]
GO
/****** Object:  Database [WebSelling]    Script Date: 11/30/2020 02:34:14 PM ******/
CREATE DATABASE [WebSelling]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebSelling', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WebSelling.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebSelling_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WebSelling_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Admin]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[City]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[DetailsInvoices]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[Invoices]    Script Date: 11/30/2020 02:34:15 PM ******/
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
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[Invoices_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/30/2020 02:34:15 PM ******/
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
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Province]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[RepLi]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[StatusBill]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[SubCategory]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[SubProduct]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 11/30/2020 02:34:15 PM ******/
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
/****** Object:  Table [dbo].[Views]    Script Date: 11/30/2020 02:34:15 PM ******/
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

INSERT [dbo].[Admin] ([Admin_ID], [Admin_Pass], [Admin_Pass2], [Admin_Email], [Admin_Role], [Admin_Token], [Admin_Activate], [Admin_DateCreate], [Admin_DateLogin], [Admin_Name]) VALUES (1, N'admin', N'phuongvy99', N'zoinguyensokiu@gmail.com', 1, N'acf8c74e-8352-4b43-a0cb-dfb0c6afdf14', 1, CAST(N'2020-10-20 16:15:06.083' AS DateTime), CAST(N'2020-11-26 13:58:55.080' AS DateTime), N'Nguyễn Trần Phương Vy')
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

INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID]) VALUES (2, N'Tablet Galaxxy S3', N'but-s-pen-tablet-galaxy-tab-s3.jpg', CAST(N'2020-11-23 15:56:16.660' AS DateTime), 1, 8000000.0000, NULL, NULL, 125, 123123, NULL, N'<h2>Samsung Galaxy Tab S3</h2><p>Gây náo động nhất thị trường máy tính bảng trong thời gian vừa qua không thể không kể đến Samsung Galaxy Tab S3. Có thể nói dòng <a href="https://www.nguyenkim.com/may-tinh-ban-samsung/">tablet Samsung</a> này đã tiên phong trong cuộc cách mạng thiết kế khi cả hai mặt trước và sau đều là kính sáng bóng như gương, và được viền bởi bộ khung nhôm, mang đến cảm giác sang trọng. Nút Home cứng vẫn đảm nhận công việc cảm biến vân tay trên chiếc máy tính màn hình AMOLED 9.7 inch.</p>', N'<h2><strong>Thông số kỹ thuật chi tiết Máy tính bảng Samsung Galaxy Tab S3</strong></h2><ul><li>Màn hình.</li><li>Công nghệ màn hình:Super AMOLED.</li><li>Độ phân giải:1536 x 2048 Pixels.</li><li>Kích thước màn hình:9.7"</li><li>Hệ điều hành &amp; CPU.</li><li>Hệ điều hành:Android 7.</li><li>Chip xử lý (CPU):Snapdragon 820 4 nhân.</li><li>Tốc độ CPU:2 nhân 2.15 GHz &amp; 2 nhân 1.6 GHz.</li></ul>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-23 15:56:16.660' AS DateTime), 3, 1, 2, 3)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID]) VALUES (3, N'Chó Poodle', N'ThuCung.jpg', CAST(N'2020-11-24 08:11:17.783' AS DateTime), 1, 9000000.0000, NULL, NULL, 33, 28, NULL, N'Chó săn vịt là một giống chó săn dùng để săn các loại thủy cầm trong đó chủ yếu là vịt. Ngày nay giống chó này được lai tạo để trở thành dòng chó cảnh. Tên "Poodle" của chúng xuất phát từ chữ "Pudel" trong tiếng Đức, nghĩa là "thợ lặn" hay là "chó lội nước" và bộ lông của chúng có thể đè bẹp cơ thể khi ở trong nước.', N'<p>CÁC LƯU Ý KHI NUÔI CHÓ POODLE – Chó Poodle 2 tháng tuổi đã cai sữa mẹ và đang ở giai đoạn tập ăn, hệ tiêu hóa vẫn còn chưa phát triển toàn diện nên cần 1 chế độ ăn uống hợp lý. – Nên cho chó ăn 2 lần/ngày, đảm bảo bữa ăn đầy đủ các chất dinh dưỡng. Đối với Poodle size Standard cần 1,5 – 3 chén thức ăn khô mỗi ngày; Mini Poodle thì cần ¾ – 1 chén; Toy Poodle có kích thước khá nhỏ thì chỉ cần ¼ – ½ chén mỗi ngày. Đặc biệt nên chú ý cho chó ăn đúng bữa, đúng tiêu chuẩn để kiểm soát cân nặng, tránh những vấn đề sức khỏe xấu có thể xảy ra. – Dù là giống chó nhỏ, không cần không gian quá rộng lớn, nhưng bạn cần để chó vui chơi thoải mái. Nên đưa chúng ra ngoài đi dạo, chơi đùa và vận động thể lực thường xuyên. LƯU Ý KHI HUẤN LUYỆN - Cần phải huấn luyện Poodle ngay từ khi còn nhỏ để sớm hình thành những thói quen tốt cho chúng. Thời gian và cách thức huấn luyện cần được lên lịch bài bản và hợp lý. Tốt nhất là dạy chó vào buổi sáng hoặc chiều, duy trì khoảng 25 phút mỗi ngày. Dạy từ dễ đến khó, tránh để chó phải hoạt động quá sức. - Khi ra lệnh huấn luyện phải ngắn gọn, rõ ràng, dứt khoát. Các bài tập nên dãn cách từ 25 – 30 giây để chó có thời gian nghe hiểu và thực hiện. Tránh dạy dồn dập và ra các lệnh quá khó làm chó không hiểu được. - Thái độ huấn luyện cần cương quyết nhưng phải kiên nhẫn, không nên quát mắng hay làm chó sợ hãi. Mỗi lần chó hoàn thành bài tập, cần khen thưởng bằng đồ ăn hay vuốt ve chúng.</p>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-24 08:11:17.783' AS DateTime), 3, 14, 3, 4)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID]) VALUES (4, N'Đàn Guitar', N'guitar.jpg', CAST(N'2020-11-26 13:09:18.087' AS DateTime), 1, 10000000.0000, NULL, NULL, 33, 28, NULL, N'<p>Đàn guitar Acoustic Fender CD-60SCE Dreadnought cutaway tự hào với các tính năng bạn mong muốn trên các phiên bản đắt hơn nhiều, với mặt top thùng đàn gỗ spruce nguyên khối. Cây guitar acoustic cutaway dreadnought Đàn guitar CD-60SCE có dáng Cutaway dreadnought (hay còn gọi là dáng D khuyết). Thùng đàn lớn cho tiếng đàn to, ấm và đầy hơn, phù hợp cho các bạn chơi đệm và dùng pick. Dễ dàng sử dụng Các phím đàn trọn trịa trên mặt phím Rosewood tạo cảm giác thoải mái vô cùng, lý tưởng cho người chơi bắt đầu hoặc những người chưa có nhiều kinh nghiệm.</p>', N'<p><strong>Mặt sau và bên hông được làm từ gỗ mahogany</strong></p><p><strong>Gỗ mahogany được dùng làm mặt sau và hai bên hông đàn guitar CD-60SCE cho âm thanh rất rõ ràng. Âm thanh ấm và hợp với nhạc blues và kỹ thuật fingerpicking.</strong></p><p>&nbsp;</p><p><strong>Mặt trước đàn bằng gỗ spruce rắn chắc</strong></p><p><strong>Spruce là loại gỗ có độ bền và độ dẻo dai cao, được sử dụng rất phổ biến để làm soundboard đàn. Đặc tính của gỗ Spruce là rất cứng và nhẹ, chính vì vậy đây cũng là loại gỗ có tốc độ truyền âm thanh, độ vang rất cao, giai điệu rất rõ ràng và đầy đủ, phản ứng tốt với bất kỳ phong cách chơi acoustic nào, từ hard strumming đếm fast flatpicking hay delicate fingerpicking.</strong></p><p>&nbsp;</p><p><strong>Hệ thống pickup của Fishman</strong></p><p><strong>CD-60SCE sử dụng pick-up của Fishman với EQ 3-band với các tùy chỉnh: bass, mid, treble và một nút điều chỉnh âm lượng. Đặc biệt còn có chức năng chromatic tuner tích hợp sẵn giúp bạn giữ cây đàn đúng tông, và chromatic tuner giúp bạn dễ dàng chỉnh dây theo những tông khác nhau (Half step down, D tuning, Open E...) hơn những loại tuner thông thường. Preamp của Fishman® mang lại hiệu suất khuếch đại vô song cho cây đàn của bạn, phù hợp với những ai có nhu cầu chơi biểu diễn trên sân khấu với hệ thống âm thanh lớn.</strong></p>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-26 13:09:18.087' AS DateTime), 3, 15, 4, 5)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID]) VALUES (5, N'Mèo Ragdoll', N'meo-ragdoll-7.jpg', CAST(N'2020-11-26 14:06:26.427' AS DateTime), 1, 20000000.0000, NULL, NULL, 31, 28, NULL, N'<p>Người tìm thấy Ragdoll lần đầu tiên vào thập niên 60 là Ann Baker, một chuyên gia gây giống mèo Ba Tư ở California. <strong>Mèo Ragdoll</strong> xuất hiện là do sự lai tạo phức tạp từ nhiều giống mèo khác nhau, khởi điểm là một cô mèo cái xinh xắn tên là Josephine. Sau một vụ tai nạn giao thông, Josephine phải trải qua các thí nghiệm về di truyền và dường như từ đó cấu trúc gen của cô mèo này đã bị thay đổi.</p><p>Ann Baker thấy rằng cô mèo Josephine trở nên ngoan ngoãn, dễ bảo và thân thiện hơn, cũng giỏi chịu đau hơn và cơ thể sẽ mềm nhũn khi được bế lên. Sau khi khỏi bệnh, những chú mèo mà Josephine sinh ra cũng mặc một chứng tương tự như mẹ nó đó là cơ thể khi được con người bế lên sẽ nhũn ra. Tính cách của đám mèo con cũng hiền hòa như mèo mẹ. Cũng từ đây, Ann Baker đã bắt tay vào gây giống Ragdoll Cat. Và hiệp hội <i>mèo Ragdoll</i> được thành lập và xây dựng lên nhiều tiêu chuẩn, quy định nghiêm ngặt. Sau một khoảng thời gian dài đấu tranh nhằm mục đích tìm kiếm sự thừa nhận cho Ragdoll thì đến năm 2002, giống mèo này đã được công nhận toàn thế giới là nòi mèo riêng biệt.</p><h3>Chế độ ăn cho mèo Ragdoll</h3><p>Bản tính lười nhác đã “ăn sâu trong máu” nên bạn cần để ý đến việc lựa chọn <a href="https://petmaster.vn/shop-cho-meo/thuc-an-cho-meo/">thức ăn cho mèo</a> và tập luyện của giống mèo này. Nếu những loài mèo khác mỗi bữa ăn 1 thìa hạt khô thì với Ragdoll cần tăng lên là 1.5 hoặc 2 thìa. Tuy nhiên, sau khi ăn xong từ 30 phút – 1 tiếng, bạn cần kéo chúng ngồi dậy chơi đùa hoặc cho đi dạo để tiêu hao bớt năng lượng, tránh tình trạng thừa cân.</p><p>Các loại thực phẩm dành cho <i>mèo Ragdoll</i> cũng tương tự như các loài mèo cảnh khác. Nhóm đồ ăn tươi như thịt bò, thịt gà, nội tạng động vật, rau củ quả,… đều cung cấp đầy đủ protein, chất xơ cho mèo tuy nhiên cần được chế biến kĩ càng để mèo không bị rối loạn tiêu hóa. Bạn có thể cho mèo ăn hạt khô nếu không có nhiều thời gian nấu nướng. Nhưng cách tiết kiệm nhất vẫn là tự làm pate tại nhà, rẻ mà vẫn đầy đủ chất dinh dưỡng.</p><h3>Chăm sóc lông cho mèo Ragdoll</h3><p><i>Mèo Ragdoll</i> có bộ lông dài và dày, chính vì thế việc lông rụng quanh năm là điều không thể tránh hỏi. Để hạn chế tình trạng này, bạn nên chải lông thường xuyên cho mèo 1 lần/ngày bằng lược chải chuyên dụng cho mèo. Chú ý gỡ những phần lông bết dính, bị rối tránh cho mèo liếm lông quá nhiều.</p><p>Bên cạnh đó, nên chăm chỉ tắm cho chúng mỗi tuần một lần để bộ lông luôn bóng mượt, thơm tho, loại bỏ bụi bẩn và chất rận. Nếu lười một chút thì có thể để 2 – 3 tuần tắm 1 lần. Bạn cũng có thể đem mèo ra những tiệm spa thú cưng với chi phí mỗi lần tắm từ 100.000 VNĐ. Sau khi tắm xong bạn nên sấy khô lông cho chúng, lông mèo còn ướt sẽ gây ra cảm lạnh, ho hoặc viêm phổi.<br>&nbsp;</p>', N'<p>Ragdoll có đầy đủ sự tinh tế, duyên dáng của một con mèo, nhưng lại có những nét tính cách đặc trưng của loài chó.</p><ul><li>Xếp loại: mèo cỡ lớn</li><li>Nguồn gốc: Mỹ</li><li>Mắt: màu xanh</li><li>Lông: nhiều màu trắng</li><li>Tuổi thọ: 12-15 năm</li><li>Chiều cao: 38-50 cm</li><li>Giá bán tham khảo: 12.000.000 – 20.000.000 VNĐ</li><li>Cân nặng: 4-9 kg</li><li>Đặc điểm: thân thiện, quấn chủ</li></ul><h2>Thang điểm đánh giá chung</h2><ul><li>Mức độ quấn chủ 100%</li><li>Mức độ kêu 80%</li><li>Mức độ rụng lông 60%</li><li>Mức độ mùi hôi 20%</li><li>Mức độ dễ làm đẹp 20%</li><li>Thân thiện với trẻ em 100%</li><li>Thân thiện với động vật khác 80%</li><li>Khả năng vận động 80%</li><li>Khả năng học hỏi 80%</li><li>Khả năng chịu lạnh 80%</li></ul>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-26 14:06:26.427' AS DateTime), 3, 2, 3, 6)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID]) VALUES (6, N'SamSung J7pro', N'ThuCung.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), 1, 5000000.0000, NULL, NULL, 31, 28, NULL, N'Chó săn vịt là một giống chó săn dùng để săn các loại thủy cầm trong đó chủ yếu là vịt. Ngày nay giống chó này được lai tạo để trở thành dòng chó cảnh. Tên "Poodle" của chúng xuất phát từ chữ "Pudel" trong tiếng Đức, nghĩa là "thợ lặn" hay là "chó lội nước" và bộ lông của chúng có thể đè bẹp cơ thể khi ở trong nước.', N'CÁC LƯU Ý KHI NUÔI CHÓ POODLE
– Chó Poodle 2 tháng tuổi đã cai sữa mẹ và đang ở giai đoạn tập ăn, hệ tiêu hóa vẫn còn chưa phát triển toàn diện nên cần 1 chế độ ăn uống hợp lý.

– Nên cho chó ăn 2 lần/ngày, đảm bảo bữa ăn đầy đủ các chất dinh dưỡng. Đối với Poodle size Standard cần 1,5 – 3 chén thức ăn khô mỗi ngày; Mini Poodle thì cần ¾ – 1 chén; Toy Poodle có kích thước khá nhỏ thì chỉ cần ¼ – ½ chén mỗi ngày. Đặc biệt nên chú ý cho chó ăn đúng bữa, đúng tiêu chuẩn để kiểm soát cân nặng, tránh những vấn đề sức khỏe xấu có thể xảy ra.

– Dù là giống chó nhỏ, không cần không gian quá rộng lớn, nhưng bạn cần để chó vui chơi thoải mái. Nên đưa chúng ra ngoài đi dạo, chơi đùa và vận động thể lực thường xuyên.

LƯU Ý KHI HUẤN LUYỆN
- Cần phải huấn luyện Poodle ngay từ khi còn nhỏ để sớm hình thành những thói quen tốt cho chúng. Thời gian và cách thức huấn luyện cần được lên lịch bài bản và hợp lý. Tốt nhất là dạy chó vào buổi sáng hoặc chiều, duy trì khoảng 25 phút mỗi ngày. Dạy từ dễ đến khó, tránh để chó phải hoạt động quá sức.

- Khi ra lệnh huấn luyện phải ngắn gọn, rõ ràng, dứt khoát. Các bài tập nên dãn cách từ 25 – 30 giây để chó có thời gian nghe hiểu và thực hiện. Tránh dạy dồn dập và ra các lệnh quá khó làm chó không hiểu được.

- Thái độ huấn luyện cần cương quyết nhưng phải kiên nhẫn, không nên quát mắng hay làm chó sợ hãi. Mỗi lần chó hoàn thành bài tập, cần khen thưởng bằng đồ ăn hay vuốt ve chúng.', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-10-12 00:00:00.000' AS DateTime), 7, 3, 1, 1)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID]) VALUES (7, N'SamSung J7pro', N'ThuCung.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), 1, 3000000.0000, NULL, NULL, 28, 28, NULL, N'Chó săn vịt là một giống chó săn dùng để săn các loại thủy cầm trong đó chủ yếu là vịt. Ngày nay giống chó này được lai tạo để trở thành dòng chó cảnh. Tên "Poodle" của chúng xuất phát từ chữ "Pudel" trong tiếng Đức, nghĩa là "thợ lặn" hay là "chó lội nước" và bộ lông của chúng có thể đè bẹp cơ thể khi ở trong nước.', N'CÁC LƯU Ý KHI NUÔI CHÓ POODLE
– Chó Poodle 2 tháng tuổi đã cai sữa mẹ và đang ở giai đoạn tập ăn, hệ tiêu hóa vẫn còn chưa phát triển toàn diện nên cần 1 chế độ ăn uống hợp lý.

– Nên cho chó ăn 2 lần/ngày, đảm bảo bữa ăn đầy đủ các chất dinh dưỡng. Đối với Poodle size Standard cần 1,5 – 3 chén thức ăn khô mỗi ngày; Mini Poodle thì cần ¾ – 1 chén; Toy Poodle có kích thước khá nhỏ thì chỉ cần ¼ – ½ chén mỗi ngày. Đặc biệt nên chú ý cho chó ăn đúng bữa, đúng tiêu chuẩn để kiểm soát cân nặng, tránh những vấn đề sức khỏe xấu có thể xảy ra.

– Dù là giống chó nhỏ, không cần không gian quá rộng lớn, nhưng bạn cần để chó vui chơi thoải mái. Nên đưa chúng ra ngoài đi dạo, chơi đùa và vận động thể lực thường xuyên.

LƯU Ý KHI HUẤN LUYỆN
- Cần phải huấn luyện Poodle ngay từ khi còn nhỏ để sớm hình thành những thói quen tốt cho chúng. Thời gian và cách thức huấn luyện cần được lên lịch bài bản và hợp lý. Tốt nhất là dạy chó vào buổi sáng hoặc chiều, duy trì khoảng 25 phút mỗi ngày. Dạy từ dễ đến khó, tránh để chó phải hoạt động quá sức.

- Khi ra lệnh huấn luyện phải ngắn gọn, rõ ràng, dứt khoát. Các bài tập nên dãn cách từ 25 – 30 giây để chó có thời gian nghe hiểu và thực hiện. Tránh dạy dồn dập và ra các lệnh quá khó làm chó không hiểu được.

- Thái độ huấn luyện cần cương quyết nhưng phải kiên nhẫn, không nên quát mắng hay làm chó sợ hãi. Mỗi lần chó hoàn thành bài tập, cần khen thưởng bằng đồ ăn hay vuốt ve chúng.', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-10-12 00:00:00.000' AS DateTime), 7, 1, 1, 1)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID]) VALUES (8, N'SamSung J7pro', N'ThuCung.jpg', CAST(N'2020-11-26 15:44:40.717' AS DateTime), 1, 3000000.0000, NULL, NULL, 29, 28, NULL, N'<p>Chó săn vịt là một giống chó săn dùng để săn các loại thủy cầm trong đó chủ yếu là vịt. Ngày nay giống chó này được lai tạo để trở thành dòng chó cảnh. Tên "Poodle" của chúng xuất phát từ chữ "Pudel" trong tiếng Đức, nghĩa là "thợ lặn" hay là "chó lội nước" và bộ lông của chúng có thể đè bẹp cơ thể khi ở trong nước.</p>', N'<p>CÁC LƯU Ý KHI NUÔI CHÓ POODLE – Chó Poodle 2 tháng tuổi đã cai sữa mẹ và đang ở giai đoạn tập ăn, hệ tiêu hóa vẫn còn chưa phát triển toàn diện nên cần 1 chế độ ăn uống hợp lý. – Nên cho chó ăn 2 lần/ngày, đảm bảo bữa ăn đầy đủ các chất dinh dưỡng. Đối với Poodle size Standard cần 1,5 – 3 chén thức ăn khô mỗi ngày; Mini Poodle thì cần ¾ – 1 chén; Toy Poodle có kích thước khá nhỏ thì chỉ cần ¼ – ½ chén mỗi ngày. Đặc biệt nên chú ý cho chó ăn đúng bữa, đúng tiêu chuẩn để kiểm soát cân nặng, tránh những vấn đề sức khỏe xấu có thể xảy ra. – Dù là giống chó nhỏ, không cần không gian quá rộng lớn, nhưng bạn cần để chó vui chơi thoải mái. Nên đưa chúng ra ngoài đi dạo, chơi đùa và vận động thể lực thường xuyên. LƯU Ý KHI HUẤN LUYỆN - Cần phải huấn luyện Poodle ngay từ khi còn nhỏ để sớm hình thành những thói quen tốt cho chúng. Thời gian và cách thức huấn luyện cần được lên lịch bài bản và hợp lý. Tốt nhất là dạy chó vào buổi sáng hoặc chiều, duy trì khoảng 25 phút mỗi ngày. Dạy từ dễ đến khó, tránh để chó phải hoạt động quá sức. - Khi ra lệnh huấn luyện phải ngắn gọn, rõ ràng, dứt khoát. Các bài tập nên dãn cách từ 25 – 30 giây để chó có thời gian nghe hiểu và thực hiện. Tránh dạy dồn dập và ra các lệnh quá khó làm chó không hiểu được. - Thái độ huấn luyện cần cương quyết nhưng phải kiên nhẫn, không nên quát mắng hay làm chó sợ hãi. Mỗi lần chó hoàn thành bài tập, cần khen thưởng bằng đồ ăn hay vuốt ve chúng.</p>', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-11-26 15:44:40.717' AS DateTime), 3, 1, 1, 1)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID]) VALUES (9, N'SamSung J7pro', N'ThuCung.jpg', CAST(N'2020-10-12 00:00:00.000' AS DateTime), 1, 2000000.0000, NULL, NULL, 2, 28, NULL, N'Chó săn vịt là một giống chó săn dùng để săn các loại thủy cầm trong đó chủ yếu là vịt. Ngày nay giống chó này được lai tạo để trở thành dòng chó cảnh. Tên "Poodle" của chúng xuất phát từ chữ "Pudel" trong tiếng Đức, nghĩa là "thợ lặn" hay là "chó lội nước" và bộ lông của chúng có thể đè bẹp cơ thể khi ở trong nước.', N'CÁC LƯU Ý KHI NUÔI CHÓ POODLE
– Chó Poodle 2 tháng tuổi đã cai sữa mẹ và đang ở giai đoạn tập ăn, hệ tiêu hóa vẫn còn chưa phát triển toàn diện nên cần 1 chế độ ăn uống hợp lý.

– Nên cho chó ăn 2 lần/ngày, đảm bảo bữa ăn đầy đủ các chất dinh dưỡng. Đối với Poodle size Standard cần 1,5 – 3 chén thức ăn khô mỗi ngày; Mini Poodle thì cần ¾ – 1 chén; Toy Poodle có kích thước khá nhỏ thì chỉ cần ¼ – ½ chén mỗi ngày. Đặc biệt nên chú ý cho chó ăn đúng bữa, đúng tiêu chuẩn để kiểm soát cân nặng, tránh những vấn đề sức khỏe xấu có thể xảy ra.

– Dù là giống chó nhỏ, không cần không gian quá rộng lớn, nhưng bạn cần để chó vui chơi thoải mái. Nên đưa chúng ra ngoài đi dạo, chơi đùa và vận động thể lực thường xuyên.

LƯU Ý KHI HUẤN LUYỆN
- Cần phải huấn luyện Poodle ngay từ khi còn nhỏ để sớm hình thành những thói quen tốt cho chúng. Thời gian và cách thức huấn luyện cần được lên lịch bài bản và hợp lý. Tốt nhất là dạy chó vào buổi sáng hoặc chiều, duy trì khoảng 25 phút mỗi ngày. Dạy từ dễ đến khó, tránh để chó phải hoạt động quá sức.

- Khi ra lệnh huấn luyện phải ngắn gọn, rõ ràng, dứt khoát. Các bài tập nên dãn cách từ 25 – 30 giây để chó có thời gian nghe hiểu và thực hiện. Tránh dạy dồn dập và ra các lệnh quá khó làm chó không hiểu được.

- Thái độ huấn luyện cần cương quyết nhưng phải kiên nhẫn, không nên quát mắng hay làm chó sợ hãi. Mỗi lần chó hoàn thành bài tập, cần khen thưởng bằng đồ ăn hay vuốt ve chúng.', NULL, CAST(N'2020-10-12 00:00:00.000' AS DateTime), CAST(N'2020-10-12 00:00:00.000' AS DateTime), 7, 4, 1, 1)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID]) VALUES (14, N'Điện Thoại SamsungJ7 Pro', N'samsung_galaxy_j7_pro.jpg', CAST(N'2020-11-26 14:00:23.087' AS DateTime), 1, 7000000.0000, NULL, NULL, 271, 1, NULL, N'<p>Không có</p>', N'<h4><strong>Thông số kỹ thuật chi tiết Điện thoại Samsung Galaxy J7 Pro</strong></h4><p>Màn hình.</p><p>Công nghệ màn hình:Super AMOLED.</p><p>Độ phân giải:Full HD (1080 x 1920 Pixels)</p><p>Màn hình rộng:5.5"</p><p>Mặt kính cảm ứng:Kính cường lực Corning Gorilla Glass 4.</p><p>Độ phân giải:13 MP.</p><p>Quay phim:Có quay phim.</p><p>Đèn Flash:Có</p>', NULL, CAST(N'2020-11-07 21:20:11.000' AS DateTime), CAST(N'2020-11-26 14:00:23.087' AS DateTime), 3, 8, 2, 2)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID]) VALUES (15, N'Mèo Lông Ngắn (Đen)', N'meo-anh-long-ngan2.jpg', CAST(N'2020-11-30 13:14:47.687' AS DateTime), 1, 6500000.0000, NULL, NULL, 0, 0, NULL, N'<h2>Nguồn gốc của mèo Anh lông ngắn</h2><p>Cái tên của loài mèo này đã nói lên quê hương chúng rồi, đó là vương quốc Anh xinh đẹp. Chúng xuất hiện vào khoảng 100 năm TCN. Qua nhiều quá trình lai tạo giống mèo Ai Cập và giống mèo bản địa Anh, thêm với giống mèo Ba Tư, mèo Anh mà chúng ta nhìn thấy ngày nay vô cùng đáng yêu, xinh đẹp.</p><p>Với những phẩm chất cũng đáng yêu</p>', N'<p><strong>Aln</strong> tỏ ra vô cùng dễ tính trong ăn uống, chủ nhân cho ăn gì là sẽ ăn ngon lành, từ thức hạt chế biến sẵn cho đến đồ tự nấu. Tuy nhiên, cần xây dựng một thực đơn ăn uống khoa học, cung cấp đầy đủ chất dinh dưỡng có lợi cho sự phát triển của mèo như: protein (có trong thịt, cá), rau kèm 1 miếng pate hoặc phô mai – món ăn khoái khẩu, nên nhớ là luôn luôn kết hợp với nước uống sạch sẽ đảm bảo mèo đủ uống cả ngày nhé!</p><p>Chia nhỏ bữa ăn theo từng độ tuổi phát triển.&nbsp;</p><ul><li>2 – 3 tháng tuổi, cho chúng ăn 4 – 5 bữa nhỏ/ ngày, nên ăn cháo thịt xay nhuyễn.</li><li>3 – 5 tháng tuổi: tăng lượng thức ăn mỗi bữa, nhưng giảm thành 3 bữa mỗi ngày.</li><li>Giai đoạn trưởng thành thì Aln chỉ cần ăn 2 bữa lớn là đủ.</li></ul><p>Chớ nên cho <strong>mèo Anh lông ngắn</strong> ăn quá nhiều tinh bột, những đồ ăn chứa nhiều chất béo, đồ dầu mỡ, chocolate bởi chúng sẽ không hấp thụ được hết, dễ béo phì bởi ít vận động.</p>', NULL, CAST(N'2020-11-26 15:34:42.000' AS DateTime), CAST(N'2020-11-30 13:14:47.687' AS DateTime), 3, 2, 3, 6)
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

INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (1, N'Máy Tính Bảng', N'184980.jpg', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-10-30 08:59:10.093' AS DateTime), 1, 2)
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
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[SubProduct] ON 

INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (1, 1, N'Lenovo')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (2, 8, N'SamSung')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (3, 1, N'SamSung')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (4, 14, N'Chó Poodle')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (5, 15, N'Guitar')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (6, 2, N'Mèo Anh')
SET IDENTITY_INSERT [dbo].[SubProduct] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [User_LastName], [User_Name], [User_Token], [User_Activate], [User_Pass], [User_Email], [User_Phone], [User_Role], [User_LinkF], [User_Img], [User_DateCreate], [User_DateLogin], [User_DateBirth], [User_Sex], [User_Address], [Province_ID], [City_ID]) VALUES (3, N'Nguyễn Trần ', N'Phương Vy', N'8808ab03-efce-4ae6-a059-b668d7dd13f2', 1, N'Phuongvy99**', N'phuongvy99@gmail.com', N'0364338950', 0, N'https://www.facebook.com/voinguyen1999', N'1fa16d89d704c3e7f79bfcf660d22325.jpg', CAST(N'2020-10-24 20:24:25.230' AS DateTime), CAST(N'2020-11-30 13:05:36.833' AS DateTime), CAST(N'1999-06-22' AS Date), 1, N'Số 14, Đường số 9, Hiệp Thành', 9, 3)
INSERT [dbo].[User] ([User_ID], [User_LastName], [User_Name], [User_Token], [User_Activate], [User_Pass], [User_Email], [User_Phone], [User_Role], [User_LinkF], [User_Img], [User_DateCreate], [User_DateLogin], [User_DateBirth], [User_Sex], [User_Address], [Province_ID], [City_ID]) VALUES (7, N'Nguyễn', N'Vy', N'b419f50a-3fec-46b0-985e-f59465ce4034', 1, N'21061999', N'vy@gmail.com', N'0364338950', 0, N'https://www.facebook.com/voinguyen1999', N'hinh-nen-pokemon-cho-may-tinh_035415126.jpg', CAST(N'2020-10-24 20:24:25.230' AS DateTime), CAST(N'2020-11-18 14:10:07.133' AS DateTime), CAST(N'1999-06-21' AS Date), 2, N'Số 14, Đường số 9', 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Views] ON 

INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (9, 14, 3, CAST(N'2020-11-10 10:57:10.277' AS DateTime), 1)
INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (13, 6, 3, CAST(N'2020-11-26 12:54:26.407' AS DateTime), 0)
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
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_StatusBill] FOREIGN KEY([StatusBill_ID])
REFERENCES [dbo].[StatusBill] ([StatusBill_ID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_StatusBill]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_User] FOREIGN KEY([Invoices_ID])
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
