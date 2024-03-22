import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared/widget/widget.dart';

class ArticleWebView extends StatefulWidget {
  final String url;

  const ArticleWebView({required this.url});

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) => NavigationDecision.navigate,
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebViewWidget(
        controller: WebViewController(),
      ),
    );
  }
}
