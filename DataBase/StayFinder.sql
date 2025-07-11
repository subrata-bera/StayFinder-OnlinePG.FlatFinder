USE [master]
GO
/****** Object:  Database [StayFinder]    Script Date: 06-06-2025 03:02:13 ******/
CREATE DATABASE [StayFinder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StayFinder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StayFinder.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StayFinder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StayFinder_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[AdminDetails]    Script Date: 06-06-2025 03:02:13 ******/
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
/****** Object:  Table [dbo].[BookingRequests]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NULL,
	[UserEmail] [varchar](100) NULL,
	[Mobile] [varchar](50) NULL,
	[UserName] [varchar](100) NULL,
	[BookingDate] [date] NULL,
	[Status] [varchar](20) NULL,
	[Address] [varchar](200) NULL,
	[NumberOfPeople] [varchar](50) NULL,
	[DocumentsNumber] [varchar](200) NULL,
	[DocumentPhoto] [varbinary](max) NULL,
	[DocumentType] [varchar](50) NULL,
	[RequestDate] [datetime] NULL,
	[Gender] [varchar](20) NULL,
	[RequestType] [varchar](50) NULL,
	[RoomType] [varchar](50) NULL,
	[TotalAmount] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Message] [varchar](200) NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NULL,
	[date] [datetime] NULL,
	[Amount] [varchar](100) NULL,
	[PaymentStatus] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyDetails]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyName] [varchar](50) NULL,
	[PropertyType] [varchar](50) NULL,
	[Location] [varchar](200) NULL,
	[NumberOfRooms] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[PropertyImage] [varbinary](max) NULL,
	[Contact] [varchar](50) NULL,
	[OwnerName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[City] [varchar](50) NULL,
	[ApprovalStatus] [varchar](20) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedDate] [datetime] NULL,
	[Landmark] [varchar](50) NULL,
	[Pin] [varchar](10) NULL,
	[Facility_Wifi] [varchar](50) NULL,
	[Facility_Parking] [varchar](50) NULL,
	[Facility_Power] [varchar](50) NULL,
	[Facility_WashingMachine] [varchar](50) NULL,
	[Facility_Geyser] [varchar](50) NULL,
	[Facility_CCTV] [varchar](50) NULL,
	[Facility_Security] [varchar](50) NULL,
	[Facility_AC] [varchar](50) NULL,
	[Facility_Water] [varchar](50) NULL,
	[Rules_NoSmoking] [varchar](20) NULL,
	[Rules_NoAlcohol] [varchar](20) NULL,
	[Rules_NoPets] [varchar](20) NULL,
	[Rules_OnlyStudents] [varchar](20) NULL,
	[PropertyImage_2] [varbinary](max) NULL,
	[PropertyImage_3] [varbinary](max) NULL,
	[SingleRoomUnit] [varchar](100) NULL,
	[SingleRoomRent] [int] NULL,
	[DoubleRoomUnit] [varchar](100) NULL,
	[DoubleRoomRent] [int] NULL,
	[TripleRoomUnit] [varchar](100) NULL,
	[TripleRoomRent] [int] NULL,
	[SingleRoomSize] [varchar](50) NULL,
	[DoubleRoomSize] [varchar](50) NULL,
	[TripleRoomSize] [varchar](50) NULL,
	[OwnerId] [int] NULL,
 CONSTRAINT [PK_PropertyDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyOwnerDetails]    Script Date: 06-06-2025 03:02:13 ******/
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
	[ProfilePic] [varbinary](max) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyReviews]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyReviews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NULL,
	[UserName] [nvarchar](100) NULL,
	[Rating] [int] NULL,
	[ReviewText] [nvarchar](max) NULL,
	[ReviewDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookingRequests] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[BookingRequests] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[ContactUs] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[PropertyDetails] ADD  DEFAULT ('Pending') FOR [ApprovalStatus]
