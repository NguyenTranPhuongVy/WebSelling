USE [master]
GO
/****** Object:  Database [WebSelling]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[City]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[DetailsInvoices]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[Invoices]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[Province]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[RepLi]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[StatusBill]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[SubCategory]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[SubProduct]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 11-Dec-20 4:53:31 PM ******/
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
/****** Object:  Table [dbo].[Views]    Script Date: 11-Dec-20 4:53:31 PM ******/
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

INSERT [dbo].[Admin] ([Admin_ID], [Admin_Pass], [Admin_Pass2], [Admin_Email], [Admin_Role], [Admin_Token], [Admin_Activate], [Admin_DateCreate], [Admin_DateLogin], [Admin_Name]) VALUES (1, N'AdminSelling1!!', N'Phuongvy99**', N'admin@gmail.com', 1, N'd3876f1d-6709-4d3f-a530-132d17b38e36', 1, CAST(0x0000AC5A010BD1D1 AS DateTime), CAST(0x0000AC8B00D52FA2 AS DateTime), N'Nguyễn Trần Phương Vy')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (1, N'Xe Cộ', N'download.jpg', CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC64009F3CE5 AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (2, N'Đồ Điện Tử', N'vi_smartphone-large-2013121017506.jpg', CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7C00B4C2C0 AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (3, N'Thú Cưng', N'lam-the-nao-thu-cung-co-the-cai-thien-suc-khoe-cua-ban2.jpg', CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7C00F6634B AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (4, N'Giải Trí, Thể Thao', N'myKplus-laptop.jpg', CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7C01005926 AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (5, N'Đồ Văn Phòng', N'ban-ghe-van-phong-thanh-ly-03.jpg', CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7C010064A9 AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (6, N'Đồ Nông Nghiệp', N'160036_P14_Nong_nghiYp.jpg', CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7C01022EFC AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (7, N'Dịch Vụ', N'cong-so-3.jpg', CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7C01024410 AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (8, N'Mẹ Và Bé', N'kinh_nghiem_ban_hang_online_cac_shop_me_va_be_1.jpg', CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7C010252E7 AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (9, N'Đồ Gia Dụng, Nội Thất', N'1554273577-can-dinh-huong-chu-de-cho-phong-giai-tri-tai-gia.jpg', CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7C010261D1 AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (10, N'Cây Cảnh', N'33-1567649196717622170194-crop-15676492145021350614745.jpg', CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7C01026E4C AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (12, N'Bất Động Sản', N'unnamed.jpg', CAST(0x0000AC6000B13CCD AS DateTime), CAST(0x0000AC7C01027A72 AS DateTime), 1)
INSERT [dbo].[Category] ([Category_ID], [Category_Name], [Category_Img], [Category_DateCreate], [Category_DateEdit], [Category_Activate]) VALUES (13, N'Việc Làm', N'shutterstock_162650096.jpg', CAST(0x0000AC6000B37991 AS DateTime), CAST(0x0000AC7C0102216B AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (1, N'Cần Thơ')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (2, N'TP.Hồ Chí Minh')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (3, N'Bình Dương')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (4, N'Hà Nội')
INSERT [dbo].[City] ([City_ID], [City_Name]) VALUES (5, N'Bình Phước')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (1, CAST(0x0000AC7700000000 AS DateTime), N'Cmm1', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (2, CAST(0x0000AC7700000000 AS DateTime), N'Hello', NULL, 7, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (3, CAST(0x0000AC7700000000 AS DateTime), N'Hello', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (4, CAST(0x0000AC7700BCB322 AS DateTime), N'hkhkhkh', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (5, CAST(0x0000AC7700BD6FB5 AS DateTime), N'sdadada', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (6, CAST(0x0000AC7700BD77B9 AS DateTime), N'Xong', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (7, CAST(0x0000AC7700D2C745 AS DateTime), N'Yes', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (8, CAST(0x0000AC7700D2D9CE AS DateTime), N'dâdadadaadad', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (9, CAST(0x0000AC7700D34549 AS DateTime), N'Test', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (10, CAST(0x0000AC7700D679E0 AS DateTime), N'12456', NULL, 3, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (11, CAST(0x0000AC7700E8156C AS DateTime), N'addadadadad', NULL, 7, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (12, CAST(0x0000AC7700E8AD4E AS DateTime), N'saddaaaddssss', NULL, 7, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (13, CAST(0x0000AC7700E8E8CD AS DateTime), N'sdaddaaadad', NULL, 7, 14)
INSERT [dbo].[Comment] ([Comment_ID], [Comment_DateCreate], [Comment_Content], [Comment_Spam], [User_ID], [Product_ID]) VALUES (14, CAST(0x0000AC7700E99750 AS DateTime), N'sdaddaadadadssdadaadadads', NULL, 7, 14)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[DetailsInvoices] ON 

INSERT [dbo].[DetailsInvoices] ([DetailsInvoices_ID], [Product_ID], [Invoices_ID]) VALUES (6, 6, 14)
INSERT [dbo].[DetailsInvoices] ([DetailsInvoices_ID], [Product_ID], [Invoices_ID]) VALUES (7, 2, 15)
SET IDENTITY_INSERT [dbo].[DetailsInvoices] OFF
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([Invoices_ID], [Invoices_Buyer], [Invoices_Seller], [Invoices_Address], [Invoices_Phone], [User_ID], [Invoices_TotalPay], [Invoices_DateCreate], [Invoices_Note], [StatusBill_ID], [Invoices_EmailSeller]) VALUES (14, N'Nguyễn Trần  Phương Vy', N'Nguyễn Vy', N'Số 14, Đường số 9, Hiệp Thành TP. Thủ Dầu Một Bình Dương', N'0364338950', 3, 650000000, CAST(0x0000AC8B00C5AC57 AS DateTime), NULL, 5, N'vy@gmail.com')
INSERT [dbo].[Invoices] ([Invoices_ID], [Invoices_Buyer], [Invoices_Seller], [Invoices_Address], [Invoices_Phone], [User_ID], [Invoices_TotalPay], [Invoices_DateCreate], [Invoices_Note], [StatusBill_ID], [Invoices_EmailSeller]) VALUES (15, N'Nguyễn Vy', N'Nguyễn Trần  Phương Vy', N'Số 14, Đường số 9 Quận 1 Cần Thơ', N'0364338950', 7, 8000000, CAST(0x0000AC8B00C5F395 AS DateTime), NULL, 7, N'phuongvy99@gmail.com')
SET IDENTITY_INSERT [dbo].[Invoices] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (2, N'Tablet Galaxxy S3', N'but-s-pen-tablet-galaxy-tab-s3.jpg', CAST(0x0000AC7C0106A646 AS DateTime), 0, 8000000.0000, NULL, NULL, 128, 123123, NULL, N'<h2>Samsung Galaxy Tab S3</h2><p>Gây náo động nhất thị trường máy tính bảng trong thời gian vừa qua không thể không kể đến Samsung Galaxy Tab S3. Có thể nói dòng <a href="https://www.nguyenkim.com/may-tinh-ban-samsung/">tablet Samsung</a> này đã tiên phong trong cuộc cách mạng thiết kế khi cả hai mặt trước và sau đều là kính sáng bóng như gương, và được viền bởi bộ khung nhôm, mang đến cảm giác sang trọng. Nút Home cứng vẫn đảm nhận công việc cảm biến vân tay trên chiếc máy tính màn hình AMOLED 9.7 inch.</p>', N'<h2><strong>Thông số kỹ thuật chi tiết Máy tính bảng Samsung Galaxy Tab S3</strong></h2><ul><li>Màn hình.</li><li>Công nghệ màn hình:Super AMOLED.</li><li>Độ phân giải:1536 x 2048 Pixels.</li><li>Kích thước màn hình:9.7"</li><li>Hệ điều hành &amp; CPU.</li><li>Hệ điều hành:Android 7.</li><li>Chip xử lý (CPU):Snapdragon 820 4 nhân.</li><li>Tốc độ CPU:2 nhân 2.15 GHz &amp; 2 nhân 1.6 GHz.</li></ul>', NULL, CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7C0106A646 AS DateTime), 3, 1, 2, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (3, N'Chó Poodle', N'ThuCung.jpg', CAST(0x0000AC7D0086F047 AS DateTime), 1, 9000000.0000, NULL, NULL, 51, 28, NULL, N'Chó săn vịt là một giống chó săn dùng để săn các loại thủy cầm trong đó chủ yếu là vịt. Ngày nay giống chó này được lai tạo để trở thành dòng chó cảnh. Tên "Poodle" của chúng xuất phát từ chữ "Pudel" trong tiếng Đức, nghĩa là "thợ lặn" hay là "chó lội nước" và bộ lông của chúng có thể đè bẹp cơ thể khi ở trong nước.', N'<p>CÁC LƯU Ý KHI NUÔI CHÓ POODLE – Chó Poodle 2 tháng tuổi đã cai sữa mẹ và đang ở giai đoạn tập ăn, hệ tiêu hóa vẫn còn chưa phát triển toàn diện nên cần 1 chế độ ăn uống hợp lý. – Nên cho chó ăn 2 lần/ngày, đảm bảo bữa ăn đầy đủ các chất dinh dưỡng. Đối với Poodle size Standard cần 1,5 – 3 chén thức ăn khô mỗi ngày; Mini Poodle thì cần ¾ – 1 chén; Toy Poodle có kích thước khá nhỏ thì chỉ cần ¼ – ½ chén mỗi ngày. Đặc biệt nên chú ý cho chó ăn đúng bữa, đúng tiêu chuẩn để kiểm soát cân nặng, tránh những vấn đề sức khỏe xấu có thể xảy ra. – Dù là giống chó nhỏ, không cần không gian quá rộng lớn, nhưng bạn cần để chó vui chơi thoải mái. Nên đưa chúng ra ngoài đi dạo, chơi đùa và vận động thể lực thường xuyên. LƯU Ý KHI HUẤN LUYỆN - Cần phải huấn luyện Poodle ngay từ khi còn nhỏ để sớm hình thành những thói quen tốt cho chúng. Thời gian và cách thức huấn luyện cần được lên lịch bài bản và hợp lý. Tốt nhất là dạy chó vào buổi sáng hoặc chiều, duy trì khoảng 25 phút mỗi ngày. Dạy từ dễ đến khó, tránh để chó phải hoạt động quá sức. - Khi ra lệnh huấn luyện phải ngắn gọn, rõ ràng, dứt khoát. Các bài tập nên dãn cách từ 25 – 30 giây để chó có thời gian nghe hiểu và thực hiện. Tránh dạy dồn dập và ra các lệnh quá khó làm chó không hiểu được. - Thái độ huấn luyện cần cương quyết nhưng phải kiên nhẫn, không nên quát mắng hay làm chó sợ hãi. Mỗi lần chó hoàn thành bài tập, cần khen thưởng bằng đồ ăn hay vuốt ve chúng.</p>', NULL, CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7D0086F047 AS DateTime), 3, 14, 3, 4, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (4, N'Đàn Guitar', N'guitar.jpg', CAST(0x0000AC7F00D8C9C2 AS DateTime), 1, 10000000.0000, NULL, NULL, 33, 28, NULL, N'<p>Đàn guitar Acoustic Fender CD-60SCE Dreadnought cutaway tự hào với các tính năng bạn mong muốn trên các phiên bản đắt hơn nhiều, với mặt top thùng đàn gỗ spruce nguyên khối. Cây guitar acoustic cutaway dreadnought Đàn guitar CD-60SCE có dáng Cutaway dreadnought (hay còn gọi là dáng D khuyết). Thùng đàn lớn cho tiếng đàn to, ấm và đầy hơn, phù hợp cho các bạn chơi đệm và dùng pick. Dễ dàng sử dụng Các phím đàn trọn trịa trên mặt phím Rosewood tạo cảm giác thoải mái vô cùng, lý tưởng cho người chơi bắt đầu hoặc những người chưa có nhiều kinh nghiệm.</p>', N'<p><strong>Mặt sau và bên hông được làm từ gỗ mahogany</strong></p><p><strong>Gỗ mahogany được dùng làm mặt sau và hai bên hông đàn guitar CD-60SCE cho âm thanh rất rõ ràng. Âm thanh ấm và hợp với nhạc blues và kỹ thuật fingerpicking.</strong></p><p>&nbsp;</p><p><strong>Mặt trước đàn bằng gỗ spruce rắn chắc</strong></p><p><strong>Spruce là loại gỗ có độ bền và độ dẻo dai cao, được sử dụng rất phổ biến để làm soundboard đàn. Đặc tính của gỗ Spruce là rất cứng và nhẹ, chính vì vậy đây cũng là loại gỗ có tốc độ truyền âm thanh, độ vang rất cao, giai điệu rất rõ ràng và đầy đủ, phản ứng tốt với bất kỳ phong cách chơi acoustic nào, từ hard strumming đếm fast flatpicking hay delicate fingerpicking.</strong></p><p>&nbsp;</p><p><strong>Hệ thống pickup của Fishman</strong></p><p><strong>CD-60SCE sử dụng pick-up của Fishman với EQ 3-band với các tùy chỉnh: bass, mid, treble và một nút điều chỉnh âm lượng. Đặc biệt còn có chức năng chromatic tuner tích hợp sẵn giúp bạn giữ cây đàn đúng tông, và chromatic tuner giúp bạn dễ dàng chỉnh dây theo những tông khác nhau (Half step down, D tuning, Open E...) hơn những loại tuner thông thường. Preamp của Fishman® mang lại hiệu suất khuếch đại vô song cho cây đàn của bạn, phù hợp với những ai có nhu cầu chơi biểu diễn trên sân khấu với hệ thống âm thanh lớn.</strong></p>', NULL, CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7F00D8C9C2 AS DateTime), 3, 15, 4, 5, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (5, N'Mèo Ragdoll', N'meo-ragdoll-7.jpg', CAST(0x0000AC7F00E87B58 AS DateTime), 1, 20000000.0000, NULL, NULL, 31, 28, NULL, N'<p>Người tìm thấy Ragdoll lần đầu tiên vào thập niên 60 là Ann Baker, một chuyên gia gây giống mèo Ba Tư ở California. <strong>Mèo Ragdoll</strong> xuất hiện là do sự lai tạo phức tạp từ nhiều giống mèo khác nhau, khởi điểm là một cô mèo cái xinh xắn tên là Josephine. Sau một vụ tai nạn giao thông, Josephine phải trải qua các thí nghiệm về di truyền và dường như từ đó cấu trúc gen của cô mèo này đã bị thay đổi.</p><p>Ann Baker thấy rằng cô mèo Josephine trở nên ngoan ngoãn, dễ bảo và thân thiện hơn, cũng giỏi chịu đau hơn và cơ thể sẽ mềm nhũn khi được bế lên. Sau khi khỏi bệnh, những chú mèo mà Josephine sinh ra cũng mặc một chứng tương tự như mẹ nó đó là cơ thể khi được con người bế lên sẽ nhũn ra. Tính cách của đám mèo con cũng hiền hòa như mèo mẹ. Cũng từ đây, Ann Baker đã bắt tay vào gây giống Ragdoll Cat. Và hiệp hội <i>mèo Ragdoll</i> được thành lập và xây dựng lên nhiều tiêu chuẩn, quy định nghiêm ngặt. Sau một khoảng thời gian dài đấu tranh nhằm mục đích tìm kiếm sự thừa nhận cho Ragdoll thì đến năm 2002, giống mèo này đã được công nhận toàn thế giới là nòi mèo riêng biệt.</p><h3>Chế độ ăn cho mèo Ragdoll</h3><p>Bản tính lười nhác đã “ăn sâu trong máu” nên bạn cần để ý đến việc lựa chọn <a href="https://petmaster.vn/shop-cho-meo/thuc-an-cho-meo/">thức ăn cho mèo</a> và tập luyện của giống mèo này. Nếu những loài mèo khác mỗi bữa ăn 1 thìa hạt khô thì với Ragdoll cần tăng lên là 1.5 hoặc 2 thìa. Tuy nhiên, sau khi ăn xong từ 30 phút – 1 tiếng, bạn cần kéo chúng ngồi dậy chơi đùa hoặc cho đi dạo để tiêu hao bớt năng lượng, tránh tình trạng thừa cân.</p><p>Các loại thực phẩm dành cho <i>mèo Ragdoll</i> cũng tương tự như các loài mèo cảnh khác. Nhóm đồ ăn tươi như thịt bò, thịt gà, nội tạng động vật, rau củ quả,… đều cung cấp đầy đủ protein, chất xơ cho mèo tuy nhiên cần được chế biến kĩ càng để mèo không bị rối loạn tiêu hóa. Bạn có thể cho mèo ăn hạt khô nếu không có nhiều thời gian nấu nướng. Nhưng cách tiết kiệm nhất vẫn là tự làm pate tại nhà, rẻ mà vẫn đầy đủ chất dinh dưỡng.</p><h3>Chăm sóc lông cho mèo Ragdoll</h3><p><i>Mèo Ragdoll</i> có bộ lông dài và dày, chính vì thế việc lông rụng quanh năm là điều không thể tránh hỏi. Để hạn chế tình trạng này, bạn nên chải lông thường xuyên cho mèo 1 lần/ngày bằng lược chải chuyên dụng cho mèo. Chú ý gỡ những phần lông bết dính, bị rối tránh cho mèo liếm lông quá nhiều.</p><p>Bên cạnh đó, nên chăm chỉ tắm cho chúng mỗi tuần một lần để bộ lông luôn bóng mượt, thơm tho, loại bỏ bụi bẩn và chất rận. Nếu lười một chút thì có thể để 2 – 3 tuần tắm 1 lần. Bạn cũng có thể đem mèo ra những tiệm spa thú cưng với chi phí mỗi lần tắm từ 100.000 VNĐ. Sau khi tắm xong bạn nên sấy khô lông cho chúng, lông mèo còn ướt sẽ gây ra cảm lạnh, ho hoặc viêm phổi.<br>&nbsp;</p>', N'<p>Ragdoll có đầy đủ sự tinh tế, duyên dáng của một con mèo, nhưng lại có những nét tính cách đặc trưng của loài chó.</p><ul><li>Xếp loại: mèo cỡ lớn</li><li>Nguồn gốc: Mỹ</li><li>Mắt: màu xanh</li><li>Lông: nhiều màu trắng</li><li>Tuổi thọ: 12-15 năm</li><li>Chiều cao: 38-50 cm</li><li>Giá bán tham khảo: 12.000.000 – 20.000.000 VNĐ</li><li>Cân nặng: 4-9 kg</li><li>Đặc điểm: thân thiện, quấn chủ</li></ul><h2>Thang điểm đánh giá chung</h2><ul><li>Mức độ quấn chủ 100%</li><li>Mức độ kêu 80%</li><li>Mức độ rụng lông 60%</li><li>Mức độ mùi hôi 20%</li><li>Mức độ dễ làm đẹp 20%</li><li>Thân thiện với trẻ em 100%</li><li>Thân thiện với động vật khác 80%</li><li>Khả năng vận động 80%</li><li>Khả năng học hỏi 80%</li><li>Khả năng chịu lạnh 80%</li></ul>', NULL, CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7F00E87B58 AS DateTime), 3, 2, 3, 6, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (6, N'Xe Huyndai Palisade', N'hyundai-palisade-xe-7-cho-co-lon-tai-viet-nam-1563766660_1200x0.jpg', CAST(0x0000AC8A00E14A14 AS DateTime), 0, 650000000.0000, NULL, NULL, 47, 28, NULL, N'<p><strong>Palisade 2020</strong> là một mẫu SUV có vẻ ngoài to lớn, đồ sộ với phong cách thiết kế thiên về sự sang trọng.</p><p>Xe nhà đi được 120000 km.</p><p>Vui lòng liên hệ trước để xem xe.</p>', N'<h2><strong>Thông số kỹ thuật Hyundai Palisade 2020</strong></h2><figure class="table"><table><tbody><tr><td>Tên xe</td><td>Hyundai Palisade 2020</td></tr><tr><td>Số chỗ ngồi</td><td>08</td></tr><tr><td>Kiểu xe</td><td>SUV cỡ lớn</td></tr><tr><td>Xuất xứ</td><td>Nhập khẩu</td></tr><tr><td>Kích thước tổng thể DxRxC (mm)</td><td>4980 x 1975 x 1750</td></tr><tr><td>Chiều dài cơ sở (mm)</td><td>2900</td></tr><tr><td>Tự trọng</td><td>2030 kg</td></tr><tr><td>Động cơ</td><td>Diesel 2.2L 4 xy lanh thẳng hàng</td></tr><tr><td>Dung tích công tác</td><td>2199cc</td></tr><tr><td>Công suất tối đa</td><td>197 mã lực tại 3800 vòng/phút</td></tr><tr><td>Mô men xoắn cực đại</td><td>441 Nm tại 1750-2750 vòng/phút</td></tr><tr><td>Hộp số</td><td>Tự động 8 cấp</td></tr><tr><td>Hệ dẫn động</td><td>2 bánh hoặc 4 bánh HTRAC</td></tr><tr><td>Khoảng sáng gầm xe (mm)</td><td>225</td></tr><tr><td>Cỡ mâm</td><td>18 inch, tuỳ chọn 20 inch</td></tr></tbody></table></figure>', NULL, CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC8A00E14A14 AS DateTime), 7, 6, 1, 7, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (7, N'Xe Innova 7 chỗ ', N'Ve-mua-o-to-cho-xe-toyota-innova-1.jpg', CAST(0x0000AC8A00E1DD82 AS DateTime), 1, 500000000.0000, NULL, NULL, 37, 28, NULL, N'<h2>Liên hệ báo giá xe + kèm theo ưu đãi mới nhất</h2><p>Mọi thắc mắc cũng như giải đáp, qúy khách hàng vui lòng gọi với chúng tôi qua số hotline dưới góc màn hình.</p>', N'<h3>Innova số tự động</h3><figure class="table"><table><tbody><tr><td>&nbsp;</td><td><strong>Innova 2.0 V</strong></td><td><strong>Innova Venturer</strong></td><td><strong>Innova 2.0 G</strong></td></tr><tr><td>D x R x C</td><td>4735 x 1830 x 1795</td><td>4735x1830x1795</td><td>4735 x 1830 x 1795</td></tr><tr><td>Chiều dài cơ sở</td><td>2750</td><td>2750</td><td>2750</td></tr><tr><td>Chiều rộng cơ sở (Trước/ sau)</td><td>1540 x 1540</td><td>1540/1540</td><td>1540 x 1540</td></tr><tr><td>Khoảng sáng gầm xe</td><td>178</td><td>178</td><td>178</td></tr><tr><td>Góc thoát (Trước/ sau)</td><td>21/ 25</td><td>21/25</td><td>21/25</td></tr><tr><td>Bán kính vòng quay tối thiểu</td><td>5,4</td><td>5.4</td><td>5,4</td></tr><tr><td>Trọng lượng không tải</td><td>1755</td><td>1725</td><td>1720-1725</td></tr><tr><td>Trọng lượng toàn tải</td><td>2330</td><td>2360</td><td>2370</td></tr><tr><td>Loại động cơ</td><td>Động cơ xăng, VVT-i kép, 4 xy lanh thẳng hàng, 16 van DOHC</td><td>Động cơ xăng, VVT-i kép, 4 xy lanh thẳng hàng, 16 van DOHC</td><td>Động cơ xăng, VVT-i kép, 4 xy lanh thẳng hàng, 16 van DOHC</td></tr><tr><td>Dung tích công tác</td><td>1998</td><td>1998</td><td>1998</td></tr><tr><td>Công suất tối đa</td><td>102 / 5600</td><td>102/5600</td><td>102 / 5600</td></tr><tr><td>Mô men xoắn tối đa</td><td>183 / 4000</td><td>183/4000</td><td>183 / 4000</td></tr><tr><td>Dung tích bình nhiên liệu</td><td>55</td><td>55</td><td>55</td></tr><tr><td>&nbsp;</td><td>Euro 4</td><td>Euro 4</td><td>Euro 4</td></tr><tr><td>&nbsp;</td><td>Tự động 6 cấp</td><td>Tự động 6 cấp</td><td>Tự động 6 cấp</td></tr><tr><td>Trước</td><td>Tay đòn kép, lò xo cuộn và thanh cân bằng</td><td>Tay đòn kép, lò xo cuộn và thanh cân bằng</td><td>Tay đòn kép, lò xo cuộn và thanh cân bằng</td></tr><tr><td>Sau</td><td>Liên kết 4 điểm, lò xo cuộn và tay đòn bên</td><td>Liên kết 4 điểm, lò xo cuộn và tay đòn bên</td><td>Liên kết 4 điểm, lò xo cuộn và tay đòn bên</td></tr><tr><td>Loại vành</td><td>Mâm đúc</td><td>Mâm đúc màu đen</td><td>Mâm đúc</td></tr><tr><td>Kích thước lốp</td><td>215/55R17</td><td>205/65R16</td><td>205/65R16</td></tr><tr><td>Trước</td><td>Đĩa thông gió</td><td>Đĩa thông gió</td><td>Đĩa thông gió</td></tr><tr><td>Sau</td><td>Tang trống</td><td>Tang trống</td><td>Tang trống</td></tr><tr><td>Trong đô thị</td><td>11.4</td><td>–</td><td>–</td></tr><tr><td>Ngoài đô thị</td><td>7.8</td><td>–</td><td>–</td></tr><tr><td>Kết hợp</td><td>9.1</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>Đèn chiếu gần</td><td>LED, dạng thấu kính</td><td>Halogen, phản xạ đã chiều</td><td>Halogen phản xạ đa chiều</td></tr><tr><td>Đèn chiếu xa</td><td>Halogen, phản xạ đa chiều</td><td>Halogen, phản xạ đã chiều</td><td>Halogen phản xạ đa chiều</td></tr><tr><td>Hệ thống điều khiển đèn tự động</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>Hệ thống điều chỉnh góc chiếu</td><td>Tự động</td><td>Chỉnh tay</td><td>Chỉnh tay</td></tr><tr><td>Chế độ đèn chờ dẫn đường</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;</td><td>Bóng đèn thường</td><td>Bóng đèn thường</td><td>Bóng đèn thường</td></tr><tr><td>&nbsp;</td><td>LED</td><td>LED</td><td>LED</td></tr><tr><td>Trước</td><td>Có</td><td>Có (Màu MLM)</td><td>Có</td></tr><tr><td>Chức năng điều chỉnh điện</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Chức năng gập điện</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Tích hợp đèn báo rẽ</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Mạ Crôm</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;</td><td>Gián đoạn, điều chỉnh thời gian</td><td>Gián đoạn, điều chỉnh thời gian</td><td>Gián đoạn, điều chỉnh thời gian</td></tr><tr><td>&nbsp;</td><td>Dạng vây cá</td><td>Dạng vây cá</td><td>Dạng vây cá</td></tr><tr><td>&nbsp;</td><td>Mạ crôm</td><td>Cùng màu thân xe</td><td>Cùng màu thân xe</td></tr><tr><td>&nbsp;</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Loại tay lái</td><td>3 chấu, bọc da, ốp gỗ, mạ bạc</td><td>3 chấu, bọc da, ốp gỗ, mạc bạc</td><td>3 chấu, urethane, mạ bạc</td></tr><tr><td>Chất liệu</td><td>Da</td><td>Da</td><td>Urethane</td></tr><tr><td>Nút bấm điều khiển tích hợp</td><td>Hệ thống âm thanh, điện thoại rảnh tay, màn hình hiển thị đa thông tin</td><td>Hệ thống âm thanh, điện thoại rảnh tay, màn hình hiển thị đa thông tin</td><td>Hệ thống âm thanh, điện thoại rảnh tay, màn hình hiển thị đa thông tin</td></tr><tr><td>Điều chỉnh</td><td>Chỉnh tay 4 hướng</td><td>Chỉnh tay 4 hướng</td><td>Chỉnh tay 4 hướng</td></tr><tr><td>Trợ lực lái</td><td>Thủy lực</td><td>Thủy lực</td><td>Thủy lực</td></tr><tr><td>&nbsp;</td><td>2 chế độ ngày &amp; đêm</td><td>2 chế độ ngày/đêm</td><td>2 chế độ ngày &amp; đêm</td></tr><tr><td>&nbsp;</td><td>Ốp gỗ, viền trang trí mạ bạc</td><td>Ốp gỗ, viền trang trí mạ bạc</td><td>Viền trang trí mạ bạc</td></tr><tr><td>&nbsp;</td><td>Mạ crôm</td><td>Mạ Crôm</td><td>Mạ crôm</td></tr><tr><td>Loại đồng hồ</td><td>Optitron</td><td>Optitron</td><td>Optitron</td></tr><tr><td>Đèn báo chế độ Eco</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Chức năng báo lượng tiêu thụ nhiên liệu</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Chức năng báo vị trí cần số</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Màn hình hiển thị đa thông tin</td><td>Màn hình TFT 4.2-inch</td><td>Màn hình TFT 4.2 inch</td><td>Màn hình TFT 4.2-inch</td></tr><tr><td>&nbsp;</td><td>Da</td><td>Nỉ cao cấp</td><td>Nỉ cao cấp</td></tr><tr><td>Loại ghế</td><td>Loại thường</td><td>Loại thường</td><td>Loại thường</td></tr><tr><td>Điều chỉnh ghế lái</td><td>Chỉnh điện 8 hướng</td><td>Chỉnh cơ 6 hướng</td><td>Chỉnh tay 6 hướng</td></tr><tr><td>Điều chỉnh ghế hành khách</td><td>Chỉnh tay 4 hướng</td><td>Chỉnh cơ 4 hướng</td><td>Chỉnh tay 4 hướng</td></tr><tr><td>Hàng ghế thứ hai</td><td>Ghế rời, chỉnh cơ 4 hướng, có tựa tay</td><td>Gập 60:40, chỉnh cơ 4 hướng</td><td>Gập 60:40, chỉnh cơ 4 hướng</td></tr><tr><td>Hàng ghế thứ ba</td><td>Ngả lưng ghế, gấp 50:50, gập sang 2 bên</td><td>Ngả lưng ghế, gập 50:50, gập sang 2 bên</td><td>Ngả lưng ghế, gấp 50:50, gập sang 2 bên</td></tr><tr><td>Tựa tay hàng ghế thứ hai</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;Hệ thống điều hòa</td><td>2 dàn lạnh, tự động</td><td>2 dàn lạnh, tự động</td><td>2 dàn lạnh, tự động</td></tr><tr><td>Cửa gió sau</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Loại loa</td><td>Loại thường</td><td>Loại thường</td><td>Loại thường</td></tr><tr><td>Đầu đĩa</td><td>DVD 1 đĩa, màn hình cảm ứng 7 inch</td><td>DVD 1 đĩa, màn hình cảm ứng 7 inch</td><td>DVD 1 đĩa, màn hình cảm ứng 7 inch</td></tr><tr><td>Số loa</td><td>6</td><td>6</td><td>6</td></tr><tr><td>Cổng kết nối AUX</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Cổng kết nối USB</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Đầu đọc thẻ</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>Kết nối Bluetooth</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống điều khiển bằng giọng nói</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>&nbsp;</td><td>Có, một chạm, chống kẹt tất cả các cửa</td><td>Có, một chạm cho tất cả các cửa, chống kẹt (phía người lái)</td><td>Có, một chạm, chống kẹt (phía người lái)</td></tr><tr><td>&nbsp;</td><td>Chế độ Eco và chế độ Power</td><td>Chế độ tiết kiệm và công suất cao</td><td>Chế độ Eco và chế độ Power</td></tr><tr><td>&nbsp;</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống chống bó cứng phanh</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống hỗ trợ lực phanh khẩn cấp</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống phân phối lực phanh điện tử</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống cân bằng điện tử</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống kiểm soát lực kéo</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống hỗ trợ khởi hành ngang dốc</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Đèn báo phanh khẩn cấp</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Camera lùi</td><td>Có</td><td>Không</td><td>Không</td></tr><tr><td>&nbsp;Cảm biến Sau</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Túi khí người lái &amp; hành khách phía trước</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Túi khí bên hông phía trước</td><td>Có</td><td>Có</td><td>Không</td></tr><tr><td>Túi khí rèm</td><td>Có</td><td>Có</td><td>Không</td></tr><tr><td>Túi khí đầu gối người lái</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Dây đai an toàn</td><td>3 điểm (7 vị trí)</td><td>3 điểm (8 vị trí)</td><td>3 điểm (8 vị trí)</td></tr><tr><td>&nbsp;Cột lái tự đổ</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Ghế có cấu trúc giảm chấn thương cổ</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống báo động</td><td>Có</td><td>Có</td><td>Có</td></tr><tr><td>Hệ thống mã hóa khóa động cơ</td><td>Có</td><td>Có</td><td>Có</td></tr></tbody></table></figure>', NULL, CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC8A00E1DD82 AS DateTime), 7, 6, 1, 3, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (8, N'SamSung J7pro', N'ThuCung.jpg', CAST(0x0000AC7F010376B7 AS DateTime), 1, 3000000.0000, NULL, NULL, 31, 28, NULL, N'<p>Chó săn vịt là một giống chó săn dùng để săn các loại thủy cầm trong đó chủ yếu là vịt. Ngày nay giống chó này được lai tạo để trở thành dòng chó cảnh. Tên "Poodle" của chúng xuất phát từ chữ "Pudel" trong tiếng Đức, nghĩa là "thợ lặn" hay là "chó lội nước" và bộ lông của chúng có thể đè bẹp cơ thể khi ở trong nước.</p>', N'<p>CÁC LƯU Ý KHI NUÔI CHÓ POODLE – Chó Poodle 2 tháng tuổi đã cai sữa mẹ và đang ở giai đoạn tập ăn, hệ tiêu hóa vẫn còn chưa phát triển toàn diện nên cần 1 chế độ ăn uống hợp lý. – Nên cho chó ăn 2 lần/ngày, đảm bảo bữa ăn đầy đủ các chất dinh dưỡng. Đối với Poodle size Standard cần 1,5 – 3 chén thức ăn khô mỗi ngày; Mini Poodle thì cần ¾ – 1 chén; Toy Poodle có kích thước khá nhỏ thì chỉ cần ¼ – ½ chén mỗi ngày. Đặc biệt nên chú ý cho chó ăn đúng bữa, đúng tiêu chuẩn để kiểm soát cân nặng, tránh những vấn đề sức khỏe xấu có thể xảy ra. – Dù là giống chó nhỏ, không cần không gian quá rộng lớn, nhưng bạn cần để chó vui chơi thoải mái. Nên đưa chúng ra ngoài đi dạo, chơi đùa và vận động thể lực thường xuyên. LƯU Ý KHI HUẤN LUYỆN - Cần phải huấn luyện Poodle ngay từ khi còn nhỏ để sớm hình thành những thói quen tốt cho chúng. Thời gian và cách thức huấn luyện cần được lên lịch bài bản và hợp lý. Tốt nhất là dạy chó vào buổi sáng hoặc chiều, duy trì khoảng 25 phút mỗi ngày. Dạy từ dễ đến khó, tránh để chó phải hoạt động quá sức. - Khi ra lệnh huấn luyện phải ngắn gọn, rõ ràng, dứt khoát. Các bài tập nên dãn cách từ 25 – 30 giây để chó có thời gian nghe hiểu và thực hiện. Tránh dạy dồn dập và ra các lệnh quá khó làm chó không hiểu được. - Thái độ huấn luyện cần cương quyết nhưng phải kiên nhẫn, không nên quát mắng hay làm chó sợ hãi. Mỗi lần chó hoàn thành bài tập, cần khen thưởng bằng đồ ăn hay vuốt ve chúng.</p>', NULL, CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC7F010376B7 AS DateTime), 3, 1, 1, 1, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (9, N'Xe Camry 2.4G 2009', N'932-216-toyota-camry-2009.jpg', CAST(0x0000AC8A00E36793 AS DateTime), 1, 450000000.0000, NULL, NULL, 6, 28, NULL, N'<p>Toyota Camry màu bạc, số tự động, máy 2.4 sản xuất 2009, biển HN, xe zin nguyên còn tốt.<br>Trang bị: cảm biến xung quanh xe, điều hòa tự động, volang tích hợp, ghế chỉnh điện, màn hình, xi nhan gương,...<br>Cam kết không đâm đụng ngập nước</p>', N'<h3><strong>Thông số cơ bản</strong></h3><p>&nbsp; Xuất xứ:Lắp ráp trong nước</p><p>&nbsp; Tình trạng:Xe đã dùng</p><p>&nbsp; Dòng xe:Sedan</p><p>&nbsp; Số Km đã đi:0 Km</p><p>&nbsp; Màu ngoại thất:Đen</p><p>&nbsp; Màu nội thất:</p><p>&nbsp; Số cửa:4 cửa</p><p>&nbsp; Số chỗ ngồi:5 chỗ</p><h3><strong>Nhiên liệu - động cơ</strong></h3><p>&nbsp; Động cơ:Xăng 2.4 L</p><p>&nbsp; Hệ thống nạp nhiên liệu:</p><h3><strong>Hộp số chuyển động</strong></h3><p>&nbsp; Hộp số:Số tự động</p><p>&nbsp; Dẫn động:FWD - Dẫn động cầu trước</p><p>&nbsp; Tiêu thụ nhiên liệu:L/100Km</p>', NULL, CAST(0x0000AC5200000000 AS DateTime), CAST(0x0000AC8A00E36793 AS DateTime), 7, 6, 1, 3, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (14, N'SamsungJ7 Pro', N'samsung_galaxy_j7_pro.jpg', CAST(0x0000AC8A00E3CAE6 AS DateTime), 1, 7000000.0000, NULL, NULL, 293, 1, NULL, N'<p>Không có</p>', N'<h4><strong>Thông số kỹ thuật chi tiết Điện thoại Samsung Galaxy J7 Pro</strong></h4><p>Màn hình.</p><p>Công nghệ màn hình:Super AMOLED.</p><p>Độ phân giải:Full HD (1080 x 1920 Pixels)</p><p>Màn hình rộng:5.5"</p><p>Mặt kính cảm ứng:Kính cường lực Corning Gorilla Glass 4.</p><p>Độ phân giải:13 MP.</p><p>Quay phim:Có quay phim.</p><p>Đèn Flash:Có</p>', NULL, CAST(0x0000AC6C015F9CE4 AS DateTime), CAST(0x0000AC8A00E3CAE6 AS DateTime), 3, 8, 2, 2, 0)
INSERT [dbo].[Product] ([Product_ID], [Product_Name], [Product_Img], [Product_DateSubmit], [Product_Activate], [Product_Price], [Product_SalePrice], [Product_Ship], [Product_View], [Product_Love], [Product_Amount], [Product_Description], [Product_Detail], [Product_Option], [Product_DateCreate], [Product_DateEdit], [User_ID], [SubCategory_ID], [Category_ID], [SubProduct_ID], [Product_Bin]) VALUES (15, N'Mèo Lông Ngắn (Đen)', N'meo-anh-long-ngan2.jpg', CAST(0x0000AC8300DA4C02 AS DateTime), 1, 6500000.0000, NULL, NULL, 57, 0, NULL, N'<h2>Nguồn gốc của mèo Anh lông ngắn</h2><p>Cái tên của loài mèo này đã nói lên quê hương chúng rồi, đó là vương quốc Anh xinh đẹp. Chúng xuất hiện vào khoảng 100 năm TCN. Qua nhiều quá trình lai tạo giống mèo Ai Cập và giống mèo bản địa Anh, thêm với giống mèo Ba Tư, mèo Anh mà chúng ta nhìn thấy ngày nay vô cùng đáng yêu, xinh đẹp.</p><p>Với những phẩm chất cũng đáng yêu</p>', N'<p><strong>Aln</strong> tỏ ra vô cùng dễ tính trong ăn uống, chủ nhân cho ăn gì là sẽ ăn ngon lành, từ thức hạt chế biến sẵn cho đến đồ tự nấu. Tuy nhiên, cần xây dựng một thực đơn ăn uống khoa học, cung cấp đầy đủ chất dinh dưỡng có lợi cho sự phát triển của mèo như: protein (có trong thịt, cá), rau kèm 1 miếng pate hoặc phô mai – món ăn khoái khẩu, nên nhớ là luôn luôn kết hợp với nước uống sạch sẽ đảm bảo mèo đủ uống cả ngày nhé!</p><p>Chia nhỏ bữa ăn theo từng độ tuổi phát triển.&nbsp;</p><ul><li>2 – 3 tháng tuổi, cho chúng ăn 4 – 5 bữa nhỏ/ ngày, nên ăn cháo thịt xay nhuyễn.</li><li>3 – 5 tháng tuổi: tăng lượng thức ăn mỗi bữa, nhưng giảm thành 3 bữa mỗi ngày.</li><li>Giai đoạn trưởng thành thì Aln chỉ cần ăn 2 bữa lớn là đủ.</li></ul><p>Chớ nên cho <strong>mèo Anh lông ngắn</strong> ăn quá nhiều tinh bột, những đồ ăn chứa nhiều chất béo, đồ dầu mỡ, chocolate bởi chúng sẽ không hấp thụ được hết, dễ béo phì bởi ít vận động.</p>', NULL, CAST(0x0000AC7F0100B918 AS DateTime), CAST(0x0000AC8300DA4C02 AS DateTime), 3, 2, 3, 6, 0)
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

INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (1, CAST(0x0000AC7700000000 AS DateTime), N'alo', 1, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (2, CAST(0x0000AC7700000000 AS DateTime), N'alo', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (3, CAST(0x0000AC7700000000 AS DateTime), N'alo', 1, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (4, CAST(0x0000AC7700000000 AS DateTime), N'alo', 1, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (5, CAST(0x0000AC7700D2E163 AS DateTime), N'dâdadadad', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (6, CAST(0x0000AC7700D51B2C AS DateTime), N'âdadadadada', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (7, CAST(0x0000AC7700D59006 AS DateTime), N'adadadada', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (8, CAST(0x0000AC7700D6854B AS DateTime), N'test', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (9, CAST(0x0000AC7700D9D61E AS DateTime), N'ưdadadadadaadad', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (10, CAST(0x0000AC7700DCB5DE AS DateTime), N'sadadadaaddaa', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (11, CAST(0x0000AC7700DFBE7C AS DateTime), N'addasdadaddadada', 1, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (12, CAST(0x0000AC7700E04A7C AS DateTime), N'ssss', 10, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (13, CAST(0x0000AC7700E60F60 AS DateTime), N'1', 10, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (14, CAST(0x0000AC7700E645FB AS DateTime), N's', 10, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (15, CAST(0x0000AC7700E66345 AS DateTime), N'd', 10, 3)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (16, CAST(0x0000AC7700E7FD5C AS DateTime), N'sdaadada', 9, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (17, CAST(0x0000AC7700E8091E AS DateTime), N'adadadaadass', 9, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (18, CAST(0x0000AC7700E9A7AA AS DateTime), N'Tessssssss', 1, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (19, CAST(0x0000AC7700E9B523 AS DateTime), N'ádadsdadfdadad', 2, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (20, CAST(0x0000AC7700EA988A AS DateTime), N'ádadadsaddas', 10, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (21, CAST(0x0000AC7700EAA254 AS DateTime), N's', 14, 7)
INSERT [dbo].[RepLi] ([Repli_ID], [Repli_DateCreate], [Repli_Content], [Comment_ID], [User_ID]) VALUES (22, CAST(0x0000AC7700EAACD0 AS DateTime), N'sai', 14, 7)
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

INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (1, N'Máy Tính Bảng', N'184980.jpg', CAST(0x0000AC5E00000000 AS DateTime), CAST(0x0000AC6400941644 AS DateTime), 1, 2)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (2, N'Mèo', N'meo.jpg', CAST(0x0000AC5E00000000 AS DateTime), CAST(0x0000AC6400978B5D AS DateTime), 1, 3)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (3, N'Gà', N'gà.png', CAST(0x0000AC5E00000000 AS DateTime), CAST(0x0000AC6400980403 AS DateTime), 1, 3)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (4, N'Cá', N'184980.jpg', CAST(0x0000AC5E00000000 AS DateTime), CAST(0x0000AC64009DAFE4 AS DateTime), 1, 3)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (5, N'Cá Sấu', N'184980.jpg', CAST(0x0000AC5E00000000 AS DateTime), CAST(0x0000AC64009E4351 AS DateTime), 1, 3)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (6, N'Xe Hơi', N'184980.jpg', CAST(0x0000AC5E00000000 AS DateTime), CAST(0x0000AC5E00000000 AS DateTime), 1, 1)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (7, N'Xe Máy', N'184980.jpg', CAST(0x0000AC5E00000000 AS DateTime), CAST(0x0000AC64009E5078 AS DateTime), 1, 1)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (8, N'Điện Thoại', N'184980.jpg', CAST(0x0000AC5E00000000 AS DateTime), CAST(0x0000AC64009E5E32 AS DateTime), 1, 2)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (9, N'Máy Tính', N'184980.jpg', CAST(0x0000AC5E00000000 AS DateTime), CAST(0x0000AC64009E69D6 AS DateTime), 1, 2)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (14, N'Chó', N'184980.jpg', CAST(0x0000AC5E00000000 AS DateTime), CAST(0x0000AC5E00000000 AS DateTime), 1, 3)
INSERT [dbo].[SubCategory] ([SubCategory_ID], [SubCategory_Name], [SubCategory_Img], [SubCategory_DateCreate], [SubCategory_DateEdit], [SubCategory_Activate], [Category_ID]) VALUES (15, N'Đàn', N'015-electric-guitar.svg', CAST(0x0000AC7D00963E31 AS DateTime), CAST(0x0000AC7D00963E31 AS DateTime), 1, 4)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[SubProduct] ON 

INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (1, 1, N'Lenovo')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (2, 8, N'SamSung')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (3, 6, N'Toyota')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (4, 14, N'Chó Poodle')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (5, 15, N'Guitar')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (6, 2, N'Mèo Anh')
INSERT [dbo].[SubProduct] ([SubProduct_ID], [SubCategory_ID], [SubProduct_Name]) VALUES (7, 6, N'Huyndai')
SET IDENTITY_INSERT [dbo].[SubProduct] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [User_LastName], [User_Name], [User_Token], [User_Activate], [User_Pass], [User_Email], [User_Phone], [User_Role], [User_LinkF], [User_Img], [User_DateCreate], [User_DateLogin], [User_DateBirth], [User_Sex], [User_Address], [Province_ID], [City_ID]) VALUES (3, N'Nguyễn Trần ', N'Phương Vy', N'9f3dfa9a-52a9-4b05-ad8e-c42bdd9b844d', 1, N'Phuongvy99^^', N'phuongvy99@gmail.com', N'0364338950', 0, N'https://www.facebook.com/voinguyen1999', N'304d41541f45f1c886b2c64762a4e6a8.jpg', CAST(0x0000AC5E01504C11 AS DateTime), CAST(0x0000AC8B00C75EEF AS DateTime), CAST(0x45230B00 AS Date), 1, N'Số 14, Đường số 9, Hiệp Thành', 10, 3)
INSERT [dbo].[User] ([User_ID], [User_LastName], [User_Name], [User_Token], [User_Activate], [User_Pass], [User_Email], [User_Phone], [User_Role], [User_LinkF], [User_Img], [User_DateCreate], [User_DateLogin], [User_DateBirth], [User_Sex], [User_Address], [Province_ID], [City_ID]) VALUES (7, N'Nguyễn', N'Vy', N'e162247e-1561-4572-b0b4-77de3b8ea396', 1, N'Phuongvy99&&', N'vy@gmail.com', N'0364338950', 0, N'https://www.facebook.com/voinguyen1999', N'hinh-nen-pokemon-cho-may-tinh_035415126.jpg', CAST(0x0000AC5E01504C11 AS DateTime), CAST(0x0000AC8B00C5CBAA AS DateTime), CAST(0x45230B00 AS Date), 2, N'Số 14, Đường số 9', 1, 1)
INSERT [dbo].[User] ([User_ID], [User_LastName], [User_Name], [User_Token], [User_Activate], [User_Pass], [User_Email], [User_Phone], [User_Role], [User_LinkF], [User_Img], [User_DateCreate], [User_DateLogin], [User_DateBirth], [User_Sex], [User_Address], [Province_ID], [City_ID]) VALUES (8, N'Hoàng Mai', N'Cương', N'eab277e9-51f8-4f52-a02d-b4ba9c1fb57d', 1, N'Cuong@123', N'cuong@123', N'0364338950', 0, N'https://www.facebook.com/voinguyen1999', N'download.jfif', CAST(0x0000AC5E01504C11 AS DateTime), CAST(0x0000AC8E00EDABF9 AS DateTime), CAST(0x45230B00 AS Date), 1, N'Số 14, Đường số 9', 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Views] ON 

INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (9, 14, 3, CAST(0x0000AC6F00B47F5B AS DateTime), 1)
INSERT [dbo].[Views] ([View_ID], [Product_ID], [User_ID], [View_Date], [View_Bin]) VALUES (13, 6, 3, CAST(0x0000AC7F00D4B4D2 AS DateTime), 0)
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
