USE [master]
GO
/****** Object:  Database [QLBH]    Script Date: 23/08/2023 10:47:02 CH ******/
CREATE DATABASE [QLBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH', FILENAME = N'D:\SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLBH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBH_log', FILENAME = N'D:\SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLBH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLBH] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBH] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBH', N'ON'
GO
ALTER DATABASE [QLBH] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLBH] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLBH]
GO
/****** Object:  Table [dbo].[Bàn]    Script Date: 23/08/2023 10:47:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bàn](
	[Số bàn] [int] NOT NULL,
 CONSTRAINT [PK_Bàn] PRIMARY KEY CLUSTERED 
(
	[Số bàn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Đồ ăn]    Script Date: 23/08/2023 10:47:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Đồ ăn](
	[Mã đồ ăn] [nchar](10) NOT NULL,
	[Tên đồ ăn] [nchar](20) NOT NULL,
	[Giá gốc] [money] NULL,
	[Giá bán] [money] NULL,
 CONSTRAINT [PK_Đồ ăn] PRIMARY KEY CLUSTERED 
(
	[Mã đồ ăn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Đồ uống]    Script Date: 23/08/2023 10:47:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Đồ uống](
	[Mã đồ uống] [nchar](10) NOT NULL,
	[Tên đồ uống] [nchar](20) NOT NULL,
	[Giá gốc] [money] NULL,
	[Giá bán] [money] NULL,
 CONSTRAINT [PK_Đồ uống] PRIMARY KEY CLUSTERED 
(
	[Mã đồ uống] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hóa đơn bán]    Script Date: 23/08/2023 10:47:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hóa đơn bán](
	[Mã HĐ] [nchar](10) NOT NULL,
	[Mã đồ uống] [nchar](10) NULL,
	[Mã đồ ăn] [nchar](10) NULL,
	[Số bàn] [int] NULL,
	[Ngày xuất HĐ] [datetime] NULL,
	[Mã nhân viên] [nchar](10) NULL,
 CONSTRAINT [PK_Hóa đơn bán] PRIMARY KEY CLUSTERED 
(
	[Mã HĐ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhân viên]    Script Date: 23/08/2023 10:47:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhân viên](
	[Mã nhân viên] [nchar](10) NOT NULL,
	[Tên nhân viên] [nchar](30) NOT NULL,
	[Ngày vào làm] [datetime] NULL,
	[Vị trí] [nchar](20) NULL,
 CONSTRAINT [PK_Nhân viên] PRIMARY KEY CLUSTERED 
(
	[Mã nhân viên] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (1)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (2)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (3)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (4)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (5)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (6)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (7)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (8)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (9)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (10)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (11)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (12)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (13)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (14)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (15)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (16)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (17)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (18)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (19)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (20)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (21)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (22)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (23)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (24)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (25)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (26)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (27)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (28)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (29)
INSERT [dbo].[Bàn] ([Số bàn]) VALUES (30)
GO
INSERT [dbo].[Đồ ăn] ([Mã đồ ăn], [Tên đồ ăn], [Giá gốc], [Giá bán]) VALUES (N'1         ', N'Khoai tây chiên     ', 5.0000, 20.0000)
INSERT [dbo].[Đồ ăn] ([Mã đồ ăn], [Tên đồ ăn], [Giá gốc], [Giá bán]) VALUES (N'2         ', N'Bánh sừng bò        ', 7.0000, 20.0000)
INSERT [dbo].[Đồ ăn] ([Mã đồ ăn], [Tên đồ ăn], [Giá gốc], [Giá bán]) VALUES (N'3         ', N'Bánh crepe          ', 10.0000, 35.0000)
INSERT [dbo].[Đồ ăn] ([Mã đồ ăn], [Tên đồ ăn], [Giá gốc], [Giá bán]) VALUES (N'4         ', N'Mì khô              ', 5.0000, 20.0000)
INSERT [dbo].[Đồ ăn] ([Mã đồ ăn], [Tên đồ ăn], [Giá gốc], [Giá bán]) VALUES (N'5         ', N'Khô bò              ', 10.0000, 30.0000)
INSERT [dbo].[Đồ ăn] ([Mã đồ ăn], [Tên đồ ăn], [Giá gốc], [Giá bán]) VALUES (N'6         ', N'Bánh bông lan       ', 6.0000, 25.0000)
GO
INSERT [dbo].[Đồ uống] ([Mã đồ uống], [Tên đồ uống], [Giá gốc], [Giá bán]) VALUES (N'1         ', N'Cà phê đen          ', 5.0000, 20.0000)
INSERT [dbo].[Đồ uống] ([Mã đồ uống], [Tên đồ uống], [Giá gốc], [Giá bán]) VALUES (N'10        ', N'Sữa chua cà phê     ', 10.0000, 30.0000)
INSERT [dbo].[Đồ uống] ([Mã đồ uống], [Tên đồ uống], [Giá gốc], [Giá bán]) VALUES (N'2         ', N'Cà phê sữa          ', 7.0000, 22.0000)
INSERT [dbo].[Đồ uống] ([Mã đồ uống], [Tên đồ uống], [Giá gốc], [Giá bán]) VALUES (N'3         ', N'Bạc xỉu             ', 7.0000, 22.0000)
INSERT [dbo].[Đồ uống] ([Mã đồ uống], [Tên đồ uống], [Giá gốc], [Giá bán]) VALUES (N'4         ', N'Latte               ', 8.0000, 25.0000)
INSERT [dbo].[Đồ uống] ([Mã đồ uống], [Tên đồ uống], [Giá gốc], [Giá bán]) VALUES (N'5         ', N'Cappuchino          ', 8.0000, 25.0000)
INSERT [dbo].[Đồ uống] ([Mã đồ uống], [Tên đồ uống], [Giá gốc], [Giá bán]) VALUES (N'6         ', N'Sinh tố bơ          ', 10.0000, 30.0000)
INSERT [dbo].[Đồ uống] ([Mã đồ uống], [Tên đồ uống], [Giá gốc], [Giá bán]) VALUES (N'7         ', N'Sinh tố xoài        ', 10.0000, 30.0000)
INSERT [dbo].[Đồ uống] ([Mã đồ uống], [Tên đồ uống], [Giá gốc], [Giá bán]) VALUES (N'8         ', N'Sữa chua dâu        ', 10.0000, 30.0000)
INSERT [dbo].[Đồ uống] ([Mã đồ uống], [Tên đồ uống], [Giá gốc], [Giá bán]) VALUES (N'9         ', N'Sữa chua xoài       ', 10.0000, 30.0000)
GO
INSERT [dbo].[Hóa đơn bán] ([Mã HĐ], [Mã đồ uống], [Mã đồ ăn], [Số bàn], [Ngày xuất HĐ], [Mã nhân viên]) VALUES (N'HD1       ', N'1         ', N'1         ', 10, CAST(N'2023-02-10T00:00:00.000' AS DateTime), N'4         ')
INSERT [dbo].[Hóa đơn bán] ([Mã HĐ], [Mã đồ uống], [Mã đồ ăn], [Số bàn], [Ngày xuất HĐ], [Mã nhân viên]) VALUES (N'HD2       ', N'2         ', N'4         ', 10, CAST(N'2023-02-11T00:00:00.000' AS DateTime), N'4         ')
INSERT [dbo].[Hóa đơn bán] ([Mã HĐ], [Mã đồ uống], [Mã đồ ăn], [Số bàn], [Ngày xuất HĐ], [Mã nhân viên]) VALUES (N'HD3       ', N'5         ', NULL, 2, CAST(N'2023-03-13T00:00:00.000' AS DateTime), N'4         ')
INSERT [dbo].[Hóa đơn bán] ([Mã HĐ], [Mã đồ uống], [Mã đồ ăn], [Số bàn], [Ngày xuất HĐ], [Mã nhân viên]) VALUES (N'HD4       ', NULL, N'2         ', 4, CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'4         ')
INSERT [dbo].[Hóa đơn bán] ([Mã HĐ], [Mã đồ uống], [Mã đồ ăn], [Số bàn], [Ngày xuất HĐ], [Mã nhân viên]) VALUES (N'HD5       ', N'2         ', N'4         ', 6, CAST(N'2023-04-23T00:00:00.000' AS DateTime), N'5         ')
INSERT [dbo].[Hóa đơn bán] ([Mã HĐ], [Mã đồ uống], [Mã đồ ăn], [Số bàn], [Ngày xuất HĐ], [Mã nhân viên]) VALUES (N'HD6       ', N'4         ', NULL, 6, CAST(N'2023-05-27T00:00:00.000' AS DateTime), N'5         ')
INSERT [dbo].[Hóa đơn bán] ([Mã HĐ], [Mã đồ uống], [Mã đồ ăn], [Số bàn], [Ngày xuất HĐ], [Mã nhân viên]) VALUES (N'HD7       ', N'1         ', NULL, 7, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'4         ')
INSERT [dbo].[Hóa đơn bán] ([Mã HĐ], [Mã đồ uống], [Mã đồ ăn], [Số bàn], [Ngày xuất HĐ], [Mã nhân viên]) VALUES (N'HD8       ', N'5         ', N'3         ', 5, CAST(N'2023-07-16T00:00:00.000' AS DateTime), N'5         ')
INSERT [dbo].[Hóa đơn bán] ([Mã HĐ], [Mã đồ uống], [Mã đồ ăn], [Số bàn], [Ngày xuất HĐ], [Mã nhân viên]) VALUES (N'HD9       ', N'8         ', N'4         ', 22, CAST(N'2023-07-24T00:00:00.000' AS DateTime), N'5         ')
GO
INSERT [dbo].[Nhân viên] ([Mã nhân viên], [Tên nhân viên], [Ngày vào làm], [Vị trí]) VALUES (N'1         ', N'Nguyễn A                      ', CAST(N'2022-01-02T00:00:00.000' AS DateTime), N'Phục vụ             ')
INSERT [dbo].[Nhân viên] ([Mã nhân viên], [Tên nhân viên], [Ngày vào làm], [Vị trí]) VALUES (N'2         ', N'Nguyễn B                      ', CAST(N'2021-04-03T00:00:00.000' AS DateTime), N'Phục vụ             ')
INSERT [dbo].[Nhân viên] ([Mã nhân viên], [Tên nhân viên], [Ngày vào làm], [Vị trí]) VALUES (N'3         ', N'Nguyễn C                      ', CAST(N'2022-07-06T00:00:00.000' AS DateTime), N'Phục vụ             ')
INSERT [dbo].[Nhân viên] ([Mã nhân viên], [Tên nhân viên], [Ngày vào làm], [Vị trí]) VALUES (N'4         ', N'Thị D                         ', CAST(N'2021-07-23T00:00:00.000' AS DateTime), N'Thanh toán          ')
INSERT [dbo].[Nhân viên] ([Mã nhân viên], [Tên nhân viên], [Ngày vào làm], [Vị trí]) VALUES (N'5         ', N'Thị E                         ', CAST(N'2022-03-10T00:00:00.000' AS DateTime), N'Thanh toán          ')
INSERT [dbo].[Nhân viên] ([Mã nhân viên], [Tên nhân viên], [Ngày vào làm], [Vị trí]) VALUES (N'6         ', N'Văn F                         ', CAST(N'2021-03-01T00:00:00.000' AS DateTime), N'Pha chế             ')
INSERT [dbo].[Nhân viên] ([Mã nhân viên], [Tên nhân viên], [Ngày vào làm], [Vị trí]) VALUES (N'7         ', N'Văn G                         ', CAST(N'2021-06-12T00:00:00.000' AS DateTime), N'Nấu ăn              ')
GO
ALTER TABLE [dbo].[Hóa đơn bán]  WITH CHECK ADD  CONSTRAINT [FK_Hóa đơn bán_Bàn] FOREIGN KEY([Số bàn])
REFERENCES [dbo].[Bàn] ([Số bàn])
GO
ALTER TABLE [dbo].[Hóa đơn bán] CHECK CONSTRAINT [FK_Hóa đơn bán_Bàn]
GO
ALTER TABLE [dbo].[Hóa đơn bán]  WITH CHECK ADD  CONSTRAINT [FK_Hóa đơn bán_Đồ ăn] FOREIGN KEY([Mã đồ ăn])
REFERENCES [dbo].[Đồ ăn] ([Mã đồ ăn])
GO
ALTER TABLE [dbo].[Hóa đơn bán] CHECK CONSTRAINT [FK_Hóa đơn bán_Đồ ăn]
GO
ALTER TABLE [dbo].[Hóa đơn bán]  WITH CHECK ADD  CONSTRAINT [FK_Hóa đơn bán_Đồ uống] FOREIGN KEY([Mã đồ uống])
REFERENCES [dbo].[Đồ uống] ([Mã đồ uống])
GO
ALTER TABLE [dbo].[Hóa đơn bán] CHECK CONSTRAINT [FK_Hóa đơn bán_Đồ uống]
GO
ALTER TABLE [dbo].[Hóa đơn bán]  WITH CHECK ADD  CONSTRAINT [FK_Hóa đơn bán_Nhân viên] FOREIGN KEY([Mã nhân viên])
REFERENCES [dbo].[Nhân viên] ([Mã nhân viên])
GO
ALTER TABLE [dbo].[Hóa đơn bán] CHECK CONSTRAINT [FK_Hóa đơn bán_Nhân viên]
GO
USE [master]
GO
ALTER DATABASE [QLBH] SET  READ_WRITE 
GO
