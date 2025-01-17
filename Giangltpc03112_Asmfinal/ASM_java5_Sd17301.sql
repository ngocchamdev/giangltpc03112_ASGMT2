USE [master]
GO
/****** Object:  Database [PolyStoreDB]    Script Date: 6/13/2023 10:26:20 AM ******/
CREATE DATABASE [PolyStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PolyStoreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PolyStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PolyStoreDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PolyStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PolyStoreDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PolyStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PolyStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PolyStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PolyStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PolyStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PolyStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PolyStoreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PolyStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PolyStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PolyStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PolyStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PolyStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PolyStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PolyStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PolyStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PolyStoreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PolyStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PolyStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PolyStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PolyStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PolyStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PolyStoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PolyStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PolyStoreDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PolyStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [PolyStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PolyStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PolyStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PolyStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PolyStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PolyStoreDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PolyStoreDB', N'ON'
GO
ALTER DATABASE [PolyStoreDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [PolyStoreDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PolyStoreDB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 6/13/2023 10:26:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[photo] [varchar](50) NULL,
	[activated] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 6/13/2023 10:26:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/13/2023 10:26:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [char](4) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/13/2023 10:26:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[orderId] [int] NULL,
	[productId] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/13/2023 10:26:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[username] [varchar](50) NULL,
	[createDate] [date] NULL,
	[address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/13/2023 10:26:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[productId] [int] NULL,
	[categoryId] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/13/2023 10:26:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[price] [float] NULL,
	[createDate] [date] NULL,
	[available] [bit] NULL,
	[brandId] [varchar](10) NULL,
	[images] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleDetails]    Script Date: 6/13/2023 10:26:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleDetails](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[accountId] [varchar](50) NULL,
	[roleId] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/13/2023 10:26:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role] [varchar](10) NOT NULL,
	[description] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'admin', N'123', N'Admin', N'admin@gmail.com', N'admin.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'chamntnpc03156', N'123', N'nguyễn thị Ngọc chăm', N'chamntnpc031asd56@fpt.edu.vn', N'logo.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'giang123', N'617073', N'giang lu', N'giangdaubu23@gmail.com', N'logo.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'giang456', N'855505', N'lalalalala', N'giangdaubu23@gmail.com', N'logo.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'giangdaubu', N'123', N'giang dau bu', N'giangdaubu@gmail.com', N'giang.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'legiang', N'123', N'Lê Trung Hiếu', N'hieult@gmail.com', N'hieu.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'minhhieu', N'123', N'Dương Minh Hiếu', N'hieudm@gmail.com', N'dog.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'minhnhat', N'123', N'Minh Nhật', N'minhnhat@fpt.edu.vn', N'cat2.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'thanhtung', N'123', N'Trần Lê Thanh Tùng', N'thanhtung@gmail.com', N'cat.jpg', 1)
GO
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'BA', N'Sữa các loại', N'ffa1c5f7.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'BM', N'Mỳ, Hủ tiếu, Miến, Phở', N'd97b3c88.png')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'BTC', N'Thịt ,Cá, Trứng, Hải sản', N'a7f59fdc.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'ETH', N'Nước giải khát', N'a270085d.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'KE', N'Dầu ăn, nước mắn, Gia vị', N'4ff96b4d.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'SB  ', N'Đồ dùng gia đình', N'6d0a1d6a.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'TH', N'Rau củ nấm', N'4dd1e447.jpg')
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'BM  ', N'Mì, Hủ tiếu, Miến, Phở')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM01', N'Đồ dùng gia đình')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM02', N'Dầu ăn, nước mắn, gia vị')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM03', N'Nước giải khát')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'NC  ', N'Rau củ nấm')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'SB  ', N'Sữa các loại')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'TH  ', N'Thịt ,Cá, Trứng, Hải sản')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (0, 8, 2, 190000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (1, 9, 1, 350000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (6, 10, 13, 318000, 14)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (7, 11, 13, 9000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [username], [createDate], [address]) VALUES (8, N'admin', CAST(N'2022-06-08' AS Date), N'169 Đinh Bộ Lĩnh')
INSERT [dbo].[Orders] ([id], [username], [createDate], [address]) VALUES (9, N'giangdaubu', CAST(N'2022-06-09' AS Date), N'Ninh Kiều Cần Thơ')
INSERT [dbo].[Orders] ([id], [username], [createDate], [address]) VALUES (10, N'admin', CAST(N'2023-06-11' AS Date), N'càn thơ')
INSERT [dbo].[Orders] ([id], [username], [createDate], [address]) VALUES (11, N'admin', CAST(N'2023-06-13' AS Date), N'hậu giang')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (6, 3, N'SB  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (7, 4, N'BM  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (40, 1, N'SB  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (41, 5, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (50, 8, N'BM  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (52, 7, N'TH  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (58, 0, N'BM  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (61, 6, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (62, 9, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (63, 10, N'SB  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (65, 2, NULL)
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (66, 11, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (67, 12, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (68, 13, N'NC  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (69, 14, N'NC  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (70, 15, N'TH  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (71, 16, N'BM  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (74, 17, N'BM  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (75, 18, N'NC  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (76, 19, N'NC  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (77, 20, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (78, 21, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (79, 22, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (80, 23, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (81, 24, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (82, 25, N'TH  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (83, 26, N'TH  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (84, 27, N'TH  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (85, 28, N'TH  ')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (86, 29, N'TH  ')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (0, N'5 goi hủ tiếu bò kho ViFon', 890000, CAST(N'2021-04-15' AS Date), 1, N'BM', N'["a4a3c86c.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (1, N'Sữa tươi Vinamilk thùng 48 hộp', 340000, CAST(N'2021-04-15' AS Date), 1, N'BA', N'["172f9dff.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (2, N'Bột giặt Omo 380g', 21000, CAST(N'2021-03-20' AS Date), 1, N'SB  ', N'["5918b693.png"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (3, N'Thùng 24 bịch sữa Dutch Lady 150ml', 340000, CAST(N'2021-03-20' AS Date), 1, N'BA', N'["3e35dea5.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (4, N'5 gói mì Gấu Đỏ gà sợ phở', 850000, CAST(N'2021-03-20' AS Date), 1, N'BA', N'["fbcf14af.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (5, N'Dầu đậu nành Meizan tốt cho tim mạch', 49000, CAST(N'2021-03-22' AS Date), 1, N'KE', N'["fa46a627.png"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (6, N'Dầu ăn Happi Koki', 322000, CAST(N'2022-04-10' AS Date), 1, N'KE', N'["4840e1e8.png"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (7, N'Trứng gà Nam Hương 10 quả tặng 2 quả', 30000, CAST(N'2021-04-15' AS Date), 1, N'BTC', N'["d1ac0ad5.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (8, N'5 gói Hủ tiếu bò kho Chin-Su', 650000, CAST(N'2021-04-15' AS Date), 1, N'BM', N'["5eb63a86.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (9, N'Nước chấm Đầu Bếp Tôm', 90000, CAST(N'2022-04-12' AS Date), 1, N'KE', N'["18187360.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (10, N'Thùng 24 hộp sữa Đà Lạt 18ml', 350000, CAST(N'2022-04-12' AS Date), 1, N'BA', N'["f3c3094b.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (11, N'Bột giặt Surf 5kg', 197000, CAST(N'2022-04-13' AS Date), 1, N'SB  ', N'["66fa931e.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (12, N'Nước lau sàn Gift baby smile 1 lít', 370000, CAST(N'2022-04-13' AS Date), 1, N'SB  ', N'["bfdb9b80.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (13, N'Bắp cải tím 500-600g', 9000, CAST(N'2022-04-14' AS Date), 1, N'TH', N'["7e802a68.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (14, N'Xà lách lô lô xanh 500g', 19000, CAST(N'2022-03-15' AS Date), 1, N'TH', N'["79b15609.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (15, N'Ba rọi heo 1kg', 100000, CAST(N'2023-06-12' AS Date), 1, N'BTC', N'["e5c5c168.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (16, N'Mì gói Hảo Hảo tôm chua cay', 35000, CAST(N'2023-06-13' AS Date), 1, N'BM', N'["e6c58990.png"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (17, N'Miến lẩu thái ViFon', 10000, CAST(N'2023-06-13' AS Date), 1, N'BM', N'["6ef09597.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (18, N'Cà rôt Đà lạt 500 g(5-6 củ)', 14000, CAST(N'2023-06-13' AS Date), 1, N'TH', N'["db4b383d.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (19, N'Xà lách búp mỡ 500g', 16500, CAST(N'2023-06-13' AS Date), 1, N'TH', N'["c728b126.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (20, N'Nước Lau Sàn Sunlight hương bạc hà', 59000, CAST(N'2023-06-13' AS Date), 1, N'SB  ', N'["87391333.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (21, N'6 chia Aquarius390ml', 45000, CAST(N'2023-06-13' AS Date), 1, N'ETH', N'["a7b1920d.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (22, N'6 lon Coca_Cola 235ml', 48000, CAST(N'2023-06-13' AS Date), 1, N'ETH', N'["bc072e7f.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (23, N'6 lon 7 Up chnah 330ml', 58000, CAST(N'2023-06-13' AS Date), 1, N'ETH', N'["4c12530a.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (24, N'6 lon Schweppes không đường 320ml', 405000, CAST(N'2023-06-13' AS Date), 1, N'ETH', N'["6077341f.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (25, N'Thịt đùi C.P 300g', 45000, CAST(N'2023-06-13' AS Date), 1, N'BTC', N'["84ba2078.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (26, N'Cánh gà chiên', 89500, CAST(N'2023-06-13' AS Date), 1, N'BTC', N'["277380ad.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (27, N'Cá diêu hồng làm sạch sẵn 300-400g', 39000, CAST(N'2023-06-13' AS Date), 1, N'BTC', N'["c393e1cb.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (28, N'Bò Xay Fohla 250g', 65000, CAST(N'2023-06-13' AS Date), 1, N'BTC', N'["4800d029.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (29, N'Cua thịt Cà Mau 200-300g', 118000, CAST(N'2023-06-13' AS Date), 1, N'BTC', N'["210df458.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (30, N'Đàu cá hồi 400g', 39500, CAST(N'2023-06-13' AS Date), 1, N'BTC', N'["90a17da1.jpg"]')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleDetails] ON 

INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (0, N'admin', N'director')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (4, N'thanhtung', N'staff')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (6, N'minhnhat', N'user')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (7, N'minhhieu', N'user')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (8, N'giang123', N'user')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (9, N'giangdaubu', N'director')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (11, N'giang456', N'user')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (12, N'chamntnpc03156', N'user')
SET IDENTITY_INSERT [dbo].[RoleDetails] OFF
GO
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'director', N'director')
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'staff', N'staff')
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'user', N'user')
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([id])
GO
ALTER TABLE [dbo].[RoleDetails]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[RoleDetails]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([role])
GO
/****** Object:  StoredProcedure [dbo].[sp_ReportCost]    Script Date: 6/13/2023 10:26:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ReportCost] (@month INT)
AS BEGIN
SELECT 
			convert(varchar(10), o.createDate, 103) AS NgayBan,		
			COUNT(DISTINCT o.id) AS TongHoaDon,
			SUM(od.quantity * od.price) AS DoanhThu
FROM Orders o, OrderDetails od  WHERE o.id = od.orderId AND MONTH(o.createDate) = @month
GROUP BY createDate
END
GO
USE [master]
GO
ALTER DATABASE [PolyStoreDB] SET  READ_WRITE 
GO
