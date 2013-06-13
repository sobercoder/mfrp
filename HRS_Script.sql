USE [master]
GO
/****** Object:  Database [HRS]    Script Date: 06/13/2013 18:22:40 ******/
CREATE DATABASE [HRS] ON  PRIMARY 
( NAME = N'HRS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL2008R2\MSSQL\DATA\HRS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HRS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL2008R2\MSSQL\DATA\HRS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HRS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HRS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [HRS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [HRS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [HRS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [HRS] SET ARITHABORT OFF
GO
ALTER DATABASE [HRS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [HRS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [HRS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [HRS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [HRS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [HRS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [HRS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [HRS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [HRS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [HRS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [HRS] SET  DISABLE_BROKER
GO
ALTER DATABASE [HRS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [HRS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [HRS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [HRS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [HRS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [HRS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [HRS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [HRS] SET  READ_WRITE
GO
ALTER DATABASE [HRS] SET RECOVERY FULL
GO
ALTER DATABASE [HRS] SET  MULTI_USER
GO
ALTER DATABASE [HRS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [HRS] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'HRS', N'ON'
GO
USE [HRS]
GO
/****** Object:  Table [dbo].[tblRoomTypes]    Script Date: 06/13/2013 18:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoomTypes](
  [RoomTypeId] [int] NOT NULL,
	[RoomType] [nvarchar](10) NOT NULL,
	[RoomDesc] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblRoomTypes] PRIMARY KEY CLUSTERED 
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBankDtls]    Script Date: 06/13/2013 18:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBankDtls](
	[BankID] [nvarchar](16) NOT NULL,
	[BankName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblBankDtls] PRIMARY KEY CLUSTERED 
(
	[BankID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomerDtls]    Script Date: 06/13/2013 18:22:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomerDtls](
	[CustomerId] [nvarchar](5) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Age] [int] NOT NULL,
	[CustomerType] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[PinCode] [int] NOT NULL,
 CONSTRAINT [PK_tblCustomerDtls] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocationDtls]    Script Date: 06/13/2013 18:22:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocationDtls](
	[CityID] [nvarchar](10) NOT NULL,
	[Country] [nvarchar](10) NOT NULL,
	[State] [nvarchar](10) NOT NULL,
	[City] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tblLocationDtls] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Country] ASC,
	[State] ASC,
	[City] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotelDetails]    Script Date: 06/13/2013 18:22:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotelDetails](
	[HotelId] [nvarchar](8) NOT NULL,
	[HotelName] [nvarchar](20) NOT NULL,
	[CityId] [nvarchar](10) NOT NULL,
	[HotelDesc] [nvarchar](150) NOT NULL,
	[AcRoom] [int] NOT NULL,
	[NonAcRoom] [int] NOT NULL,
	[TotalRoom] [int] NOT NULL,
 CONSTRAINT [PK_tblHotelDetails] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBookingDtls]    Script Date: 06/13/2013 18:22:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookingDtls](
	[CustomerId] [nvarchar](5) NOT NULL,
	[BookingId] [nvarchar](10) NOT NULL,
	[BookingDate] [date] NOT NULL,
	[HotelId] [nvarchar](8) NOT NULL,
	[FromDt] [date] NOT NULL,
	[ToDt] [date] NOT NULL,
	[NoOfAdults] [int] NOT NULL,
	[NoOfNights] [int] NOT NULL,
	[NoOfChild] [int] NOT NULL,
	[BillAmount] [money] NOT NULL,
	[TotalACRooms] [int] NOT NULL,
	[TotalNonACRooms] [int] NOT NULL,
 CONSTRAINT [PK_tblBookingDtls_1] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VRoomAvailability]    Script Date: 06/13/2013 18:22:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VRoomAvailability](
	[HotelId] [nvarchar](8) NOT NULL,
	[AvailableNonAcRooms] [int] NOT NULL,
	[OccupiedNonAcRooms] [int] NOT NULL,
	[AvailableAcRooms] [int] NOT NULL,
	[OccupiedAcRooms] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoomRates]    Script Date: 06/13/2013 18:22:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoomRates](
	[HotelId] [nvarchar](8) NOT NULL,
	[RoomTypeId] [int] NOT NULL,
	[RatePerNightChildren] [int] NOT NULL,
	[RatePerNightAdults] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblRoomRates] ON [dbo].[tblRoomRates] 
(
	[HotelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentDtls]    Script Date: 06/13/2013 18:22:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPaymentDtls](
	[TransactionId] [nvarchar](50) NOT NULL,
	[CustomerId] [nvarchar](5) NOT NULL,
	[BookingId] [nvarchar](10) NOT NULL,
	[CardNumber] [int] NOT NULL,
	[CardType] [nvarchar](10) NOT NULL,
	[NameOnCard] [varbinary](30) NOT NULL,
	[ExpiryDt] [nvarchar](10) NOT NULL,
	[Cvv] [int] NOT NULL,
	[AccNo] [int] NOT NULL,
	[Pin] [int] NOT NULL,
	[BankId] [nvarchar](16) NOT NULL,
	[PaidAmount] [money] NOT NULL,
	[PaymentDt] [date] NOT NULL,
 CONSTRAINT [PK_tblPaymentDtls] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_tblHotelDetails_tblLocationDtls]    Script Date: 06/13/2013 18:22:44 ******/
ALTER TABLE [dbo].[tblHotelDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblHotelDetails_tblLocationDtls] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblLocationDtls] ([CityID])
GO
ALTER TABLE [dbo].[tblHotelDetails] CHECK CONSTRAINT [FK_tblHotelDetails_tblLocationDtls]
GO
/****** Object:  ForeignKey [FK_tblBookingDtls_tblCustomerDtls]    Script Date: 06/13/2013 18:22:44 ******/
ALTER TABLE [dbo].[tblBookingDtls]  WITH CHECK ADD  CONSTRAINT [FK_tblBookingDtls_tblCustomerDtls] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tblCustomerDtls] ([CustomerId])
GO
ALTER TABLE [dbo].[tblBookingDtls] CHECK CONSTRAINT [FK_tblBookingDtls_tblCustomerDtls]
GO
/****** Object:  ForeignKey [FK_tblBookingDtls_tblCustomerDtls1]    Script Date: 06/13/2013 18:22:44 ******/
ALTER TABLE [dbo].[tblBookingDtls]  WITH CHECK ADD  CONSTRAINT [FK_tblBookingDtls_tblCustomerDtls1] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tblCustomerDtls] ([CustomerId])
GO
ALTER TABLE [dbo].[tblBookingDtls] CHECK CONSTRAINT [FK_tblBookingDtls_tblCustomerDtls1]
GO
/****** Object:  ForeignKey [FK_tblBookingDtls_tblHotelDetails]    Script Date: 06/13/2013 18:22:44 ******/
ALTER TABLE [dbo].[tblBookingDtls]  WITH CHECK ADD  CONSTRAINT [FK_tblBookingDtls_tblHotelDetails] FOREIGN KEY([HotelId])
REFERENCES [dbo].[tblHotelDetails] ([HotelId])
GO
ALTER TABLE [dbo].[tblBookingDtls] CHECK CONSTRAINT [FK_tblBookingDtls_tblHotelDetails]
GO
/****** Object:  ForeignKey [FK_VRoomAvailability_tblHotelDetails]    Script Date: 06/13/2013 18:22:44 ******/
ALTER TABLE [dbo].[VRoomAvailability]  WITH CHECK ADD  CONSTRAINT [FK_VRoomAvailability_tblHotelDetails] FOREIGN KEY([HotelId])
REFERENCES [dbo].[tblHotelDetails] ([HotelId])
GO
ALTER TABLE [dbo].[VRoomAvailability] CHECK CONSTRAINT [FK_VRoomAvailability_tblHotelDetails]
GO
/****** Object:  ForeignKey [FK_tblRoomRates_tblHotelDetails]    Script Date: 06/13/2013 18:22:44 ******/
ALTER TABLE [dbo].[tblRoomRates]  WITH CHECK ADD  CONSTRAINT [FK_tblRoomRates_tblHotelDetails] FOREIGN KEY([HotelId])
REFERENCES [dbo].[tblHotelDetails] ([HotelId])
GO
ALTER TABLE [dbo].[tblRoomRates] CHECK CONSTRAINT [FK_tblRoomRates_tblHotelDetails]
GO
/****** Object:  ForeignKey [FK_tblRoomRates_tblRoomTypes]    Script Date: 06/13/2013 18:22:44 ******/
ALTER TABLE [dbo].[tblRoomRates]  WITH CHECK ADD  CONSTRAINT [FK_tblRoomRates_tblRoomTypes] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[tblRoomTypes] ([RoomTypeId])
GO
ALTER TABLE [dbo].[tblRoomRates] CHECK CONSTRAINT [FK_tblRoomRates_tblRoomTypes]
GO
/****** Object:  ForeignKey [FK_tblPaymentDtls_tblBankDtls]    Script Date: 06/13/2013 18:22:44 ******/
ALTER TABLE [dbo].[tblPaymentDtls]  WITH CHECK ADD  CONSTRAINT [FK_tblPaymentDtls_tblBankDtls] FOREIGN KEY([BankId])
REFERENCES [dbo].[tblBankDtls] ([BankID])
GO
ALTER TABLE [dbo].[tblPaymentDtls] CHECK CONSTRAINT [FK_tblPaymentDtls_tblBankDtls]
GO
/****** Object:  ForeignKey [FK_tblPaymentDtls_tblBookingDtls]    Script Date: 06/13/2013 18:22:44 ******/
ALTER TABLE [dbo].[tblPaymentDtls]  WITH CHECK ADD  CONSTRAINT [FK_tblPaymentDtls_tblBookingDtls] FOREIGN KEY([BookingId])
REFERENCES [dbo].[tblBookingDtls] ([BookingId])
GO
ALTER TABLE [dbo].[tblPaymentDtls] CHECK CONSTRAINT [FK_tblPaymentDtls_tblBookingDtls]
GO
