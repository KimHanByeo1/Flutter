import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_tabbar_class_app/siteName.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.siteName});
  final String siteName;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading;
  // late String siteName1;
  late TextEditingController siteText;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    siteText = TextEditingController();
    // siteName1 = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.cyan,
      //   title: Center(
      //     child: Column(
      //       children: [
      //         Row(
      //           children: [
      //             SizedBox(
      //               width: 310,
      //               child: TextField(
      //                 controller: siteText,
      //                 decoration: const InputDecoration(
      //                   hintText: 'Site를 입력하세요',
      //                 ),
      //                 keyboardType: TextInputType.url,
      //               ),
      //             ),
      //             IconButton(
      //                 onPressed: () {
      //                   setState(() {
      //                     siteName = siteText.text;
      //                   });
      //                   _reloadSite();
      //                 },
      //                 icon: const Icon(Icons.adb))
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          WebView(
            initialUrl: ,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewController) {
              _controller.complete(webviewController);
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: () {
                controller.data!.goBack(); // ! << 널 세이프티 이전 데이터가 없을때 처리해줌
              },
              child: const Icon(Icons.arrow_back),
            );
          }
          return Stack();
        },
      ),
    );
  }

  // --- Functions
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }
} // End
