import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

const String appUrl = "https://www.reddit.com/";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Set preferred orientations to landscape and portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Enable true fullscreen mode with no borders
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // Set system UI overlay style to transparent
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fullscreen WebView',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WebViewScreen(),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late InAppWebViewController _webViewController;
  double progress = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Keep the screen on and maintain fullscreen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Handle Android back button press
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        // Check if WebView can go back in its own history
        bool canGoBack = await _webViewController.canGoBack();

        if (canGoBack) {
          // If WebView has history, go back in WebView
          print("Navigating back in WebView history");
          _webViewController.goBack();
        } else {
          // If no WebView history, reload home URL
          print("No WebView history - reloading home URL");
          _webViewController.loadUrl(
              urlRequest: URLRequest(url: WebUri(appUrl)));
        }
      },
      child: Scaffold(
        // Set background color to match the web content
        backgroundColor: Colors.black,
        // Remove app bar
        appBar: null,
        // Remove any system padding that might cause borders
        resizeToAvoidBottomInset: false,
        // Ensure no safe area padding
        body: MediaQuery.removePadding(
          context: context,
          removeTop: false,
          removeBottom: true,
          removeLeft: true,
          removeRight: true,
          child: SafeArea(
              bottom: false,
              left: false,
              right: false,
              child: Container(
                // Ensure the container takes up the full screen with no margins
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                // Make sure it fills the entire screen
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: WebUri(appUrl)),
                  initialSettings: InAppWebViewSettings(
                    useShouldOverrideUrlLoading: true,
                    mediaPlaybackRequiresUserGesture: false,
                    javaScriptEnabled: true,
                    javaScriptCanOpenWindowsAutomatically: true,
                  ),
                  onWebViewCreated: (controller) {
                    _webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                    print("URL started: ${url.toString()}");
                  },
                  onProgressChanged: (controller, progress) {
                    print("Progress: $progress");
                  },
                  onLoadStop: (controller, url) {
                    print("URL loaded: ${url.toString()}");
                  },
                  onReceivedError: (controller, request, error) {
                    print("Error loading URL: ${error.description}");
                  },
                ),
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Reset system UI when the app is closed
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    super.dispose();
  }
}
