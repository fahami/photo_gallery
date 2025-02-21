# Photo Gallery App

A Gallery app showing photos from [unsplash](https://unsplash.com) using Flutter as mobile development framework.

## How to run
Ensure you have met some of these requirement:
1. Flutter SDK v3.29.0 installed
2. Unsplash API key

Then you can follow this steps:

1. Fetch all of the dependencies first by running command
```bash
flutter pub get 
```
2. Run the app by using this command with your unsplash API key replacing the `[INSERT_YOUR_API_KEY_HERE]`
```bash
flutter run --dart-define=UNSPLASH_API_KEY=[INSERT_YOUR_API_KEY_HERE]
```