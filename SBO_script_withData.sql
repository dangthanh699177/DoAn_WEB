USE [master]
GO
/****** Object:  Database [Shopping_Bonsai_online]    Script Date: 5/12/2019 5:40:10 PM ******/
CREATE DATABASE [Shopping_Bonsai_online]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shopping_Bonsai_online', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Shopping_Bonsai_online.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Shopping_Bonsai_online_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Shopping_Bonsai_online_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Shopping_Bonsai_online] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopping_Bonsai_online].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopping_Bonsai_online] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET RECOVERY FULL 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET  MULTI_USER 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopping_Bonsai_online] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Shopping_Bonsai_online] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shopping_Bonsai_online', N'ON'
GO
USE [Shopping_Bonsai_online]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/12/2019 5:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[personRefId] [int] NULL,
	[totalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 5/12/2019 5:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[personRefId] [int] NULL,
	[title] [nvarchar](100) NULL,
	[message] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ordered]    Script Date: 5/12/2019 5:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordered](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[personRefId] [int] NULL,
	[dateOfBought] [datetime] NULL,
	[totalPrice] [float] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 5/12/2019 5:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](255) NULL,
	[lastName] [nvarchar](255) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](1000) NULL,
	[isAddmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/12/2019 5:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[type] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[producer] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductInCart]    Script Date: 5/12/2019 5:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInCart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productRefId] [int] NULL,
	[count] [int] NULL,
	[totalPrice] [float] NULL,
	[cartRefId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductInOrdered]    Script Date: 5/12/2019 5:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInOrdered](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productRefId] [int] NULL,
	[count] [int] NULL,
	[totalPrice] [float] NULL,
	[orderedRefId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([id], [personRefId], [totalPrice]) VALUES (1, 1, NULL)
INSERT [dbo].[Cart] ([id], [personRefId], [totalPrice]) VALUES (2, 2, NULL)
INSERT [dbo].[Cart] ([id], [personRefId], [totalPrice]) VALUES (3, 3, NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Ordered] ON 

INSERT [dbo].[Ordered] ([id], [personRefId], [dateOfBought], [totalPrice], [status]) VALUES (1, 3, CAST(N'2019-05-08 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Ordered] ([id], [personRefId], [dateOfBought], [totalPrice], [status]) VALUES (2, 2, CAST(N'2019-05-09 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Ordered] ([id], [personRefId], [dateOfBought], [totalPrice], [status]) VALUES (3, 1, CAST(N'2019-05-10 00:00:00.000' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Ordered] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([id], [firstName], [lastName], [phone], [email], [address], [username], [password], [isAddmin]) VALUES (1, N'Dang', N'Huynh', N'0327590960', N'huynhthanhdang77@gmail.com', N'18/8 Phan Văn Trị, phường 2, quận 5, TP.HCM', N'danght', N'bd778af79f7f45da5bebd55a186618e1672bce92', 1)
INSERT [dbo].[Person] ([id], [firstName], [lastName], [phone], [email], [address], [username], [password], [isAddmin]) VALUES (2, N'Tuan', N'Huynh', N'1234567890', N'Huynh Tuan', N'123 Nguyễn Văn Cừ, Quận 5', N'user001', N'f5d62fe7ccb8943e53ecb816aaa5a844ff98df27', 0)
INSERT [dbo].[Person] ([id], [firstName], [lastName], [phone], [email], [address], [username], [password], [isAddmin]) VALUES (3, N'Liem', N'Ly', N'0909432767', N'Ly Thanh Liem', N'227 Nguyễn Cư Trinh, quận 1', N'user002', N'0f7c6efb513f7e915868472e49146ecacbbb234d', 0)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [type], [status], [producer]) VALUES (1, N'Sen Đá Lá Thơm', 39, N'Cây cảnh sen đá', 1, N'NPP001')
INSERT [dbo].[Product] ([id], [name], [price], [type], [status], [producer]) VALUES (2, N'Sen Đá Thược Dược', 39, N'Cây cảnh sen đá', 1, N'NPP001')
INSERT [dbo].[Product] ([id], [name], [price], [type], [status], [producer]) VALUES (3, N'Sen Đá Nhím Đen', 49, N'Cây cảnh sen đá', 1, N'NPP002')
INSERT [dbo].[Product] ([id], [name], [price], [type], [status], [producer]) VALUES (4, N'Sen Đá Cánh Bướm Xanh', 49, N'Cây cảnh sen đá', 1, N'NPP002')
INSERT [dbo].[Product] ([id], [name], [price], [type], [status], [producer]) VALUES (5, N'Sen Đá Mặt Trăng', 49, N'Cây cảnh sen đá', 1, N'NPP001')
INSERT [dbo].[Product] ([id], [name], [price], [type], [status], [producer]) VALUES (6, N'Sen Đá Cỏ Ngọc', 39, N'Cây cảnh sen đá', 1, N'NPP003')
INSERT [dbo].[Product] ([id], [name], [price], [type], [status], [producer]) VALUES (7, N'Cây Tùng La Hán', 159, N'Cây cảnh phong thủy', 1, N'NPP003')
INSERT [dbo].[Product] ([id], [name], [price], [type], [status], [producer]) VALUES (8, N'Cây Hạnh Phúc', 219, N'Cây cảnh phong thủy', 1, N'NPP003')
INSERT [dbo].[Product] ([id], [name], [price], [type], [status], [producer]) VALUES (9, N'Cây Trầu Bà Đế Vương Xanh', 149, N'Cây cảnh phong thủy', 1, N'NPP004')
INSERT [dbo].[Product] ([id], [name], [price], [type], [status], [producer]) VALUES (10, N'Cây Trường Sinh', 499, N'Cây cảnh phong thủy', 1, N'NPP004')
INSERT [dbo].[Product] ([id], [name], [price], [type], [status], [producer]) VALUES (11, N'Cây Thường Xuân', 149, N'Cây cảnh phong thủy', 1, N'NPP004')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductInCart] ON 

INSERT [dbo].[ProductInCart] ([id], [productRefId], [count], [totalPrice], [cartRefId]) VALUES (1, 1, 2, 78, 3)
INSERT [dbo].[ProductInCart] ([id], [productRefId], [count], [totalPrice], [cartRefId]) VALUES (2, 2, 1, 39, 3)
INSERT [dbo].[ProductInCart] ([id], [productRefId], [count], [totalPrice], [cartRefId]) VALUES (3, 11, 1, 149, 3)
INSERT [dbo].[ProductInCart] ([id], [productRefId], [count], [totalPrice], [cartRefId]) VALUES (5, 4, 1, 98, 1)
INSERT [dbo].[ProductInCart] ([id], [productRefId], [count], [totalPrice], [cartRefId]) VALUES (6, 7, 1, 159, 1)
INSERT [dbo].[ProductInCart] ([id], [productRefId], [count], [totalPrice], [cartRefId]) VALUES (7, 10, 2, 998, 2)
SET IDENTITY_INSERT [dbo].[ProductInCart] OFF
SET IDENTITY_INSERT [dbo].[ProductInOrdered] ON 

INSERT [dbo].[ProductInOrdered] ([id], [productRefId], [count], [totalPrice], [orderedRefId]) VALUES (1, 1, 2, 78, 1)
INSERT [dbo].[ProductInOrdered] ([id], [productRefId], [count], [totalPrice], [orderedRefId]) VALUES (4, 2, 1, 39, 1)
INSERT [dbo].[ProductInOrdered] ([id], [productRefId], [count], [totalPrice], [orderedRefId]) VALUES (5, 11, 1, 149, 1)
INSERT [dbo].[ProductInOrdered] ([id], [productRefId], [count], [totalPrice], [orderedRefId]) VALUES (6, 4, 1, 98, 3)
INSERT [dbo].[ProductInOrdered] ([id], [productRefId], [count], [totalPrice], [orderedRefId]) VALUES (7, 7, 1, 159, 3)
INSERT [dbo].[ProductInOrdered] ([id], [productRefId], [count], [totalPrice], [orderedRefId]) VALUES (8, 10, 2, 998, 2)
SET IDENTITY_INSERT [dbo].[ProductInOrdered] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([personRefId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD FOREIGN KEY([personRefId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Ordered]  WITH CHECK ADD FOREIGN KEY([personRefId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[ProductInCart]  WITH CHECK ADD FOREIGN KEY([productRefId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[ProductInCart]  WITH CHECK ADD  CONSTRAINT [FK_ProductInCart_Cart] FOREIGN KEY([cartRefId])
REFERENCES [dbo].[Cart] ([id])
GO
ALTER TABLE [dbo].[ProductInCart] CHECK CONSTRAINT [FK_ProductInCart_Cart]
GO
ALTER TABLE [dbo].[ProductInOrdered]  WITH CHECK ADD FOREIGN KEY([productRefId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[ProductInOrdered]  WITH CHECK ADD  CONSTRAINT [FK_ProductInOrdered_Ordered] FOREIGN KEY([orderedRefId])
REFERENCES [dbo].[Ordered] ([id])
GO
ALTER TABLE [dbo].[ProductInOrdered] CHECK CONSTRAINT [FK_ProductInOrdered_Ordered]
GO
USE [master]
GO
ALTER DATABASE [Shopping_Bonsai_online] SET  READ_WRITE 
GO
