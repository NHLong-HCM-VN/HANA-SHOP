USE [master]
GO
/****** Object:  Database [HANASHOP_LAB]    Script Date: 3/6/2021 3:33:39 PM ******/
CREATE DATABASE [HANASHOP_LAB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HANASHOP_LAB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HANASHOP_LAB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HANASHOP_LAB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HANASHOP_LAB_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HANASHOP_LAB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HANASHOP_LAB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HANASHOP_LAB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HANASHOP_LAB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HANASHOP_LAB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HANASHOP_LAB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HANASHOP_LAB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET RECOVERY FULL 
GO
ALTER DATABASE [HANASHOP_LAB] SET  MULTI_USER 
GO
ALTER DATABASE [HANASHOP_LAB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HANASHOP_LAB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HANASHOP_LAB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HANASHOP_LAB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HANASHOP_LAB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HANASHOP_LAB', N'ON'
GO
USE [HANASHOP_LAB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/6/2021 3:33:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](20) NOT NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[googleID] [nvarchar](50) NULL,
	[googleName] [nvarchar](50) NULL,
	[isAdmin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/6/2021 3:33:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[billID] [nvarchar](10) NOT NULL,
	[billOf] [nvarchar](50) NOT NULL,
	[billDate] [date] NOT NULL,
	[billPaymentM] [nvarchar](10) NOT NULL,
	[alive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[billID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 3/6/2021 3:33:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[billID] [nvarchar](10) NOT NULL,
	[foodID] [nvarchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[alive] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 3/6/2021 3:33:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[foodID] [nvarchar](10) NOT NULL,
	[foodName] [nvarchar](20) NOT NULL,
	[foodImage] [nvarchar](50) NOT NULL,
	[foodDescription] [nvarchar](1000) NOT NULL,
	[foodPrice] [float] NOT NULL,
	[foodCreateDate] [date] NOT NULL,
	[foodCategory] [nvarchar](10) NOT NULL,
	[foodQuantity] [int] NOT NULL,
	[alive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[foodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 3/6/2021 3:33:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[categoryID] [nvarchar](10) NOT NULL,
	[categoryName] [nvarchar](20) NOT NULL,
	[alive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([username], [pass], [lastname], [googleID], [googleName], [isAdmin]) VALUES (N'LongAdmin', N'1', N'LongAdmin', NULL, NULL, 1)
INSERT [dbo].[Account] ([username], [pass], [lastname], [googleID], [googleName], [isAdmin]) VALUES (N'LongNH', N'123456', N'HoangLong', NULL, NULL, 0)
INSERT [dbo].[Account] ([username], [pass], [lastname], [googleID], [googleName], [isAdmin]) VALUES (N'longnhse140057@fpt.edu.vn', N'NULL', N'longnhse140057@fpt.edu.vn', N'110847755658151551646', N'longnhse140057@fpt.edu.vn', 0)
INSERT [dbo].[Bill] ([billID], [billOf], [billDate], [billPaymentM], [alive]) VALUES (N'00001', N'longnhse140057@fpt.edu.vn', CAST(N'2021-01-23' AS Date), N'Cash', 1)
INSERT [dbo].[Bill] ([billID], [billOf], [billDate], [billPaymentM], [alive]) VALUES (N'00002', N'LongNH', CAST(N'2021-01-23' AS Date), N'Cash', 1)
INSERT [dbo].[Bill] ([billID], [billOf], [billDate], [billPaymentM], [alive]) VALUES (N'00003', N'LongNH', CAST(N'2021-01-25' AS Date), N'Cash', 1)
INSERT [dbo].[BillDetail] ([billID], [foodID], [Quantity], [Price], [alive]) VALUES (N'00001', N'Coffee04', 5, 30, 1)
INSERT [dbo].[BillDetail] ([billID], [foodID], [Quantity], [Price], [alive]) VALUES (N'00001', N'Coffee02', 1, 5.25, 1)
INSERT [dbo].[BillDetail] ([billID], [foodID], [Quantity], [Price], [alive]) VALUES (N'00002', N'Cake02', 4, 12, 1)
INSERT [dbo].[BillDetail] ([billID], [foodID], [Quantity], [Price], [alive]) VALUES (N'00002', N'Coffee05', 4, 22, 1)
INSERT [dbo].[BillDetail] ([billID], [foodID], [Quantity], [Price], [alive]) VALUES (N'00003', N'Coffee04', 1, 6, 1)
INSERT [dbo].[Food] ([foodID], [foodName], [foodImage], [foodDescription], [foodPrice], [foodCreateDate], [foodCategory], [foodQuantity], [alive]) VALUES (N'Cake01', N'PanCake', N'PanCake.jpg', N'The batter can have ingredients such as buttermilk, blueberries, strawberries, bananas, apples, chocolate chips, cheese, or sugar added. Spices such as cinnamon, vanilla and nutmeg can also be used. Yogurt may be used to give the pancakes a relatively moist consistency. Pancakes may be ⅓ inch (1 cm) thick and are typically between 4 inches (10 cm) and 10 inches (25 cm) in diameter.', 2, CAST(N'2021-01-01' AS Date), N'Cake', 100, 1)
INSERT [dbo].[Food] ([foodID], [foodName], [foodImage], [foodDescription], [foodPrice], [foodCreateDate], [foodCategory], [foodQuantity], [alive]) VALUES (N'Cake02', N'StrawberryCake', N'StrawberryCake.jpg', N'Strawberry cakes may be prepared with strawberries in the batter,[2] with strawberries atop them,[1] with strawberries or a strawberry filling in between the layers of a layer cake,[3] and in any combination thereof. Some are prepared with strawberries incorporated into a frosting.', 3, CAST(N'2021-01-01' AS Date), N'Cake', 46, 1)
INSERT [dbo].[Food] ([foodID], [foodName], [foodImage], [foodDescription], [foodPrice], [foodCreateDate], [foodCategory], [foodQuantity], [alive]) VALUES (N'Cake03', N'ChocolateCake', N'ChocolateCake.jpg', N'The most amazing chocolate cake.', 3, CAST(N'2021-01-02' AS Date), N'Cake', 50, 1)
INSERT [dbo].[Food] ([foodID], [foodName], [foodImage], [foodDescription], [foodPrice], [foodCreateDate], [foodCategory], [foodQuantity], [alive]) VALUES (N'Cake04', N'CupCake', N'CupCake.jpg', N'A cupcake (also British English: fairy cake; Hiberno-English: bun; Australian English: fairy cake or patty cake[1]) is a small cake designed to serve one person, which may be baked in a small thin paper or aluminum cup. As with larger cakes, frosting and other cake decorations such as fruit and candy may be applied.', 1, CAST(N'2021-01-02' AS Date), N'Cake', 100, 1)
INSERT [dbo].[Food] ([foodID], [foodName], [foodImage], [foodDescription], [foodPrice], [foodCreateDate], [foodCategory], [foodQuantity], [alive]) VALUES (N'Chicken01', N'ChickenBalls', N'ChickenBalls.jpg', N'sdafasdfasdf', 1.35, CAST(N'2021-01-25' AS Date), N'Chicken', 10, 1)
INSERT [dbo].[Food] ([foodID], [foodName], [foodImage], [foodDescription], [foodPrice], [foodCreateDate], [foodCategory], [foodQuantity], [alive]) VALUES (N'Coffee01', N'Americano', N'Americano.jpg', N'The americano is basically a way to make espresso coffee (which is black, thick, and strong) taste a bit more like filter coffee.', 5, CAST(N'2021-01-01' AS Date), N'Coffee', 100, 1)
INSERT [dbo].[Food] ([foodID], [foodName], [foodImage], [foodDescription], [foodPrice], [foodCreateDate], [foodCategory], [foodQuantity], [alive]) VALUES (N'Coffee02', N'RobustaCoffee', N'RobustaCoffee.jpg', N'This coffee has a strong aroma, not sour, high caffeine.', 5.3, CAST(N'2021-01-07' AS Date), N'Coffee', 84, 1)
INSERT [dbo].[Food] ([foodID], [foodName], [foodImage], [foodDescription], [foodPrice], [foodCreateDate], [foodCategory], [foodQuantity], [alive]) VALUES (N'Coffee03', N'ArabicaCoffee', N'ArabicaCoffee.jpg', N'The taste of Arabica is slightly sour, people often compare it to the same taste as when we eat lemon, it will be very sour, but immediately see the bitter taste of the peel.', 4.5, CAST(N'2021-01-09' AS Date), N'Coffee', 100, 0)
INSERT [dbo].[Food] ([foodID], [foodName], [foodImage], [foodDescription], [foodPrice], [foodCreateDate], [foodCategory], [foodQuantity], [alive]) VALUES (N'Coffee04', N'MokaCoffee', N'MocaCoffee.jpg', N'Its aroma is very special, very luxurious, ecstatic, slightly sour, for connoisseurs.', 6, CAST(N'2021-01-07' AS Date), N'Coffee', 94, 1)
INSERT [dbo].[Food] ([foodID], [foodName], [foodImage], [foodDescription], [foodPrice], [foodCreateDate], [foodCategory], [foodQuantity], [alive]) VALUES (N'Coffee05', N'CherryCoffee', N'CherryCoffee.jpg', N'Cherry is very suitable for female preferences with the blend of smell and taste to create a rustic, noble feeling.', 5.5, CAST(N'2021-01-08' AS Date), N'Coffee', 46, 1)
INSERT [dbo].[FoodCategory] ([categoryID], [categoryName], [alive]) VALUES (N'Beef', N'Beef', 1)
INSERT [dbo].[FoodCategory] ([categoryID], [categoryName], [alive]) VALUES (N'Cake', N'Cake', 1)
INSERT [dbo].[FoodCategory] ([categoryID], [categoryName], [alive]) VALUES (N'Chicken', N'Chicken', 1)
INSERT [dbo].[FoodCategory] ([categoryID], [categoryName], [alive]) VALUES (N'Coffee', N'Coffee', 1)
INSERT [dbo].[FoodCategory] ([categoryID], [categoryName], [alive]) VALUES (N'Juice', N'Juice', 1)
INSERT [dbo].[FoodCategory] ([categoryID], [categoryName], [alive]) VALUES (N'Snacks', N'Snacks', 1)
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([billOf])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([billID])
REFERENCES [dbo].[Bill] ([billID])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([foodID])
REFERENCES [dbo].[Food] ([foodID])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([foodCategory])
REFERENCES [dbo].[FoodCategory] ([categoryID])
GO
USE [master]
GO
ALTER DATABASE [HANASHOP_LAB] SET  READ_WRITE 
GO
