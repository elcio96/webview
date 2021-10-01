import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          String? url = await controller.currentUrl();
          if (url == "https://github.com/elcio96") {
            return true;
          } else {
            controller.goBack();
            return false;
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: WebView(
              initialUrl: "https://github.com/elcio96",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController wc) {
                controller = wc;
              },
            ),
          ),
        ),
      ),
    );
  }
}
