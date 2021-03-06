USE [master]
GO
/****** Object:  Database [Canteen_ECCO]    Script Date: 24-04-2020 13:30:49 ******/
CREATE DATABASE [Canteen_ECCO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Canteen_ECCO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Canteen_ECCO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Canteen_ECCO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Canteen_ECCO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Canteen_ECCO] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Canteen_ECCO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Canteen_ECCO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET ARITHABORT OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Canteen_ECCO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Canteen_ECCO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Canteen_ECCO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Canteen_ECCO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Canteen_ECCO] SET  MULTI_USER 
GO
ALTER DATABASE [Canteen_ECCO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Canteen_ECCO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Canteen_ECCO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Canteen_ECCO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Canteen_ECCO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Canteen_ECCO', N'ON'
GO
ALTER DATABASE [Canteen_ECCO] SET QUERY_STORE = OFF
GO
USE [Canteen_ECCO]
GO
/****** Object:  Table [dbo].[tblCard]    Script Date: 24-04-2020 13:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCard](
	[fldEmployeeID] [int] NOT NULL,
	[fldBalance] [real] NULL,
 CONSTRAINT [PK_tblCard] PRIMARY KEY CLUSTERED 
(
	[fldEmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 24-04-2020 13:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[fldCPR] [varchar](11) NOT NULL,
	[fldEmployeeID] [int] NOT NULL,
	[fldFirstName] [nchar](20) NOT NULL,
	[fldLastName] [nchar](20) NOT NULL,
	[fldPhoneNO] [int] NULL,
	[fldMail] [nchar](200) NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[fldEmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJob]    Script Date: 24-04-2020 13:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJob](
	[fldJobID] [int] NOT NULL,
	[fldJobDescription] [nchar](30) NOT NULL,
 CONSTRAINT [PK_tblJob] PRIMARY KEY CLUSTERED 
(
	[fldJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 24-04-2020 13:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[fldFoodID] [int] NOT NULL,
	[fldSupplierCVR] [int] NOT NULL,
	[fldFoodName] [nchar](30) NOT NULL,
	[fldBuyPrice] [real] NOT NULL,
	[fldSellPrice] [real] NOT NULL,
	[fldCurrentStockLevel] [int] NOT NULL,
	[fldMinimumStock] [int] NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[fldFoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSupplier]    Script Date: 24-04-2020 13:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSupplier](
	[fldSupplierCVR] [int] NOT NULL,
	[fldSupplierName] [nchar](30) NOT NULL,
	[fldMail] [nchar](40) NOT NULL,
	[fldPhoneNO] [int] NULL,
 CONSTRAINT [PK_tblSupplier] PRIMARY KEY CLUSTERED 
(
	[fldSupplierCVR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTransaction]    Script Date: 24-04-2020 13:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransaction](
	[fldTransactionID] [int] IDENTITY(1,1) NOT NULL,
	[fldEmployeeID] [int] NOT NULL,
	[fldPrice] [real] NOT NULL,
	[fldDate] [date] NULL,
 CONSTRAINT [PK_tblTransaction] PRIMARY KEY CLUSTERED 
(
	[fldTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 24-04-2020 13:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[fldEmployeeID] [int] NOT NULL,
	[Password] [varchar](20) NULL,
	[fldJobID] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[fldEmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCard] ([fldEmployeeID], [fldBalance]) VALUES (1111, 60)
INSERT [dbo].[tblCard] ([fldEmployeeID], [fldBalance]) VALUES (2222, 100)
INSERT [dbo].[tblCard] ([fldEmployeeID], [fldBalance]) VALUES (3333, 130)
INSERT [dbo].[tblCard] ([fldEmployeeID], [fldBalance]) VALUES (4444, 50)
INSERT [dbo].[tblCard] ([fldEmployeeID], [fldBalance]) VALUES (5555, 70)
INSERT [dbo].[tblEmployee] ([fldCPR], [fldEmployeeID], [fldFirstName], [fldLastName], [fldPhoneNO], [fldMail]) VALUES (N'132416546', 1111, N'Tim                 ', N'TheMan              ', 984984984, N'timtim@mail.dk                                                                                                                                                                                          ')
INSERT [dbo].[tblEmployee] ([fldCPR], [fldEmployeeID], [fldFirstName], [fldLastName], [fldPhoneNO], [fldMail]) VALUES (N'4654654666', 2222, N'Bark                ', N'Mark                ', 432154965, N'markfrombark@mail.com                                                                                                                                                                                   ')
INSERT [dbo].[tblEmployee] ([fldCPR], [fldEmployeeID], [fldFirstName], [fldLastName], [fldPhoneNO], [fldMail]) VALUES (N'3426455463', 3333, N'Muddi               ', N'eork                ', 187342653, N'gucciboy@mail.com                                                                                                                                                                                       ')
INSERT [dbo].[tblEmployee] ([fldCPR], [fldEmployeeID], [fldFirstName], [fldLastName], [fldPhoneNO], [fldMail]) VALUES (N'342165444', 4444, N'Peter               ', N'El-Zein             ', 890342342, N'undergroundboy@seif.dk                                                                                                                                                                                  ')
INSERT [dbo].[tblEmployee] ([fldCPR], [fldEmployeeID], [fldFirstName], [fldLastName], [fldPhoneNO], [fldMail]) VALUES (N'432654234', 5555, N'Mikkel              ', N'erkgop              ', 432654443, N'56gfd@mail.com                                                                                                                                                                                          ')
INSERT [dbo].[tblJob] ([fldJobID], [fldJobDescription]) VALUES (1, N'Employee                      ')
INSERT [dbo].[tblJob] ([fldJobID], [fldJobDescription]) VALUES (2, N'Canteen Staff                 ')
INSERT [dbo].[tblJob] ([fldJobID], [fldJobDescription]) VALUES (3, N'Manager                       ')
INSERT [dbo].[tblJob] ([fldJobID], [fldJobDescription]) VALUES (4, N'Reciptionist                  ')
INSERT [dbo].[tblProducts] ([fldFoodID], [fldSupplierCVR], [fldFoodName], [fldBuyPrice], [fldSellPrice], [fldCurrentStockLevel], [fldMinimumStock]) VALUES (1, 4658998, N'ice                           ', 15.5, 20, 102, 11)
INSERT [dbo].[tblProducts] ([fldFoodID], [fldSupplierCVR], [fldFoodName], [fldBuyPrice], [fldSellPrice], [fldCurrentStockLevel], [fldMinimumStock]) VALUES (2, 43198000, N'Chicken Salsa                 ', 1, 5, 190, 20)
INSERT [dbo].[tblProducts] ([fldFoodID], [fldSupplierCVR], [fldFoodName], [fldBuyPrice], [fldSellPrice], [fldCurrentStockLevel], [fldMinimumStock]) VALUES (3, 44545432, N'Pizza                         ', 15, 30, 300, 23)
INSERT [dbo].[tblProducts] ([fldFoodID], [fldSupplierCVR], [fldFoodName], [fldBuyPrice], [fldSellPrice], [fldCurrentStockLevel], [fldMinimumStock]) VALUES (4, 123456789, N'Banana                        ', 2, 5, 42, 17)
INSERT [dbo].[tblSupplier] ([fldSupplierCVR], [fldSupplierName], [fldMail], [fldPhoneNO]) VALUES (4658998, N'Arla                          ', N'lfgdkæl@.dk                             ', 5631245)
INSERT [dbo].[tblSupplier] ([fldSupplierCVR], [fldSupplierName], [fldMail], [fldPhoneNO]) VALUES (43198000, N'MaccaDee                      ', N'kgke@sad.dk                             ', 43189043)
INSERT [dbo].[tblSupplier] ([fldSupplierCVR], [fldSupplierName], [fldMail], [fldPhoneNO]) VALUES (44545432, N'PizzaKuzz                     ', N'Pizzaman@whatever.dk                    ', 5646543)
INSERT [dbo].[tblSupplier] ([fldSupplierCVR], [fldSupplierName], [fldMail], [fldPhoneNO]) VALUES (123456789, N'Netto                         ', N'nettohansen@mail.dk                     ', 62131125)
SET IDENTITY_INSERT [dbo].[tblTransaction] ON 

INSERT [dbo].[tblTransaction] ([fldTransactionID], [fldEmployeeID], [fldPrice], [fldDate]) VALUES (1, 1111, 5, CAST(N'2020-04-22' AS Date))
INSERT [dbo].[tblTransaction] ([fldTransactionID], [fldEmployeeID], [fldPrice], [fldDate]) VALUES (2, 1111, 10, NULL)
INSERT [dbo].[tblTransaction] ([fldTransactionID], [fldEmployeeID], [fldPrice], [fldDate]) VALUES (3, 1111, 5, CAST(N'2020-04-22' AS Date))
INSERT [dbo].[tblTransaction] ([fldTransactionID], [fldEmployeeID], [fldPrice], [fldDate]) VALUES (4, 1111, 5, CAST(N'2020-04-22' AS Date))
INSERT [dbo].[tblTransaction] ([fldTransactionID], [fldEmployeeID], [fldPrice], [fldDate]) VALUES (5, 5555, 10, CAST(N'2020-04-22' AS Date))
INSERT [dbo].[tblTransaction] ([fldTransactionID], [fldEmployeeID], [fldPrice], [fldDate]) VALUES (6, 1111, 5, CAST(N'2020-04-22' AS Date))
INSERT [dbo].[tblTransaction] ([fldTransactionID], [fldEmployeeID], [fldPrice], [fldDate]) VALUES (7, 1111, 35, CAST(N'2020-04-23' AS Date))
INSERT [dbo].[tblTransaction] ([fldTransactionID], [fldEmployeeID], [fldPrice], [fldDate]) VALUES (8, 1111, 5, CAST(N'2020-04-23' AS Date))
SET IDENTITY_INSERT [dbo].[tblTransaction] OFF
INSERT [dbo].[tblUser] ([fldEmployeeID], [Password], [fldJobID]) VALUES (1111, N'abaaa', 1)
INSERT [dbo].[tblUser] ([fldEmployeeID], [Password], [fldJobID]) VALUES (2222, N'absaaa', 2)
INSERT [dbo].[tblUser] ([fldEmployeeID], [Password], [fldJobID]) VALUES (3333, N'gfdgf', 3)
INSERT [dbo].[tblUser] ([fldEmployeeID], [Password], [fldJobID]) VALUES (4444, N'hfghgf', 4)
INSERT [dbo].[tblUser] ([fldEmployeeID], [Password], [fldJobID]) VALUES (5555, N'ytney', 1)
ALTER TABLE [dbo].[tblCard]  WITH CHECK ADD  CONSTRAINT [FK_tblCard_tblEmployee] FOREIGN KEY([fldEmployeeID])
REFERENCES [dbo].[tblEmployee] ([fldEmployeeID])
GO
ALTER TABLE [dbo].[tblCard] CHECK CONSTRAINT [FK_tblCard_tblEmployee]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblSupplier] FOREIGN KEY([fldSupplierCVR])
REFERENCES [dbo].[tblSupplier] ([fldSupplierCVR])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblSupplier]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblEmployee] FOREIGN KEY([fldEmployeeID])
REFERENCES [dbo].[tblEmployee] ([fldEmployeeID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblEmployee]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblJob] FOREIGN KEY([fldJobID])
REFERENCES [dbo].[tblJob] ([fldJobID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblJob]
GO
USE [master]
GO
ALTER DATABASE [Canteen_ECCO] SET  READ_WRITE 
GO
