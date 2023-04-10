USE [master]
GO
/****** Object:  Database [OtobusBilet]    Script Date: 10.04.2023 16:09:29 ******/
CREATE DATABASE [OtobusBilet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OtobusBilet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OtobusBilet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OtobusBilet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OtobusBilet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OtobusBilet] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [OtobusBilet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OtobusBilet] SET QUERY_STORE = OFF
GO
USE [OtobusBilet]
GO
/****** Object:  Table [dbo].[Calisan]    Script Date: 10.04.2023 16:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calisan](
	[Id] [int] NOT NULL,
	[CalisanTipID] [int] NULL,
	[Adi] [nvarchar](50) NULL,
	[Tcno] [char](11) NULL,
	[IseBaslamaTarihi] [date] NULL,
	[Cinsiyet] [char](1) NULL,
 CONSTRAINT [PK_Calisan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CalisanTip]    Script Date: 10.04.2023 16:09:29 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Güzergah]    Script Date: 10.04.2023 16:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Güzergah](
	[Id] [int] NOT NULL,
	[Sehir] [nchar](10) NULL,
 CONSTRAINT [PK_Güzergah] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 10.04.2023 16:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[Id] [int] NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[Cinsiyet] [char](1) NULL,
	[TcNo] [char](11) NULL,
	[Telefon] [char](10) NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Otobus]    Script Date: 10.04.2023 16:09:29 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sefer]    Script Date: 10.04.2023 16:09:29 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeferCalisan]    Script Date: 10.04.2023 16:09:29 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeferMusteri]    Script Date: 10.04.2023 16:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeferMusteri](
	[SeferID] [int] NOT NULL,
	[MusteriID] [int] NOT NULL,
	[KoltukNo] [tinyint] NULL,
	[BinisYeri] [int] NULL,
	[İnisYer] [int] NULL,
	[Ucret] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SeferMusteri] PRIMARY KEY CLUSTERED 
(
	[SeferID] ASC,
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Güzergah] ([Id], [Sehir]) VALUES (1, N'Edirne    ')
INSERT [dbo].[Güzergah] ([Id], [Sehir]) VALUES (2, N'İstanbul  ')
INSERT [dbo].[Güzergah] ([Id], [Sehir]) VALUES (3, N'Akseki    ')
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
ALTER TABLE [dbo].[SeferMusteri]  WITH CHECK ADD  CONSTRAINT [FK_SeferMusteri_Güzergah1] FOREIGN KEY([İnisYer])
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
USE [master]
GO
ALTER DATABASE [OtobusBilet] SET  READ_WRITE 
GO
