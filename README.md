# StayFinder

## Project Overview
StayFinder is a **property rental and listing platform** that helps users find **mess, PGs, and flats** easily. Property owners can register and list their properties, while users can search, filter, and view available rental options. The platform also includes an approval system for properties, ensuring that only verified listings are displayed.

## Features
### 1. **User Roles**
- **Admin**: Manages property approvals, user details, and platform settings.
- **Property Owners**: Can register, log in, and list properties for rent.
- **Users**: Can search, filter, and view properties based on location, rent, and facilities.

### 2. **Core Functionalities**
- **User Authentication**: Secure login and registration for admins, property owners, and users.
- **Property Listing**: Owners can add property details, including name, type, location, rent, number of rooms, and facilities.
- **Property Approval System**: Admin verifies and approves listings before they are visible.
- **Search and Filters**: Users can filter properties by **location, rent, number of rooms, and facilities**.
- **Property Wishlist**: Users can save properties to their wishlist for later viewing.
- **Contact System**: Property details include owner contact information for inquiries.
- **Feedback & Query System**: Users can submit queries or feedback via a contact form.

## Database Schema
The **StayFinder** database consists of the following tables:

### 1. **AdminDetails**
- Email (Primary Key)
- Password
- Name

### 2. **PropertyOwnerDetails**
- Name
- Email (Primary Key)
- Contact
- Address
- Password
- ProfilePic

### 3. **PropertyDetails**
- ID (Primary Key, Auto-Increment)
- PropertyName
- PropertyType
- Location
- Rent
- NumberOfRooms
- Description
- Facilities (1,2,3)
- PropertyImage
- Contact
- OwnerName (Foreign Key from PropertyOwnerDetails)
- Email (Foreign Key from PropertyOwnerDetails)
- Gender
- City
- ApprovalStatus (Default: Pending)
- ApprovedBy
- ApprovedDate

## Technologies Used
- **Frontend**: HTML, CSS, Bootstrap, JavaScript
- **Backend**: ASP.NET Framework 4.8 (C#)
- **Database**: Microsoft SQL Server

## Installation & Setup
### 1. **Clone the Repository**
```bash
    git clone https://github.com/your-repo/stayfinder.git
```
### 2. **Setup SQL Database**
- Import the `StayFinder.sql` file into SQL Server.
- Ensure SQL Server is running and accessible.

### 3. **Run the ASP.NET Application**
- Open the project in **Visual Studio**.
- Restore dependencies and build the project.
- Run the application using IIS Express.

## ER Diagram
Refer to the **ER Diagram** provided in the project files for a visual representation of the database structure.

## Future Enhancements
- Implement a **chat system** for direct communication between users and property owners.
- Add **payment gateway integration** for security deposits.
- Enable **Google Maps API** for location-based search.

## Contributing
If you wish to contribute, fork the repository and submit a pull request.

## License
This project is **open-source** and available for modification under [MIT License](LICENSE).

