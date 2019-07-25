import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  final String url;

  NewsWebView({this.url});

  @override
  _NewsWebViewState createState() => _NewsWebViewState(url: this.url);
}

class _NewsWebViewState extends State<NewsWebView> {

  final String url;
  final _key = UniqueKey();
  int _stackToView = 1;
  WebViewController webViewController;

  _NewsWebViewState({@required this.url});

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("News View"),),
        body: IndexedStack(
          index: _stackToView,
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: WebView(
                      javascriptMode: JavascriptMode.disabled,
                      initialUrl: this.url,
                      onPageFinished: _handleLoad),

                ),
              ],
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        )

    );
  }
}

