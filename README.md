# My Lovely Webview App

A Flutter-based fullscreen webview application that provides an immersive browsing experience.

## Features

- **Fullscreen Immersive Mode**: Completely borderless experience with no system UI elements
- **Responsive Layout**: Supports both portrait and landscape orientations
- **Smart Navigation**: Handles back button presses intelligently by navigating webview history
- **Optimized Performance**: Hardware accelerated rendering for smooth browsing

## Technical Details

- Built with Flutter (SDK ^3.5.3)
- Uses `flutter_inappwebview` (^6.0.0) for advanced webview capabilities
- Implements system UI mode control for true fullscreen experience
- Handles device orientation changes seamlessly

## Getting Started

### Prerequisites

- Flutter SDK (^3.5.3)
- Android Studio / VS Code with Flutter plugins

### Installation

1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Connect a device or start an emulator
4. Run `flutter run` to launch the application

## Configuration

The default URL is set to "https://www.reddit.com/" and can be modified in the `main.dart` file by changing the `appUrl` constant.

## Building for Production

To build a release APK:

```bash
flutter build apk --release
```

To build a release App Bundle:

```bash
flutter build appbundle --release
```

## License

This project is open source and available under standard open source licenses.
