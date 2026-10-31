# QUESTION BANK — Flutter starter

A beginner-friendly Flutter Android app starter for Classes 1–12.

## Included in this first version
- Home screen and class selector (Classes 1–12)
- Maths chapter lists
- Practice/test-series screens
- Working multiple-choice quiz flow with answer feedback
- Session score and results screen
- Account and premium placeholder screens
- Class 2 demo maths question set

## Important
This is a starter app, not a finished production learning platform. Class 2 has a small demo question set. Other classes currently use starter/demo questions and generic chapter lists. Accounts, cloud sync, payments, admin question upload, timed exams, and a full curriculum question bank still need to be implemented.

## Run in Android Studio
1. Install Flutter SDK and Android Studio.
2. Extract this ZIP.
3. Open the extracted `question_bank_flutter` folder in Android Studio.
4. Run `flutter pub get` in the terminal.
5. Connect an Android phone with USB debugging enabled, or start an Android emulator.
6. Run `flutter run`.

## Build an APK
Run:
`flutter build apk --release`

The APK will be created at:
`build/app/outputs/flutter-apk/app-release.apk`

## Next development stages
1. Add verified chapter-wise curriculum content for each class.
2. Add timed tests, review screen, and persistent local score history.
3. Add admin panel/database to create and update questions.
4. Add secure sign-in and cloud sync.
5. Add payment gateway only after choosing a provider and configuring a secure backend.
