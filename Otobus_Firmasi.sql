USE [master]
GO
/****** Object:  Database [OtobusBilet]    Script Date: 29.04.2023 11:40:28 ******/
CREATE DATABASE [OtobusBilet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OtobusBilet', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\OtobusBilet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OtobusBilet_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\OtobusBilet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OtobusBilet] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OtobusBilet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OtobusBilet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OtobusBilet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OtobusBilet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OtobusBilet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OtobusBilet] SET ARITHABORT OFF 
GO
ALTER DATABASE [OtobusBilet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OtobusBilet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OtobusBilet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OtobusBilet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OtobusBilet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OtobusBilet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OtobusBilet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OtobusBilet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OtobusBilet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OtobusBilet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OtobusBilet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OtobusBilet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OtobusBilet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OtobusBilet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OtobusBilet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OtobusBilet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OtobusBilet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OtobusBilet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OtobusBilet] SET  MULTI_USER 
GO
ALTER DATABASE [OtobusBilet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OtobusBilet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OtobusBilet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OtobusBilet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OtobusBilet] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OtobusBilet]
GO
/****** Object:  User [SIMATIC HMI VIEWER User]    Script Date: 29.04.2023 11:40:28 ******/
CREATE USER [SIMATIC HMI VIEWER User] FOR LOGIN [DESKTOP-NIJEM97\SIMATIC HMI VIEWER]
GO
/****** Object:  User [SIMATIC HMI User]    Script Date: 29.04.2023 11:40:28 ******/
CREATE USER [SIMATIC HMI User] FOR LOGIN [DESKTOP-NIJEM97\SIMATIC HMI]
GO
/****** Object:  DatabaseRole [SIMATIC HMI VIEWER role]    Script Date: 29.04.2023 11:40:28 ******/
CREATE ROLE [SIMATIC HMI VIEWER role]
GO
/****** Object:  DatabaseRole [SIMATIC HMI role]    Script Date: 29.04.2023 11:40:28 ******/
CREATE ROLE [SIMATIC HMI role]
GO
ALTER ROLE [SIMATIC HMI VIEWER role] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [SIMATIC HMI role] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER role]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI role]
GO
/****** Object:  Table [dbo].[Calisan]    Script Date: 29.04.2023 11:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calisan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CalisanTipID] [int] NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[Tcno] [char](11) NULL,
	[IseBaslamaTarihi] [date] NULL,
	[Cinsiyet] [char](1) NULL,
 CONSTRAINT [PK_Calisan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CalisanTip]    Script Date: 29.04.2023 11:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalisanTip](
	[Id] [int] NOT NULL,
	[Unvan] [nvarchar](50) NULL,
 CONSTRAINT [PK_CalisanTip] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuzergahSefer]    Script Date: 29.04.2023 11:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuzergahSefer](
	[SeferId] [int] NOT NULL,
	[GuzergahId] [int] NOT NULL,
 CONSTRAINT [PK_GuzergahSefer] PRIMARY KEY CLUSTERED 
(
	[SeferId] ASC,
	[GuzergahId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Güzergah]    Script Date: 29.04.2023 11:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Güzergah](
	[Id] [int] NOT NULL,
	[Sehir] [nvarchar](50) NULL,
 CONSTRAINT [PK_Güzergah] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 29.04.2023 11:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[Cinsiyet] [char](1) NULL,
	[TcNo] [char](11) NULL,
	[Telefon] [char](13) NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Otobus]    Script Date: 29.04.2023 11:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Otobus](
	[OtobusId] [int] IDENTITY(1,1) NOT NULL,
	[Plaka] [nchar](10) NULL,
	[Marka] [nvarchar](50) NULL,
	[Firma] [nvarchar](50) NULL,
	[Koltuk] [tinyint] NULL,
 CONSTRAINT [PK_Otobus] PRIMARY KEY CLUSTERED 
(
	[OtobusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sefer]    Script Date: 29.04.2023 11:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sefer](
	[Id] [int] NOT NULL,
	[OtobusID] [int] NULL,
	[KalkisTarih/Saat] [datetime] NULL,
	[VarisTarih/Saat] [datetime] NULL,
	[YolculukSuresi] [tinyint] NULL,
 CONSTRAINT [PK_Sefer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeferCalisan]    Script Date: 29.04.2023 11:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeferCalisan](
	[SeferID] [int] NOT NULL,
	[CalisanID] [int] NOT NULL,
 CONSTRAINT [PK_SeferCalisan] PRIMARY KEY CLUSTERED 
(
	[SeferID] ASC,
	[CalisanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeferMusteri]    Script Date: 29.04.2023 11:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeferMusteri](
	[SeferID] [int] NOT NULL,
	[MusteriID] [int] NOT NULL,
	[KoltukNo] [tinyint] NULL,
	[BinisYeri] [int] NULL,
	[İnisYeri] [int] NULL,
	[Ucret] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SeferMusteri] PRIMARY KEY CLUSTERED 
(
	[SeferID] ASC,
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Calisan] ON 

INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (1, 5, N'İhsan', N'Kaya kutlu', N'87615637990', CAST(N'2003-12-18' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (2, 4, N'Birdal', N'Akdeniz', N'29419713510', CAST(N'1974-09-27' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (3, 2, N'İnkiyadullah', N'Çilesiz', N'13943628557', CAST(N'2018-12-02' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (4, 1, N'Özkurt', N'İspir', N'50832160526', CAST(N'1995-09-20' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (5, 2, N'Cabiye', N'Şarapnal', N'67635765756', CAST(N'1988-06-20' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (6, 2, N'Pelinsu', N'Görgeç', N'56553908788', CAST(N'1973-12-31' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (7, 6, N'Halaskar', N'Dere', N'49394298326', CAST(N'2003-11-17' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (8, 3, N'Belge', N'Değirmenci', N'72997555785', CAST(N'2005-09-29' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (9, 5, N'Peyma', N'Ağca', N'33909692672', CAST(N'1970-04-19' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (10, 3, N'Ersin', N'Gültekin', N'75477358472', CAST(N'2004-01-28' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (11, 2, N'Türksever', N'Öznur çat', N'76323030372', CAST(N'2021-08-21' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (12, 4, N'Dursunali', N'Durbak', N'61932829705', CAST(N'1978-11-21' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (13, 3, N'Özaltan', N'Günergök', N'85370906233', CAST(N'1973-10-31' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (14, 5, N'Orgül', N'Vargeloğlu', N'68053657345', CAST(N'1984-05-25' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (15, 2, N'Özkayra', N'Adak', N'28171425020', CAST(N'2013-09-15' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (16, 2, N'Türkan', N'Aycıl', N'56652001054', CAST(N'2001-09-26' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (17, 6, N'Devran', N'Akbulut', N'83924771644', CAST(N'1977-04-27' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (18, 5, N'Güliz', N'Cücemen', N'64785071797', CAST(N'2005-11-25' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (19, 5, N'Berfin', N'Deregözü', N'10012567949', CAST(N'2010-07-12' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (20, 7, N'Sani', N'Düzova', N'31900347685', CAST(N'1994-12-25' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (21, 1, N'Berk Yaruk', N'Yalçın durmuş', N'41146101799', CAST(N'1975-09-05' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (22, 1, N'Mukime', N'Sütçü', N'34487026624', CAST(N'1991-10-07' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (23, 2, N'Sellem', N'Tekerek', N'49358260182', CAST(N'1973-05-29' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (24, 3, N'Serol', N'Kutsal', N'47166222848', CAST(N'1993-01-06' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (25, 5, N'Baki', N'Koşar ağdemir', N'30706991746', CAST(N'2016-03-11' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (26, 2, N'Esendağ', N'Dilmen', N'68020020716', CAST(N'1991-05-18' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (27, 2, N'İlknur', N'Kıstırak', N'76735503709', CAST(N'1981-07-12' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (28, 3, N'Müstenir', N'Özler', N'25885753863', CAST(N'1996-11-22' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (29, 4, N'Süzen', N'Karayiğit', N'11114879865', CAST(N'1971-04-15' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (30, 1, N'Naki', N'Gülezgin', N'69283509145', CAST(N'2018-12-16' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (31, 4, N'Argu', N'Bitmez', N'33142322799', CAST(N'2016-02-10' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (32, 4, N'Ebu Cehil', N'Şiray aslan', N'28843815010', CAST(N'1970-01-02' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (33, 6, N'Sermelek', N'Elik', N'63778012691', CAST(N'1993-03-17' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (34, 2, N'Soysaltürk', N'Kızılkaya', N'36736684164', CAST(N'1976-05-10' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (35, 3, N'Zakire', N'Yiğittürk', N'36298491768', CAST(N'1991-12-26' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (36, 6, N'Yekbun', N'Turan', N'44760379525', CAST(N'1980-05-24' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (37, 1, N'Alperay', N'Ekin', N'11299777756', CAST(N'2022-11-21' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (38, 3, N'Tebşire', N'Hakan', N'75685299923', CAST(N'1999-08-22' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (39, 6, N'Özkutal', N'Ökdemir', N'74355096609', CAST(N'1994-11-05' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (40, 6, N'Dilsaz', N'Atıcı', N'50503088229', CAST(N'2006-03-19' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (41, 2, N'Tesrir', N'Ünsever yaprak', N'19230296502', CAST(N'1995-03-17' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (42, 4, N'Ferda', N'Bulut tekin', N'12082536653', CAST(N'1983-02-14' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (43, 2, N'Erdeşir', N'Hasırcıoğlu', N'30464802184', CAST(N'1985-12-16' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (44, 3, N'Pekgöz', N'Poyraz', N'17611964666', CAST(N'1995-12-22' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (45, 5, N'Nuşirevan', N'Demiryürek', N'87219571287', CAST(N'1989-10-13' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (46, 1, N'Ubab', N'Dinler', N'96236133390', CAST(N'2011-05-14' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (47, 4, N'Manzure', N'Kara gökçen', N'41401474948', CAST(N'1987-10-20' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (48, 3, N'Kıyas', N'Küçükelçi', N'83524266487', CAST(N'1970-04-16' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (49, 1, N'İstemi', N'Ölmez', N'42085715873', CAST(N'1981-04-02' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (50, 7, N'Cihansuz', N'Aytaç', N'64980201576', CAST(N'1984-02-22' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (51, 6, N'Yanaç', N'Zorarpacı', N'51992500193', CAST(N'2004-11-02' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (52, 4, N'Mahperver', N'İbar', N'76410161183', CAST(N'2011-06-07' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (53, 7, N'Yaver', N'Baran', N'93700180386', CAST(N'1972-04-04' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (54, 3, N'Elburz', N'Aydın özgül', N'41593793588', CAST(N'1991-11-13' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (55, 3, N'Güssem', N'Daltaban', N'12766345838', CAST(N'1980-07-23' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (56, 5, N'Gülsuna', N'Poyraz', N'62493881345', CAST(N'1981-02-13' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (57, 3, N'Abade', N'Akkoyun', N'93966640701', CAST(N'1970-06-07' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (58, 6, N'Uludağ', N'Ünlü', N'50788992452', CAST(N'1983-01-24' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (59, 2, N'Cemalleddin', N'Göktürk ince', N'47316600842', CAST(N'1985-12-13' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (60, 6, N'Garib', N'Kuyucu', N'66626018472', CAST(N'1975-03-25' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (61, 2, N'Ergunalp', N'İmrek', N'97614728970', CAST(N'1993-02-13' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (62, 5, N'Nasuh', N'Kuru', N'36615873646', CAST(N'2021-04-14' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (63, 7, N'Semiramis', N'Meral çiftçi', N'27491119382', CAST(N'2020-05-28' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (64, 6, N'Candan', N'Şakir', N'26875190024', CAST(N'1971-11-01' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (65, 3, N'Mefharet', N'Ağrıdağ', N'14292541477', CAST(N'2007-10-05' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (66, 6, N'İlgar', N'Tuncay', N'38781900839', CAST(N'2016-04-26' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (67, 2, N'Vüreyka', N'Avşar polattaş', N'42954156163', CAST(N'2013-01-23' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (68, 2, N'Kürümer', N'Çağrıtekin', N'96715681311', CAST(N'2014-03-02' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (69, 5, N'Mete', N'Demiral', N'86338730206', CAST(N'1995-10-31' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (70, 3, N'Sülvane', N'Küllü', N'96903757482', CAST(N'1987-11-10' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (71, 6, N'Ataman', N'Kızıl', N'30979031268', CAST(N'1994-05-16' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (72, 3, N'Mübtehic', N'Aksan', N'44896391058', CAST(N'1974-03-29' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (73, 1, N'Akalp', N'Karaslan', N'10263978378', CAST(N'2006-03-14' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (74, 1, N'Tekindağ', N'Arıcıoğlu', N'31859198176', CAST(N'1988-07-10' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (75, 2, N'Özgülüm', N'Berk', N'73491864795', CAST(N'2016-12-02' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (76, 2, N'Hidayet', N'Yılkınç aycan', N'88731468144', CAST(N'1999-12-02' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (77, 3, N'Sevan', N'Arkadaş', N'26046894547', CAST(N'2019-11-23' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (78, 1, N'Ganimet', N'Toprak', N'56535202757', CAST(N'2006-06-24' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (79, 1, N'Belik', N'Göçmen', N'34682839828', CAST(N'2008-06-05' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (80, 5, N'Gilman', N'Aytin', N'26168359687', CAST(N'1975-02-17' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (81, 3, N'Azref', N'Fikirli', N'33613366365', CAST(N'1981-11-05' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (82, 2, N'Oğurata', N'Alan', N'36570459962', CAST(N'1992-04-17' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (83, 2, N'Tüvanger', N'Keçeli', N'24320177942', CAST(N'1978-09-10' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (84, 3, N'Saykal', N'Gökçe gür', N'36847338861', CAST(N'2005-10-08' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (85, 2, N'Namver', N'Baz', N'89088201887', CAST(N'1997-11-27' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (86, 3, N'Devrim', N'Kocabaş', N'18144388154', CAST(N'1987-11-27' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (87, 1, N'Oruz', N'Polat günata', N'11373850665', CAST(N'2020-05-17' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (88, 6, N'Şefik', N'Gezek', N'55630074117', CAST(N'1989-12-15' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (89, 5, N'Berat', N'Söyler', N'30500321217', CAST(N'2007-08-27' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (90, 7, N'Hayrat', N'Dikmen', N'80834169386', CAST(N'1980-08-31' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (91, 1, N'Direm', N'Abat', N'67653731340', CAST(N'2019-10-17' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (92, 1, N'Sevgi', N'Doğru', N'84578730366', CAST(N'1982-04-12' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (93, 1, N'Aygün', N'Bellur', N'97101790770', CAST(N'2022-02-06' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (94, 6, N'Orun', N'Erdim', N'23375418461', CAST(N'2007-06-22' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (95, 1, N'Hüsmen', N'Demirci', N'49969610459', CAST(N'1976-07-21' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (96, 3, N'Sevi', N'Menekşe', N'12046364525', CAST(N'1998-08-02' AS Date), N'K')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (97, 3, N'Ürüşan', N'Örnek', N'47517944133', CAST(N'2023-02-06' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (98, 1, N'Ebecen', N'Akgedik', N'65680860340', CAST(N'2005-03-10' AS Date), N'E')
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (99, 5, N'Kasım', N'Badıllı', N'62787881853', CAST(N'1985-05-18' AS Date), N'E')
GO
INSERT [dbo].[Calisan] ([Id], [CalisanTipID], [Adi], [Soyadi], [Tcno], [IseBaslamaTarihi], [Cinsiyet]) VALUES (100, 5, N'Ager', N'Kayadan', N'15916065158', CAST(N'1983-08-07' AS Date), N'K')
SET IDENTITY_INSERT [dbo].[Calisan] OFF
GO
INSERT [dbo].[CalisanTip] ([Id], [Unvan]) VALUES (1, N'Muavin')
INSERT [dbo].[CalisanTip] ([Id], [Unvan]) VALUES (2, N'Şoför')
INSERT [dbo].[CalisanTip] ([Id], [Unvan]) VALUES (3, N'Patron')
INSERT [dbo].[CalisanTip] ([Id], [Unvan]) VALUES (4, N'Yazane Çalışanı')
INSERT [dbo].[CalisanTip] ([Id], [Unvan]) VALUES (5, N'Müdür')
INSERT [dbo].[CalisanTip] ([Id], [Unvan]) VALUES (6, N'Sekreter')
INSERT [dbo].[CalisanTip] ([Id], [Unvan]) VALUES (7, N'Servis elemanı')
GO
INSERT [dbo].[Güzergah] ([Id], [Sehir]) VALUES (1, N'Edirne    ')
INSERT [dbo].[Güzergah] ([Id], [Sehir]) VALUES (2, N'İstanbul  ')
INSERT [dbo].[Güzergah] ([Id], [Sehir]) VALUES (3, N'Akseki    ')
GO
SET IDENTITY_INSERT [dbo].[Musteri] ON 

INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (1, N'Pakize', N'Hayat', N'K', N'81728517278', N'5346987541   ')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (2, N'Kamil', N'Yaratık', N'E', N'60811171498', N'5792154897   ')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (3, N'Leyla', N'Değirmenci', N'K', N'84783553878', N'6579421542   ')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (4, N'Necla', N'çelik', N'E', N'40798428686', N'8757842154   ')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (5, N'Nadim', N'Tarbak', N'K', N'13392578503', N'519 693 50 96')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (6, N'Abdulkadir', N'Çekici', N'E', N'43234035084', N'593 395 19 81')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (7, N'Serkut', N'İncebey', N'K', N'97417551671', N'596 922 72 42')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (8, N'Gülbahar', N'Gürel', N'K', N'60648700494', N'526 195 05 68')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (9, N'Berire', N'Bişi', N'E', N'36860922650', N'580 217 45 77')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (10, N'Dimen', N'Çalı', N'K', N'62864666647', N'537 900 02 77')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (11, N'Şemsinisa', N'Köz', N'E', N'84882234309', N'524 237 50 94')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (12, N'Kelime', N'Durmaz kaya', N'K', N'47456424909', N'501 683 42 93')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (13, N'Ersen', N'Tuğtekin', N'K', N'68751782856', N'550 867 90 69')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (14, N'Emanullah', N'Gürel', N'E', N'21665149541', N'577 991 61 81')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (15, N'Mürvet', N'Kasapoğlu', N'E', N'85740369416', N'553 513 04 50')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (16, N'Aksen', N'Yaldız inal', N'E', N'98999832660', N'580 774 69 56')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (17, N'Rağbet', N'Akar', N'E', N'66588784085', N'576 137 00 80')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (18, N'Zeyyal', N'Evegü', N'K', N'15399043494', N'533 495 57 19')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (19, N'Biat', N'Kaçin', N'K', N'13324579429', N'542 579 45 51')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (20, N'Vafid', N'Baz', N'K', N'93143274665', N'525 680 76 90')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (21, N'Bozyel', N'Ertuğ demir', N'K', N'71887343197', N'539 414 76 73')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (22, N'Ümmet', N'Özçırpıcı', N'E', N'23558481563', N'533 540 02 24')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (23, N'Huzur', N'Timurkaan', N'E', N'96622330008', N'565 276 82 82')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (24, N'Sungurtekin', N'Kazan', N'K', N'79266152929', N'568 216 71 62')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (25, N'İstem', N'Kaba', N'K', N'98354256637', N'583 976 85 79')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (26, N'Kuhistan', N'Karatekin', N'K', N'94650012521', N'538 451 03 63')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (27, N'Haliddin', N'Bekiroğlu', N'E', N'87057765333', N'541 764 64 01')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (28, N'Reşat', N'Çamurlu', N'K', N'82237571271', N'588 153 49 77')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (29, N'Rutkay', N'Kara', N'K', N'44390820651', N'512 548 96 21')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (30, N'Sevik', N'Altunışık', N'K', N'83115185533', N'599 467 29 74')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (31, N'Evrensel', N'Öksüztepe', N'K', N'38018173235', N'545 976 87 05')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (32, N'Tansan', N'Uğur koç', N'K', N'54280196614', N'582 590 48 90')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (33, N'Periveş', N'Gültaş', N'K', N'28438611133', N'567 527 22 68')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (34, N'Hikmeddin', N'Algül', N'E', N'51876778905', N'510 571 94 03')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (35, N'Mürşit', N'Tuğral', N'K', N'35117895507', N'592 995 43 54')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (36, N'Peyman', N'Canyurt', N'E', N'21517427562', N'561 550 90 49')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (37, N'Bahadır', N'Delen', N'K', N'52096994201', N'599 372 13 31')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (38, N'Hüsameddin', N'Aktan', N'E', N'79835313296', N'508 646 76 19')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (39, N'Özgülay', N'Ağdaş', N'K', N'68283571249', N'539 753 01 78')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (40, N'Acer', N'Dinçeler', N'E', N'85666510774', N'525 357 75 84')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (41, N'Rasif', N'Yağır', N'E', N'58121881536', N'542 791 60 32')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (42, N'Rabıt', N'Kayabaş', N'K', N'11430328582', N'517 420 28 58')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (43, N'Gülüşan', N'Üner', N'K', N'30741327693', N'511 648 83 40')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (44, N'Oksu', N'Yılmaz vadi', N'K', N'26391306612', N'513 280 53 15')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (45, N'Denizhan', N'Güdücü', N'E', N'14807548235', N'567 831 36 27')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (46, N'Biat', N'Tulu', N'E', N'26939733373', N'525 332 11 29')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (47, N'Ulvi', N'Solmazgül ergör', N'K', N'21118896329', N'574 815 19 91')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (48, N'Vefi', N'Gökçegöz', N'K', N'88040679630', N'581 855 54 00')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (49, N'Amire', N'Kıllı', N'K', N'93051086776', N'532 748 05 33')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (50, N'Kebir', N'Gökçe', N'E', N'17534773522', N'511 115 87 72')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (51, N'Bahra', N'Karamızrak', N'E', N'37060471143', N'597 664 89 31')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (52, N'Bağlam', N'Zeybek', N'K', N'37904661953', N'525 407 97 01')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (53, N'Seher', N'Seziş', N'E', N'49228374332', N'579 243 54 33')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (54, N'Mutasım', N'Gökuç', N'E', N'10824308955', N'551 238 72 09')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (55, N'Yılhan', N'Gebedek', N'K', N'25545624694', N'512 903 03 42')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (56, N'Durucan', N'Ekmekyapar', N'K', N'31165134564', N'567 984 26 19')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (57, N'Petek', N'Kürkçü', N'E', N'28799640489', N'523 406 32 59')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (58, N'Nermin', N'Sevim pehlivan', N'E', N'44281603961', N'507 814 80 50')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (59, N'Vala', N'Özyazgan', N'K', N'51297707535', N'535 772 43 49')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (60, N'Ogün', N'Coşut', N'E', N'38187897467', N'576 972 69 96')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (61, N'Sipas', N'Beşli', N'E', N'76081647128', N'591 783 85 50')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (62, N'Tandan', N'Selçuk börlü', N'E', N'13607056513', N'541 707 00 85')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (63, N'Koray', N'Taşcı', N'K', N'66850010796', N'594 566 65 62')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (64, N'Ukde', N'Sağın', N'E', N'76885081623', N'504 954 64 06')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (65, N'Necile', N'Kocabaş', N'K', N'62432075183', N'518 225 08 79')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (66, N'Siyaset', N'Aslan imrek', N'E', N'37000771709', N'535 166 19 61')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (67, N'Dilsafa', N'Apaydın kelleş', N'K', N'73380776048', N'516 296 83 75')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (68, N'Arıç', N'Yalçınsoy', N'K', N'74325008219', N'547 787 39 48')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (69, N'Uğurel', N'Kurtoğlu', N'K', N'94228844774', N'563 652 59 56')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (70, N'Abdülhakem', N'Selen', N'K', N'29964650005', N'547 471 07 61')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (71, N'Sontaç', N'Eriş', N'K', N'51778829927', N'502 919 81 63')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (72, N'Razi', N'Taş şahin', N'E', N'88785936089', N'545 787 18 16')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (73, N'Ebubekir', N'Yaycı', N'E', N'52978900369', N'599 107 06 57')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (74, N'Eretna', N'Çöpatlamaz', N'K', N'73045442085', N'525 614 69 86')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (75, N'Tansık', N'Kodaş', N'K', N'96011061027', N'524 854 59 48')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (76, N'Adaleddin', N'Emiroğlu', N'K', N'51819746705', N'518 533 13 65')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (77, N'Abuzer', N'Tımur', N'E', N'76142736757', N'550 387 46 69')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (78, N'Cihannur', N'Yakut', N'K', N'60152538867', N'514 721 94 37')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (79, N'Oben', N'Aşir', N'K', N'40362849170', N'544 210 14 79')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (80, N'Ziynet', N'Coşkungül', N'E', N'59147571151', N'575 980 94 75')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (81, N'Lazım', N'Güngördü', N'E', N'80732371918', N'587 246 34 58')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (82, N'Busena', N'Dolanbay', N'E', N'61348516706', N'524 915 83 41')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (83, N'Safiyullah', N'Özer', N'E', N'28573185356', N'522 999 68 41')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (84, N'Vala', N'Akdoğanlı', N'K', N'97286451780', N'515 388 48 43')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (85, N'Şeküre', N'Taner', N'K', N'86948315219', N'559 131 08 39')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (86, N'İlkcan', N'Çağırman', N'K', N'46800346110', N'542 706 85 38')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (87, N'Faden', N'Keskinkılıç', N'K', N'87163439368', N'557 131 27 48')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (88, N'Müştak', N'Yağır', N'K', N'24015304789', N'592 960 17 16')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (89, N'Telvin', N'Emre', N'E', N'46540057290', N'502 338 53 20')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (90, N'Tezkan', N'Sanrı', N'E', N'11672022973', N'564 189 42 07')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (91, N'Atasagun', N'Çelikalp', N'K', N'47896352356', N'542 532 79 61')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (92, N'Erkutay', N'Titiz', N'K', N'98637870973', N'519 406 93 50')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (93, N'Aslıhan', N'Siğergök', N'K', N'65193841650', N'591 997 36 56')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (94, N'Sevenay', N'Yaycı', N'E', N'48626778612', N'508 793 15 66')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (95, N'Peyma', N'Tekçe', N'K', N'96951441862', N'570 658 39 74')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (96, N'Tangün', N'Takmaz', N'K', N'20424102653', N'575 625 41 04')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (97, N'Kaim', N'Kurban', N'K', N'97573783717', N'584 710 98 35')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (98, N'Ehlimen', N'Özbilge', N'K', N'91132373551', N'554 847 58 15')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (99, N'Rahmiye', N'Tekintaş', N'K', N'78210600718', N'565 236 00 71')
GO
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (100, N'Hibe', N'Fidan', N'E', N'72507701313', N'545 126 75 43')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (101, N'Iknat', N'Öcal kısacık', N'E', N'85221586436', N'559 552 36 04')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (102, N'Mükrem', N'Cansız', N'K', N'85839680809', N'575 659 54 48')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (103, N'Baha', N'Şavran', N'E', N'31130622768', N'536 329 05 38')
INSERT [dbo].[Musteri] ([Id], [Adi], [Soyadi], [Cinsiyet], [TcNo], [Telefon]) VALUES (104, N'Nasreddin', N'Varhan', N'K', N'16875003600', N'551 828 35 82')
SET IDENTITY_INSERT [dbo].[Musteri] OFF
GO
SET IDENTITY_INSERT [dbo].[Otobus] ON 

INSERT [dbo].[Otobus] ([OtobusId], [Plaka], [Marka], [Firma], [Koltuk]) VALUES (1, N'34UB212   ', N'Man', N'Ugur', 34)
SET IDENTITY_INSERT [dbo].[Otobus] OFF
GO
ALTER TABLE [dbo].[Calisan] ADD  CONSTRAINT [DF_Calisan_IseBaslamaTarihi]  DEFAULT (getdate()) FOR [IseBaslamaTarihi]
GO
ALTER TABLE [dbo].[Otobus] ADD  CONSTRAINT [DF_Otobus_Plaka]  DEFAULT (N'34U34') FOR [Plaka]
GO
ALTER TABLE [dbo].[Calisan]  WITH CHECK ADD  CONSTRAINT [FK_Calisan_CalisanTip] FOREIGN KEY([CalisanTipID])
REFERENCES [dbo].[CalisanTip] ([Id])
GO
ALTER TABLE [dbo].[Calisan] CHECK CONSTRAINT [FK_Calisan_CalisanTip]
GO
ALTER TABLE [dbo].[GuzergahSefer]  WITH CHECK ADD  CONSTRAINT [FK_GuzergahSefer_Güzergah] FOREIGN KEY([GuzergahId])
REFERENCES [dbo].[Güzergah] ([Id])
GO
ALTER TABLE [dbo].[GuzergahSefer] CHECK CONSTRAINT [FK_GuzergahSefer_Güzergah]
GO
ALTER TABLE [dbo].[GuzergahSefer]  WITH CHECK ADD  CONSTRAINT [FK_GuzergahSefer_Sefer] FOREIGN KEY([SeferId])
REFERENCES [dbo].[Sefer] ([Id])
GO
ALTER TABLE [dbo].[GuzergahSefer] CHECK CONSTRAINT [FK_GuzergahSefer_Sefer]
GO
ALTER TABLE [dbo].[Sefer]  WITH CHECK ADD  CONSTRAINT [FK_Sefer_Otobus] FOREIGN KEY([OtobusID])
REFERENCES [dbo].[Otobus] ([OtobusId])
GO
ALTER TABLE [dbo].[Sefer] CHECK CONSTRAINT [FK_Sefer_Otobus]
GO
ALTER TABLE [dbo].[SeferCalisan]  WITH CHECK ADD  CONSTRAINT [FK_SeferCalisan_Calisan] FOREIGN KEY([CalisanID])
REFERENCES [dbo].[Calisan] ([Id])
GO
ALTER TABLE [dbo].[SeferCalisan] CHECK CONSTRAINT [FK_SeferCalisan_Calisan]
GO
ALTER TABLE [dbo].[SeferCalisan]  WITH CHECK ADD  CONSTRAINT [FK_SeferCalisan_Sefer] FOREIGN KEY([CalisanID])
REFERENCES [dbo].[Sefer] ([Id])
GO
ALTER TABLE [dbo].[SeferCalisan] CHECK CONSTRAINT [FK_SeferCalisan_Sefer]
GO
ALTER TABLE [dbo].[SeferMusteri]  WITH CHECK ADD  CONSTRAINT [FK_SeferMusteri_Güzergah] FOREIGN KEY([BinisYeri])
REFERENCES [dbo].[Güzergah] ([Id])
GO
ALTER TABLE [dbo].[SeferMusteri] CHECK CONSTRAINT [FK_SeferMusteri_Güzergah]
GO
ALTER TABLE [dbo].[SeferMusteri]  WITH CHECK ADD  CONSTRAINT [FK_SeferMusteri_Güzergah1] FOREIGN KEY([İnisYeri])
REFERENCES [dbo].[Güzergah] ([Id])
GO
ALTER TABLE [dbo].[SeferMusteri] CHECK CONSTRAINT [FK_SeferMusteri_Güzergah1]
GO
ALTER TABLE [dbo].[SeferMusteri]  WITH CHECK ADD  CONSTRAINT [FK_SeferMusteri_Musteri] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Musteri] ([Id])
GO
ALTER TABLE [dbo].[SeferMusteri] CHECK CONSTRAINT [FK_SeferMusteri_Musteri]
GO
ALTER TABLE [dbo].[SeferMusteri]  WITH CHECK ADD  CONSTRAINT [FK_SeferMusteri_Sefer] FOREIGN KEY([SeferID])
REFERENCES [dbo].[Sefer] ([Id])
GO
ALTER TABLE [dbo].[SeferMusteri] CHECK CONSTRAINT [FK_SeferMusteri_Sefer]
GO
/****** Object:  DdlTrigger [OnTriggerDboSchema]    Script Date: 29.04.2023 11:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [OnTriggerDboSchema] ON database FOR create_table, create_view AS BEGIN   DECLARE @xmlEventData xml   SELECT    @xmlEventData = eventdata()   DECLARE @schemaName nvarchar(max)   DECLARE @objectName nvarchar(max)   DECLARE @DynSql nvarchar(max)      SET @schemaName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/SchemaName/text()'))   SET @objectName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/ObjectName/text()'))   IF(@schemaName='')   BEGIN     SET @DynSql = N'alter schema [dbo] transfer [' + @schemaName + N'].[' + @objectName + N']'     EXEC sp_executesql @statement=@DynSql   END END SET QUOTED_IDENTIFIER ON SET ANSI_NULLS ON 
GO
ENABLE TRIGGER [OnTriggerDboSchema] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [OtobusBilet] SET  READ_WRITE 
GO
