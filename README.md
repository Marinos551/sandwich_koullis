# Sandwich Koullis

## Project Overview
Sandwich Koullis is a Flutter application for sandwich ordering, migrated and structured to match a reference repository. The project includes models, repositories, and views for a complete sandwich shop experience.

## How the Project Was Set Up
- The folder structure and files were created to match the original `flutter_application_1` repository.
- All Dart files, assets, and configuration files were placed in their correct locations under the `lib`, `assets`, and platform-specific folders.
- All import paths were updated to use the correct package name (`sandwich_koullis`).
- The `pubspec.yaml` was checked to ensure the package name and dependencies were correct.
- The invalid `pubspec.lock` was deleted and regenerated using `flutter pub get` to resolve dependency issues.
- All test files were created or updated to match the structure and requirements of the main codebase, and test errors were fixed by providing required parameters and correcting imports.

## Problem Solving and Migration Steps
1. **Folder and File Creation:**
   - Recreated the folder structure and files to match the reference project.
2. **Import Path Fixes:**
   - Updated all Dart import statements to use the correct package name and file paths.
3. **Dependency Management:**
   - Ensured all dependencies were installed and up to date by running `flutter pub get`.
   - Fixed issues with the `pubspec.lock` file.
4. **Test Coverage:**
   - Created and fixed test files for all main components, ensuring they instantiate and render as expected.
5. **Error Resolution:**
   - Addressed all import, instantiation, and test errors as they arose, providing clear fixes and explanations.

## How to Run
1. Make sure you have Flutter installed.
2. Run `flutter pub get` in the project root to install dependencies.
3. Use `flutter run` to launch the app on your desired device or emulator.
4. Run tests with `flutter test` to verify functionality.

## Notes
- If you encounter import errors, ensure your `pubspec.yaml` name matches the import prefix and all files exist in the correct locations.
- Restart your IDE after dependency or configuration changes for best results.

---
This project was migrated and debugged with a focus on accuracy, reproducibility, and clear problem-solving steps.


Prerequisites

- Flutter SDK installed and on your PATH.

Get dependencies

```bash
flutter pub get
```

Run the app (device or simulator)

```bash
flutter run
```

Run tests

```bash
flutter test
```
