# Prompts Used to Create This Application

This document contains all the user prompts that were used to build this Flutter application with Google Antigravity AI.

## Session Date
November 26, 2025

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

## AI Assistant
This application was built using **Google Antigravity**, an advanced AI coding assistant by Google DeepMind.
