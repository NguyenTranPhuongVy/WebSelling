USE [master]
GO
/****** Object:  Database [WebSelling]    Script Date: 09/15/2020 09:41:16 AM ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 09/15/2020 09:41:16 AM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 09/15/2020 09:41:16 AM ******/
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
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Cart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 09/15/2020 09:41:16 AM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 09/15/2020 09:41:16 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 09/15/2020 09:41:16 AM ******/
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
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Repli]    Script Date: 09/15/2020 09:41:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repli](
	[Repli_ID] [int] IDENTITY(1,1) NOT NULL,
	[Repli_DateCreate] [datetime] NULL,
	[Repli_Content] [nvarchar](max) NULL,
	[Comment_ID] [int] NULL,
	[User_ID] [int] NULL,
 CONSTRAINT [PK_Repli] PRIMARY KEY CLUSTERED 
(
	[Repli_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 09/15/2020 09:41:16 AM ******/
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
/****** Object:  Table [dbo].[SubProduct]    Script Date: 09/15/2020 09:41:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubProduct](
	[SubProduct_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[SubCategory_ID] [int] NULL,
 CONSTRAINT [PK_SubProduct] PRIMARY KEY CLUSTERED 
(
	[SubProduct_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 09/15/2020 09:41:16 AM ******/
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
	[User_Province] [nvarchar](300) NULL,
	[User_City] [nvarchar](300) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
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
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
ALTER TABLE [dbo].[Repli]  WITH CHECK ADD  CONSTRAINT [FK_Repli_Comment] FOREIGN KEY([Comment_ID])
REFERENCES [dbo].[Comment] ([Comment_ID])
GO
ALTER TABLE [dbo].[Repli] CHECK CONSTRAINT [FK_Repli_Comment]
GO
ALTER TABLE [dbo].[Repli]  WITH CHECK ADD  CONSTRAINT [FK_Repli_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Repli] CHECK CONSTRAINT [FK_Repli_User]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
ALTER TABLE [dbo].[SubProduct]  WITH CHECK ADD  CONSTRAINT [FK_SubProduct_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[SubProduct] CHECK CONSTRAINT [FK_SubProduct_Product]
GO
ALTER TABLE [dbo].[SubProduct]  WITH CHECK ADD  CONSTRAINT [FK_SubProduct_SubCategory] FOREIGN KEY([SubCategory_ID])
REFERENCES [dbo].[SubCategory] ([SubCategory_ID])
GO
ALTER TABLE [dbo].[SubProduct] CHECK CONSTRAINT [FK_SubProduct_SubCategory]
GO
USE [master]
GO
ALTER DATABASE [WebSelling] SET  READ_WRITE 
GO
