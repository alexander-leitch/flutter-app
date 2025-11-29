# Prompts Used to Create This Application

This document contains all the user prompts that were used to build this Flutter application with Google Antigravity AI.

## Session 1: Initial Development
**Date**: November 26, 2025

## Prompt History

### Prompt 1: Initial Request
```
In this folder please create me a Flutter application for mobile and web that allows people to login via their Google Accounts.
```

**Result**: Created initial Flutter project with Google Sign-In authentication, including:
- Firebase integration
- Login/Home screens
- Google authentication flow
- Basic tests

---

### Prompt 2: Add Profile and Image Features
```
Thank you. Please can each user who logins have at least one profile page which displays a grid of images they have uploaded themselves. A cached version of the image must be stored in a cache service to speed up loading. These profiles are publicly availble unless the profile is labelled not to be or has content that is not for under 18's. Images can be tagged as such too and can be view if the user has logged in and said they are of legal age to view the image.
```

**Result**: Enhanced the application with:
- User profile data model with privacy settings
- Image upload functionality
- Image grid display with caching (using `cached_network_image`)
- Privacy controls (public/private profiles and images)
- Age verification system (self-attestation)
- Firestore for data storage
- Firebase Storage for image files

---

### Prompt 3: Update Documentation
```
Please update the readme with info about using google antigravity to write this application and also create a file to keep track of what has been done.
```

**Result**: 
- Updated README.md with Antigravity attribution
- Created CHANGELOG.md to track all changes
- Initialized git repository and committed all code

---

### Prompt 4: Add Restart Instructions
```
thank you, please make sure all the prompts used to created this application have been stored too
```

**Result**:
- Updated README with comprehensive restart instructions
- Added project structure documentation
- Added development commands
- Updated CHANGELOG with version 1.0.0
- Created this PROMPTS.md file

---

## Technical Decisions Made

### Authentication
- Used Firebase Authentication with Google Sign-In
- Downgraded `google_sign_in` to v6.x to avoid breaking changes in v7.x

### Data Storage
- **Firestore**: User profiles and image metadata
- **Firebase Storage**: Actual image files
- **Cached Network Image**: Client-side image caching

### Privacy Implementation
- Profile-level privacy (public/private)
- Image-level privacy (public/private)
- Age-restricted content flag (18+)
- Self-attestation for age verification (checkbox confirmation)

### State Management
- Used Provider for dependency injection
- Services pattern for Firestore and Storage operations

### Project Structure
```
lib/
├── main.dart                          # Entry point, auth, home
├── models/                            # Data models
├── services/                          # Business logic
└── screens/                           # UI screens
```

## Firebase Configuration Required

Users must:
1. Run `flutterfire configure`
2. Add platform-specific config files
3. Set up Firestore Security Rules
4. Set up Storage Security Rules

See `walkthrough.md` for detailed setup instructions.

---

## Session 2: Firebase Configuration & Login Fix
**Date**: November 28-30, 2025

### Prompt 5: Debug Login Crash
```
Hello, can you check the status of this project and continue from where it left off. I have also setup the firebase account but the application crashes when logging in.
```

**Result**: Investigated and fixed Firebase configuration issues:
- Identified missing OAuth credentials in `google-services.json` and `GoogleService-Info.plist`
- Retrieved SHA-1 fingerprint for Android: `23:79:E7:32:82:19:B3:2D:66:FF:C5:41:F1:A2:1A:A4:A0:3C:FE:FC`
- Created Firebase Console setup guide
- Added `INTERNET` permission to `AndroidManifest.xml`
- Added `CFBundleURLTypes` with `REVERSED_CLIENT_ID` to iOS `Info.plist`

---

### Prompt 6: Run FlutterFire Configure
```
try the flutterfire command again
```

**Result**: 
- Ran `flutterfire configure` after user enabled Google Sign-In in Firebase Console
- User added SHA-1 fingerprint to Firebase project
- Generated updated configuration files with proper OAuth credentials
- User manually updated `Info.plist` with `REVERSED_CLIENT_ID`

---

### Prompt 7: Test Application
```
I've completed the steps, can we run the apps again to test
```

**Result**: 
- Started Flutter app on Chrome (web platform)
- Discovered web-specific Google Sign-In error

---

### Prompt 8: Fix Web Sign-In Error
```
I see it in chrome but an error is displayed when clicking on the sign in with Google button.
```

**Result**: Fixed web platform Google Sign-In:
- Added `<meta name="google-signin-client_id">` tag to `web/index.html`
- Updated `GoogleSignIn()` initialization with `clientId` parameter in `main.dart`
- Performed full app restart to apply changes

---

### Prompt 9: Security Review
```
Is there anything in this code that should not be commited to github?
```

**Result**: 
- Reviewed all Firebase configuration files
- Confirmed all files are safe to commit (public API keys, OAuth client IDs)
- Explained that security comes from Firebase Security Rules, not hiding config files

---

## Technical Details: Firebase Configuration Fix

### Root Cause
The application was crashing on login because:
1. Google Sign-In was not enabled in Firebase Console
2. SHA-1 fingerprint was not added for Android app
3. OAuth client IDs were missing from configuration files
4. Web platform required additional client ID configuration

### Solution Steps
1. **Firebase Console Setup**:
   - Enabled Google Sign-In provider
   - Added SHA-1 fingerprint to Android app settings
   - Downloaded updated `google-services.json` and `GoogleService-Info.plist`

2. **iOS Configuration**:
   - Added `CFBundleURLTypes` to `Info.plist`
   - Set `REVERSED_CLIENT_ID` from `GoogleService-Info.plist`

3. **Android Configuration**:
   - Added `<uses-permission android:name="android.permission.INTERNET"/>`
   - Updated `google-services.json` with OAuth clients

4. **Web Configuration**:
   - Added meta tag with web client ID to `index.html`
   - Passed `clientId` parameter to `GoogleSignIn()` constructor

### Files Modified
- `android/app/src/main/AndroidManifest.xml`
- `android/app/google-services.json` (replaced)
- `ios/Runner/GoogleService-Info.plist` (replaced)
- `ios/Runner/Info.plist`
- `lib/firebase_options.dart` (regenerated)
- `lib/main.dart`
- `web/index.html`

---

## AI Assistant
This application was built using **Google Antigravity**, an advanced AI coding assistant by Google DeepMind.
