USE [master]
GO
/****** Object:  Database [StayFinder]    Script Date: 25-03-2025 23:16:54 ******/
CREATE DATABASE [StayFinder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StayFinder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StayFinder.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StayFinder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StayFinder_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StayFinder] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StayFinder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StayFinder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StayFinder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StayFinder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StayFinder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StayFinder] SET ARITHABORT OFF 
GO
ALTER DATABASE [StayFinder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StayFinder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StayFinder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StayFinder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StayFinder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StayFinder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StayFinder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StayFinder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StayFinder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StayFinder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StayFinder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StayFinder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StayFinder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StayFinder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StayFinder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StayFinder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StayFinder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StayFinder] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StayFinder] SET  MULTI_USER 
GO
ALTER DATABASE [StayFinder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StayFinder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StayFinder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StayFinder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StayFinder] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StayFinder] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StayFinder] SET QUERY_STORE = ON
GO
ALTER DATABASE [StayFinder] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StayFinder]
GO
/****** Object:  Table [dbo].[AdminDetails]    Script Date: 25-03-2025 23:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminDetails](
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyDetails]    Script Date: 25-03-2025 23:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyName] [varchar](50) NULL,
	[PropertyType] [varchar](50) NULL,
	[Location] [varchar](200) NULL,
	[Rent] [varchar](50) NULL,
	[NumberOfRooms] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[Facilities_1] [varchar](50) NULL,
	[Facilities_2] [varchar](50) NULL,
	[Facilities_3] [varchar](50) NULL,
	[PropertyImage] [varbinary](max) NULL,
	[Contact] [varchar](50) NULL,
	[OwnerName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[City] [varchar](50) NULL,
	[ApprovalStatus] [varchar](20) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyOwnerDetails]    Script Date: 25-03-2025 23:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyOwnerDetails](
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Password] [varchar](50) NULL,
	[ProfilePic] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PropertyDetails] ADD  DEFAULT ('Pending') FOR [ApprovalStatus]
GO
/****** Object:  StoredProcedure [dbo].[DeleteProperty]    Script Date: 25-03-2025 23:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteProperty](
@ID as int
)
as
begin
DELETE FROM PropertyDetails WHERE ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[EditProperty]    Script Date: 25-03-2025 23:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EditProperty]
@PropertyName as varchar(200),
@PropertyType as varchar(50),
@Location as varchar(100),
@Rent as varchar(50),
@NumberOfRooms as varchar(50),
@Description as varchar(200),
@Facilities_1 as varchar(10),
@Facilities_2 as varchar(10),
@Facilities_3 as varchar(10),
@PropertyImage as varbinary(max),
@Contact as varchar(20),
@Gender as varchar(20),
@City as varchar(50),
@ID as int

as
begin
update PropertyDetails set PropertyName = @PropertyName, PropertyType = @PropertyType, Location = @Location, Rent = @Rent, NumberOfRooms = @NumberOfRooms, Description = @Description, Facilities_1 = @Facilities_1, Facilities_2 = @Facilities_2, Facilities_3 = @Facilities_3, PropertyImage = @PropertyImage, Contact = @Contact, Gender = @Gender, City = @City, ApprovalStatus = 'Pending',ApprovedBy = null WHERE ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPropertyDetails]    Script Date: 25-03-2025 23:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertPropertyDetails]
@PropertyName as varchar(50),
@PropertyType as varchar(10),
@Location as varchar(200),
@Rent as varchar(50),
@NumberOfRooms as varchar(50),
@Description as varchar(200),
@Facilities_1 as varchar(50),
@Facilities_2 as varchar(50),
@Facilities_3 as varchar(50),
@PropertyImage as varbinary(MAX),
@Contact as varchar(50),
@OwnerName as varchar(50),
@Email as varchar(50),
@Gender as varchar(10),
@City as varchar(50)
as
begin 
insert into PropertyDetails (PropertyName, PropertyType, Location, Rent, NumberOfRooms, Description, Facilities_1,Facilities_2,Facilities_3, PropertyImage,Contact,OwnerName,Email,Gender, City)
values (@PropertyName, @PropertyType, @Location, @Rent, @NumberOfRooms, @Description, @Facilities_1,@Facilities_2,@Facilities_3, @PropertyImage, @Contact,@OwnerName,@Email,@Gender, @City);
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPropertyOwnerDetails]    Script Date: 25-03-2025 23:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertPropertyOwnerDetails]
@Name as varchar(50),
@Email as varchar(50),
@Contact as varchar(50),
@Address as varchar(100),
@Password as varchar(50),
@ProfilePic varbinary(MAX)
as
begin
insert into PropertyOwnerDetails (Name, Email, Contact, Address, Password, ProfilePic) values (@Name, @Email, @Contact, @Address, @Password, @ProfilePic);
end
GO
/****** Object:  StoredProcedure [dbo].[UpdatePropertyDetails]    Script Date: 25-03-2025 23:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdatePropertyDetails]
(
@ApprovalStatus as varchar(50),
@ApprovedBy as varchar(50),
@ApprovedDate as varchar(50),
@ID as int
)

as
begin
update PropertyDetails set ApprovalStatus = @ApprovalStatus, ApprovedBy = @ApprovedBy, ApprovedDate = @ApprovedDate where ID = @ID
end
GO
USE [master]
GO
ALTER DATABASE [StayFinder] SET  READ_WRITE 
GO
