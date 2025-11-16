import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../utils/api_utils/api_utils.dart';
import '../../../view/widget/appbar_widget.dart';

class WebTestIbuHamilView extends StatefulWidget{
  const WebTestIbuHamilView({super.key});

  @override
  State<WebTestIbuHamilView> createState() => _WebTestIbuHamilViewState();
}

class _WebTestIbuHamilViewState extends State<WebTestIbuHamilView> {
  WebViewController webViewController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {},
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onHttpError: (HttpResponseError error) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith(ApiUtils().urlTestibuHamil().toString())) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(ApiUtils().urlTestibuHamil());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Web Test Ibu Hamil',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: WebViewWidget(
        controller: webViewController
      ),
    );
  }
}