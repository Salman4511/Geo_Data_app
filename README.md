# Geo Data App

## Overview

The Geo Data App is a Flutter-based application designed to handle geographical data, including location management and weather reporting. The app features a user-friendly interface for both admins and regular users, with functionalities for uploading Excel files, managing users, and viewing location and weather information.

## Features

- **User Authentication**: Sign up, login, and session management.
  - Admins can log in using predefined credentials (Credentials are mentioned below).
- **Excel File Upload**: Upload and process geographical data from Excel files.
- **Weather Reporting**: Fetch and display weather information based on locations from the uploaded Excel file.
- **Location Management**: Add, view, and manage geographical locations.
- **User Management**: View and manage user accounts, with admin roles and restrictions.

## Admin Login

- **Predefined Credentials**:
  - Email: `admin@gmail.com`
  - Password: `admin123`

Admins can use these credentials to log in and access the admin dashboard and management features.

## Screens

### 1. Login Screen

- **Purpose**: Allows users to log in to the app.
- **Features**: 
  - Email and password fields.
  - Login button to authenticate users.
  - Link to navigate to the Sign Up screen.
  - Admins can use predefined credentials to log in.

### 2. Signup Screen

- **Purpose**: Allows new users to register an account.
- **Features**:
  - Email and password fields.
  - Sign Up button to create a new account.
  - Link to navigate back to the Login screen.

### 3. Admin Dashboard Screen

- **Purpose**: Main screen for admins to manage app functionalities.
- **Features**:
  - Buttons to navigate to Add Location, View Locations, and Manage Users screens.

### 4. Add Location Screen

- **Purpose**: Allows admins to add new locations to the database.
- **Features**:
  - Input fields for country, state, district, and city.
  - Add button to submit location data.

### 5. View Locations Screen

- **Purpose**: Displays a list of all locations stored in the database.
- **Features**:
  - List of locations with city, district, state, and country details.
  - Option to delete locations with confirmation dialog.

### 6. Manage Users Screen

- **Purpose**: Allows admins to manage user accounts.
- **Features**:
  - List of users with email and role information.
  - Option to delete users with confirmation dialog, Admins can't be deleted.

### 7. Weather Report Screen

- **Purpose**: Displays weather reports based on locations.
- **Features**:
  - List of weather reports including city, state, country, weather description, and temperature.
  - Weather data is shown based on the information from the uploaded Excel file.
  - **Note**: If no Excel file is uploaded or if the format is incorrect, uncomment the commented `_pickAndUploadFile` section in the `UploadExcelScreen` to test or check the screenshot provided for clarification.

## Screen shots 

<img src="https://github.com/user-attachments/assets/7f00a59c-8861-4fe8-894c-0abcb51bf35b" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/123a53e9-a71c-458e-9e85-93acd78d1d71" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/ac49ab11-7a81-46e7-8339-093e5bf4d28c" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/11499415-e795-4eb2-8fe7-eec412b198ff" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/18ce301c-cc0b-4255-bffa-0beccb62166a" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/8cb6a5ec-6cfd-4137-a730-76bb2b9010aa" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/b8a5b328-536e-4b2c-8025-35bde05c0bfb" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/5a0ca7da-5207-4e9e-944f-0907731ab600" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/81d49ca5-3c40-4b54-8649-c2c3c549c0be" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/5d8d8df6-6c4c-4cd6-8c43-ea4b11996798" alt="" width="300px">
<img src="https://github.com/user-attachments/assets/768ef36b-6d43-4916-8d67-bc54431d23a2" alt="" width="300px">


## Folder Structure

The project follows this folder structure:

-lib/
├── main.dart
├── routes/
│   ├── app_routes.dart
│   └── route_generator.dart
├── modules/
│   ├── admin/
│   │   ├── screens/
│   │      ├── admin_dashboard_screen.dart
│   │      ├── add_location_screen.dart
│   │      ├── manage_users_screen.dart
│   │      └── view_locations_screen.dart
│   │ 
│   ├── user/
│   │   ├── screens/
│   │      ├── user_dashboard_screen.dart
│   │      ├── upload_excel_screen.dart
│   │      └── weather_report_screen.dart
│   │   
│   └── auth/
│       ├── screens/
│          ├── login_screen.dart
│          ├── signup_screen.dart
│          └── loading_screen.dart
│       
└── shared/
    ├── widgets/
    │   ├── navbar_widget.dart
    │   ├── text_field_widget.dart
    │   └── footer_widget.dart
    ├── services/
    │   ├── auth_services.dart
    │   ├── excel_services.dart
    │   └── weather_services.dart
    └── utils/
        └── constants.dart


### Prerequisites

- Flutter SDK
- Firebase project setup (for Firestore and Authentication)

### Installation

1. Clone the repository:

   git clone <repository-url>
   cd <repository-directory>

### Contact information

   Email: salmanulfaris4511@gmail.com
   phone: 9895840715
