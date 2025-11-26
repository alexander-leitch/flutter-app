# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2025-11-26

### Added
- Initial Flutter project creation.
- Google Sign-In integration using `google_sign_in` and `firebase_auth`.
- `AuthGate` widget to handle authentication state.
- `LoginScreen` with "Sign in with Google" button.
- `HomeScreen` displaying user profile and sign-out button.
- Basic widget tests for the Login Screen.
- **User Profiles**: UserProfile model with privacy settings (public/private, adult content flag).
- **Image Upload**: Upload images with privacy and age restriction tags.
- **Profile Screen**: Display user profile with image grid, filtered by privacy settings.
- **Image Caching**: Cached network images for improved performance.
- **Age Verification**: Self-attestation dialog for viewing 18+ content.
- **Firestore Integration**: Store user profiles and image metadata.
- **Firebase Storage**: Store uploaded images.

### Changed
- Downgraded `google_sign_in` to version `^6.0.0` to resolve compilation errors with version 7.x.
- Updated `HomeScreen` to navigate to user profile and auto-create profile on first login.
- Wrapped app in `MultiProvider` for dependency injection.
