import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading;
  late String siteName;
  late TextEditingController siteText;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    siteText = TextEditingController();
    siteName = 'www.google.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 310,
                      child: TextField(
                        controller: siteText,
                        decoration: const InputDecoration(
                          hintText: 'Site를 입력하세요',
                        ),
                        keyboardType: TextInputType.url,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            siteName = siteText.text;
                          });
                          _reloadSite();
                        },
                        icon: const Icon(Icons.adb))
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: 'https://$siteName',
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
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 30,
            ),
            FutureBuilder<WebViewController>(
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
            const SizedBox(
              width: 10,
            ),
            FutureBuilder<WebViewController>(
              future: _controller.future,
              builder: (BuildContext context,
                  AsyncSnapshot<WebViewController> controller) {
                if (controller.hasData) {
                  return FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: () {
                      controller.data!.reload(); // ! << 널 세이프티 이전 데이터가 없을때 처리해줌
                    },
                    child: const Icon(Icons.refresh),
                  );
                }
                return Stack();
              },
            ),
            const SizedBox(
              width: 10,
            ),
            FutureBuilder<WebViewController>(
              future: _controller.future,
              builder: (BuildContext context,
                  AsyncSnapshot<WebViewController> controller) {
                if (controller.hasData) {
                  return FloatingActionButton(
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      controller.data!
                          .goForward(); // ! << 널 세이프티 이전 데이터가 없을때 처리해줌
                    },
                    child: const Icon(Icons.arrow_forward),
                  );
                }
                return Stack();
              },
            ),
          ],
        ));
  }

  // --- Functions
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }
} // End
