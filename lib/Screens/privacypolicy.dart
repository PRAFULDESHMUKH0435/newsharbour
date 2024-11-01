import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  double _progress =0;
  late InAppWebViewController webview;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Harbour",style: TextStyle(fontSize: 28,fontWeight:FontWeight.bold,color: Colors.white),),backgroundColor:Colors.blue,elevation: 5.0,),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri("https://www.freeprivacypolicy.com/live/08f5d65f-0776-4cda-8024-aed7ccb4dc57")),
            onWebViewCreated: (InAppWebViewController controller) {
              webview = controller;
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          _progress < 1
              ? const Center(
                child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(),
                          ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}