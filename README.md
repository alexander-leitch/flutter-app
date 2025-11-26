# Flutter App with Google Sign-In & User Profiles

A Flutter application for mobile and web that allows users to login via their Google Accounts, create profiles, and upload images with privacy controls.

## Built with Google Antigravity
This application was generated and built using **Google Antigravity**, an advanced AI coding assistant.

## Features
- 🔐 Google Sign-In authentication
- 👤 User profiles with privacy settings
- 📸 Image upload and gallery
- 🖼️ Cached image loading for performance
- 🔒 Privacy controls (public/private profiles and images)
- 🔞 Age verification for 18+ content

## Getting Started

### Prerequisites
- Flutter SDK
- Firebase Project with:
  - Google Sign-In enabled
  - Firestore database
  - Firebase Storage

### Configuration
Before running the app, you must configure Firebase:

1.  **Generate `firebase_options.dart`**:
    ```bash
    flutterfire configure
    ```

2.  **Platform Specifics**:
    - **Android**: Place `google-services.json` in `android/app/`.
    - **iOS**: Place `GoogleService-Info.plist` in `ios/Runner/`.

3.  **Set up Firestore and Storage Security Rules** (see walkthrough.md for details)

### Running the App
```bash
flutter run
```

## Resources
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
