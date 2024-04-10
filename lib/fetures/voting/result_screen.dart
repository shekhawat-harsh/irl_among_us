import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PollingResult extends StatefulWidget {
  const PollingResult({Key? key}) : super(key: key);

  @override
  _PollingResultState createState() => _PollingResultState();
}

class _PollingResultState extends State<PollingResult> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // Ensure the WebView is initialized
    _webViewController = WebViewController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polling Result'),
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadPollingPage();
  }

  void _loadPollingPage() {
    const pollingUrl = 'https://amongus-poll-1ztb-tau.vercel.app/result';
    _webViewController.loadRequest(Uri.parse(pollingUrl));
  }
}
