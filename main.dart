import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebPage',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      routes: {
        "/": (_) => Homes(),
        "/webview": (_) => WebviewScaffold(
              url: "https://www.github.com/neon97",
              appBar: AppBar(
                title: Text("Github Profile !!"),
                centerTitle: true,
              ),
              withJavascript: true,
              withLocalStorage: true,
              withZoom: true,
            ),
      },
    );
  }
}

class Homes extends StatefulWidget {
  @override
  HomesState createState() => HomesState();
}

class HomesState extends State<Homes> {
  final webView = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    webView.close();
  }

  @override
  void dispose() {
    webView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WebPage"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("View Profile !"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/webview");
                },
              ),
            ],
          ),
        ));
  }
}