GO
ALTER TABLE [dbo].[PropertyReviews] ADD  DEFAULT (getdate()) FOR [ReviewDate]
GO
ALTER TABLE [dbo].[PropertyReviews]  WITH CHECK ADD  CONSTRAINT [FK_PropertyReviews_PropertyDetails] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[PropertyDetails] ([ID])
GO
ALTER TABLE [dbo].[PropertyReviews] CHECK CONSTRAINT [FK_PropertyReviews_PropertyDetails]
GO
ALTER TABLE [dbo].[PropertyReviews]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
/****** Object:  StoredProcedure [dbo].[Booking_Confirmation]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Booking_Confirmation](
@ID int
)
as
begin
select BookingRequests.UserName, BookingRequests.RoomType, BookingRequests.TotalAmount, BookingRequests.NumberOfPeople, BookingRequests.RequestType, BookingRequests.Mobile, BookingRequests.Address, BookingRequests.Gender, BookingRequests.Status, BookingRequests.RequestDate, BookingRequests.BookingDate, BookingRequests.ID, PropertyDetails.PropertyName, PropertyDetails.OwnerName, PropertyDetails.PropertyType
from BookingRequests join PropertyDetails on BookingRequests.PropertyID = PropertyDetails.ID where BookingRequests.ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[CancelRequest]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CancelRequest](
@ID as int
)

as
begin
delete from BookingRequests where ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteProperty]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteProperty](
@ID as int
)
as
begin
 -- Step 1: Delete dependent records first
    DELETE FROM PropertyReviews WHERE PropertyID = @ID;
    DELETE FROM BookingRequests WHERE PropertyID = @ID;

    -- Step 2: Now delete from PropertyDetails
    DELETE FROM PropertyDetails WHERE ID = @ID;end
GO
/****** Object:  StoredProcedure [dbo].[EditProperty]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EditProperty](
@PropertyName as varchar(100),
@PropertyType as varchar(100),
@Gender as varchar(100),
@Email as varchar(100),
@Address as varchar(100),
@City as varchar(100),
@Landmark as varchar(100),
@Pin as varchar(100),
@NumberOfRooms as varchar(100),
@sUnit as varchar(100),
@sRent as varchar(100),
@sSize as varchar(100),
@dUnit as varchar(100),
@dRent as varchar(100),
@dSize as varchar(100),
@tUnit as varchar(100),
@tRent as varchar(100),
@tSize as varchar(100),
@Facility_AC as varchar(100),
@Facility_CCTV as varchar(100),
@Facility_Geyser as varchar(100),
@Facility_Parking as varchar(100),
@Facility_Power as varchar(100),
@Facility_Security as varchar(100),
@Facility_WashingMachine as varchar(100),
@Facility_Water as varchar(100),
@Facility_Wifi as varchar(100),
@Rules_NoAlcohol as varchar(100),
@Rules_NoPets as varchar(100),
@Rules_NoSmoking as varchar(100),
@Rules_OnlyStudents as varchar(100),
@Description as varchar(200),
 @PropertyImage VARBINARY(MAX) = NULL,
    @PropertyImage_2 VARBINARY(MAX) = NULL,
    @PropertyImage_3 VARBINARY(MAX) = NULL,
@PropertyId as varchar(500),
@Contact as varchar(50)

)
as
begin
update PropertyDetails set PropertyName = @PropertyName, PropertyType = @PropertyType, Gender = @Gender, Email = @Email, Location = @Address, City = @City,
Landmark = @Landmark,Pin = @Pin, NumberOfRooms = @NumberOfRooms, SingleRoomUnit = @sUnit, SingleRoomRent = @sRent, SingleRoomSize = @sSize, 
DoubleRoomUnit = @dUnit, DoubleRoomRent = @dRent, DoubleRoomSize = @dSize, TripleRoomUnit = @tUnit, TripleRoomRent = @tRent, TripleRoomSize = @tSize,
Facility_AC = @Facility_AC, Facility_CCTV = @facility_CCTV, Facility_Geyser = @Facility_Geyser, Facility_Parking = @Facility_Parking,
Facility_Power = @Facility_Power, Facility_Security = @Facility_Security, Facility_WashingMachine = @Facility_WashingMachine, 
Facility_Water = @Facility_Water, Facility_Wifi = @Facility_Wifi, Rules_NoAlcohol = @Rules_NoAlcohol, Rules_NoPets = @Rules_NoPets, Rules_NoSmoking = @Rules_NoSmoking,
Rules_OnlyStudents = @Rules_OnlyStudents, Description = @Description, PropertyImage = CASE WHEN @PropertyImage IS NOT NULL THEN @PropertyImage ELSE PropertyImage END,     PropertyImage_2 = CASE WHEN @PropertyImage_2 IS NOT NULL THEN @PropertyImage_2 ELSE PropertyImage_2 END,

    PropertyImage_3 = CASE WHEN @PropertyImage_3 IS NOT NULL THEN @PropertyImage_3 ELSE PropertyImage_3 END,
 Contact=@Contact, ApprovalStatus = 'Pending' where ID = @propertyId;
end
GO
/****** Object:  StoredProcedure [dbo].[FetchBookingRequests]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FetchBookingRequests](
@ID as varchar(50)
)
as
begin
select PropertyDetails.PropertyImage, PropertyDetails.PropertyName,BookingRequests.BookingDate, BookingRequests.UserName, BookingRequests.RequestType, BookingRequests.ID from PropertyDetails join BookingRequests on PropertyDetails.ID = BookingRequests.PropertyID  where PropertyDetails.OwnerId = @ID and BookingRequests.Status = 'Pending' ORDER BY BookingRequests.ID DESC
end
GO
/****** Object:  StoredProcedure [dbo].[FetchRequestApproval]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FetchRequestApproval](
@ID int
)
as
begin
select PropertyDetails.PropertyName, BookingRequests.UserName, BookingRequests.DocumentPhoto, BookingRequests.Mobile, BookingRequests.RoomType, BookingRequests.RequestType, BookingRequests.Gender, BookingRequests.Address, BookingRequests.NumberOfPeople, BookingRequests.BookingDate, BookingRequests.DocumentType, BookingRequests.DocumentsNumber
from PropertyDetails join BookingRequests on PropertyDetails.ID = BookingRequests.PropertyID where BookingRequests.ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[FetchUserRequestsDetails]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FetchUserRequestsDetails](
@UserEmail as varchar(50)
)
as
begin 
select BookingRequests.ID, PropertyDetails.PropertyName, BookingRequests.BookingDate, BookingRequests.RequestType, BookingRequests.DocumentType, BookingRequests.DocumentsNumber, BookingRequests.DocumentPhoto, BookingRequests.Status
from PropertyDetails join BookingRequests on PropertyDetails.ID = BookingRequests.PropertyID where BookingRequests.UserEmail = @UserEmail order by ID desc
end
GO
/****** Object:  StoredProcedure [dbo].[InsertBookingRequests]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertBookingRequests]
(
@PropertyId as varchar(50),
@UserEmail as varchar(50),
@Mobile as varchar(50),
@UserName as varchar(50),
@BookingDate as varchar(50),
@Address as varchar(200),
@NumberOfPeople as varchar(50),
@DocumentsNumber as varchar(50),
@DocumentPhoto as varbinary(max),
@DocumentType as varchar(50),
@Gender as varchar(20),
@RequestType as varchar(50),
@RoomType as varchar(50),
@TotalAmount as varchar(10)
)
as
begin
insert into BookingRequests (PropertyId, UserEmail, Mobile, UserName, BookingDate, Address, NumberOfPeople, DocumentsNumber, DocumentPhoto, DocumentType, Gender, RequestType, RoomType, TotalAmount) 
values
(@PropertyId, @UserEmail, @Mobile, @UserName, @BookingDate, @Address, @NumberOfPeople, @DocumentsNumber, @DocumentPhoto, @DocumentType, @Gender, @RequestType, @RoomType, @TotalAmount)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPropertyDetails]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertPropertyDetails]
@PropertyName as varchar(50),
@PropertyType as varchar(10),
@Location as varchar(200),
@NumberOfRooms as varchar(50),
@Description as varchar(200),
@Landmark as varchar(50), 
@Pin as varchar(10),

@Facility_Wifi as varchar(10),
@Facility_Parking as varchar(10),
@Facility_Power as varchar(10),
@Facility_WashingMachine as varchar(20),
@Facility_Geyser as varchar(10),
@Facility_CCTV as varchar(10),
@Facility_Security as varchar(10),
@Facility_AC as varchar(10),
@Facility_Water as varchar(20),

@Rules_NoSmoking as varchar(20),
@Rules_NoAlcohol as varchar(20),
@Rules_NoPets as varchar(20),
@Rules_OnlyStudents as varchar(20),

@PropertyImage as varbinary(MAX),
@PropertyImage_2 as varbinary(max),
@PropertyImage_3 as varbinary(max),

@Contact as varchar(50),
@OwnerName as varchar(50),
@Email as varchar(50),
@Gender as varchar(10),
@City as varchar(50),

@SingleRoomUnit as varchar(100),
@SingleRoomrent as varchar(100),
@DoubleRoomUnit as varchar(100),
@DoubleRoomrent as varchar(100),
@TripleRoomUnit as varchar(100),
@TripleRoomrent as varchar(100),

@SingleRoomSize as varchar(50),
@DoubleRoomSize as varchar(50),
@TripleRoomSize as varchar(50),
@OwnerId int
as
begin 
insert into PropertyDetails (PropertyName,
PropertyType,
Location,
NumberOfRooms,
Description,
Facility_Wifi,
Facility_Parking,
Facility_Power,
Facility_WashingMachine,
Facility_Geyser,
Facility_CCTV,
Facility_Security,
Facility_AC,
Facility_Water,
Rules_NoSmoking,
Rules_NoAlcohol,
Rules_NoPets,
Rules_OnlyStudents, 
Landmark, Pin, PropertyImage, PropertyImage_2, PropertyImage_3, Contact,OwnerName,Email,Gender, City, SingleRoomUnit, SingleRoomRent, DoubleRoomUnit, DoubleRoomRent, TripleRoomUnit, TripleRoomRent, SingleRoomSize, DoubleRoomSize, TripleRoomSize, OwnerId)


values (@PropertyName, @PropertyType, @Location, @NumberOfRooms, @Description, @Facility_Wifi, @Facility_Parking, @Facility_Power,
@Facility_WashingMachine, @Facility_Geyser, @Facility_CCTV, @Facility_Security, @Facility_AC, @Facility_Water, @Rules_NoSmoking, @Rules_NoAlcohol, @Rules_NoPets,
@Rules_OnlyStudents, @Landmark, @Pin, @PropertyImage, @PropertyImage_2, @PropertyImage_3, @Contact,@OwnerName,@Email,@Gender, @City, @SingleRoomUnit, @SingleRoomRent, @DoubleRoomUnit, @DoubleRoomRent, @TripleRoomUnit, @TripleRoomRent, @SingleRoomSize, @DoubleRoomSize, @TripleRoomSize, @OwnerId);
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPropertyOwnerDetails]    Script Date: 06-06-2025 03:02:13 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUserDetails]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertUserDetails]
@Name as varchar(100),
@Email as varchar(100),
@Contact as varchar(100),
@Password as varchar(50)

as
begin
insert into UserDetails (Name, Email, Contact, Password) values (@Name, @Email, @Contact, @Password)
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateBookingStatus]    Script Date: 06-06-2025 03:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateBookingStatus](
@ID int
)
as
begin
update BookingRequests set Status = 'Approved' where ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[UpdatePropertyDetails]    Script Date: 06-06-2025 03:02:13 ******/
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
