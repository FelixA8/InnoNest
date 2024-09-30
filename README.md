# InnoNest

**InnoNest** is a cutting-edge online furniture shopping app powered by **Flutter** and **Firebase**. This app offers a seamless shopping experience with features such as user authentication, a product cart, purchase history, and an augmented reality preview of furniture items.

## Hackathon Participation
This project was dedicated to the SoCS Hackathon 2023, where our team successfully reached the grand finale, competing against over 30 other teams. This experience enriched our skills and showcased our commitment to innovation in the field of online shopping.

## Features

- **User Authentication**: 
  - Users can log in using their email and password or authenticate through Google Sign-In.
  
- **Product Browsing**: 
  - Users can scroll through various furniture products available for purchase.
  
- **Shopping Cart**: 
  - A simple and intuitive cart system allows users to add products and complete purchases easily.
  
- **Purchase History**: 
  - Users can check their previous purchases for reference and management.

- **Profile Management**: 
  - Users can edit their username and address within the app.

- **Augmented Reality (AR) Feature**: 
  - Powered by **Google ARCore**, users can preview selected products in their current room using the device camera. 
  - Experience furniture in 3D model previews directly on their devices.

## Technology Stack

- **Flutter**: The primary framework used for building the mobile application, providing a responsive and high-performance user interface.
- **Firebase**: Used for backend services, including authentication, database management, and real-time data syncing.
- **Google ARCore**: Enables the augmented reality feature, allowing users to visualize furniture in their own spaces.

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/FelixA8/Furiniture.git
   cd Furiniture

2. Clone the repository:
   ```bash
   flutter pub get

3. Set up Firebase:
   - Go to the Firebase Console, create a project, and configure your app for Android and iOS.
   - Download the **google-services.json** file for Android and **GoogleService-Info.plist** for iOS and place them in the respective directories.

4. Run the app:
   ```bash
   flutter run

### ARCore / ARKit Setup
**For Android:** Ensure your device supports ARCore. You'll need to install the ARCore library on your device.
**For iOS:** ARKit is supported on devices running iOS 11 or later. Ensure you are testing on a compatible device (ARKit is not available on the simulator).

## Project Structure
    
    The project is organized as follows:
    
    ```bash
    inno_nest/
    ├── android/             # Android-specific files
    ├── ios/                 # iOS-specific files
    ├── lib/
    │   ├── custom_widgets/  # Custom UI components for reusability
    │   ├── libraries/       # Additional libraries and packages
    │   ├── models/          # Data models for furniture and user profiles
    │   ├── screens/         # UI screens for the application
    │   ├── sections/        # Organized sections of the app
    │   ├── widgets/         # Reusable UI components
    │   ├── constant.dart     # Constants used throughout the app
    │   ├── firebase_options.dart # Firebase configuration options
    │   └── main.dart        # Entry point of the application
    ├── pubspec.yaml         # Project dependencies and configurations
    └── README.md            # Project documentation

## Team Collaboration
As the project lead, I coordinated responsibilities among team members, assigning tasks between design, development, and presentation. I actively contributed to the development of the app, ensuring we delivered a high-quality product.

