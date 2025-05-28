# My Lovely Webview App

A Flutter-based fullscreen webview application that provides an immersive browsing experience with no borders or system UI elements.

![Flutter Version](https://img.shields.io/badge/Flutter-3.5.3+-blue.svg)
![InAppWebView](https://img.shields.io/badge/InAppWebView-6.0.0-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## ✨ Features

- **True Fullscreen Experience**: Completely borderless with no system UI elements for maximum immersion
- **Multi-Orientation Support**: Seamlessly adapts to both portrait and landscape orientations
- **Intelligent Navigation**: Handles back button presses by navigating through webview history
- **Performance Optimized**: Hardware accelerated rendering for smooth browsing experience
- **Minimal Footprint**: Lightweight application with essential features only

## 🛠️ Technical Details

- Built with Flutter SDK ^3.5.3
- Uses `flutter_inappwebview` ^6.0.0 for advanced webview capabilities
- Implements SystemChrome for true fullscreen experience
- Handles all device orientation changes automatically
- Default URL set to Reddit (https://www.reddit.com/)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.5.3)
- Android Studio / VS Code with Flutter plugins
- For iOS: Xcode and CocoaPods
- For Android: Android SDK and Android Studio

### Installation

1. Clone this repository
   ```bash
   git clone https://github.com/yourusername/my-lovely-webview-app.git
   cd my-lovely-webview-app
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Run the application
   ```bash
   flutter run
   ```

## ⚙️ Configuration

The default URL is set to "https://www.reddit.com/" and can be modified in the `main.dart` file:

```dart
// Change this constant to your desired URL
const String appUrl = "https://www.reddit.com/";
```

## 📱 Building for Production

### Android

Build a release APK:
```bash
flutter build apk --release
```

Build a release App Bundle:
```bash
flutter build appbundle --release
```

### iOS

Build a release IPA:
```bash
flutter build ios --release
```

## 🔍 How It Works

The app uses `flutter_inappwebview` to create a fullscreen webview that:
- Removes all system UI elements for a borderless experience
- Handles back button navigation through webview history
- Automatically adapts to orientation changes
- Provides hardware acceleration for optimal performance

## 🤝 Contributing

Contributions are welcome! Feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Contact

If you have any questions or suggestions, please open an issue in the repository.
