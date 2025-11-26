# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added
- Initial Flutter project creation.
- Google Sign-In integration using `google_sign_in` and `firebase_auth`.
- `AuthGate` widget to handle authentication state.
- `LoginScreen` with "Sign in with Google" button.
- `HomeScreen` displaying user profile and sign-out button.
- Basic widget tests for the Login Screen.

### Changed
- Downgraded `google_sign_in` to version `^6.0.0` to resolve compilation errors with version 7.x.
