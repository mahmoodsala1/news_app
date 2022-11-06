import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  final String url;
  WebviewScreen({required this.url});
  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: widget.url.toString(),
      ),
    );
  }
}
