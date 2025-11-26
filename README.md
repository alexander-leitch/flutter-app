# Flutter App with Google Sign-In & User Profiles

![Flutter CI](https://github.com/alexander-leitch/flutter-app/workflows/Flutter%20CI/badge.svg)

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
- ✅ Automated CI/CD testing with GitHub Actions


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

3.  **Set up Firestore and Storage Security Rules** (see `walkthrough.md` for details)

### Running the App

#### First Time Setup
```bash
# Get dependencies
flutter pub get

# Run the app
flutter run
```

#### Restarting the Application
```bash
# Clean build artifacts (if needed)
flutter clean

# Get dependencies
flutter pub get

# Run on specific device
flutter run -d chrome          # For web
flutter run -d macos           # For macOS
flutter run -d <device-id>     # For mobile (use 'flutter devices' to list)
```

#### Development Commands
```bash
# List available devices
flutter devices

# Run tests
flutter test

# Analyze code
flutter analyze

# Hot reload (press 'r' in terminal while app is running)
# Hot restart (press 'R' in terminal while app is running)
```

## CI/CD Pipeline

This project uses GitHub Actions for continuous integration and testing. The workflow automatically runs on every push and pull request.

### What Gets Tested
- ✅ **Code Formatting**: Ensures code follows Dart formatting standards
- ✅ **Static Analysis**: Runs `flutter analyze` to catch potential issues
- ✅ **Unit & Widget Tests**: Executes all tests in the `test/` directory
- ✅ **Multi-Channel Testing**: Tests on both Flutter stable and beta channels

### Running Checks Locally
Before pushing code, you can run the same checks locally:

```bash
# Check formatting
dart format --set-exit-if-changed .

# Run static analysis
flutter analyze

# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### CI Workflow Status
View the latest CI runs in the [Actions tab](https://github.com/alexander-leitch/flutter-app/actions) of the repository.

## Project Structure
```
lib/
├── main.dart                          # App entry point, auth gate, home screen
├── firebase_options.dart              # Firebase configuration (generated)
├── models/
│   ├── user_profile.dart              # User profile data model
│   └── image_data.dart                # Image metadata model
├── services/
│   ├── firestore_service.dart         # Database operations
│   └── storage_service.dart           # Image upload/storage
└── screens/
    ├── profile_screen.dart            # User profile and image grid
    ├── upload_screen.dart             # Image upload interface
    └── age_verification_dialog.dart   # Age verification dialog
```

## Resources
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Firebase Setup Guide](https://firebase.google.com/docs/flutter/setup)
