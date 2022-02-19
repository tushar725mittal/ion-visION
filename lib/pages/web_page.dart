import 'dart:async';     // Add this import for Completer
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

class WebViewClass extends StatefulWidget {
  final url;

  const WebViewClass({Key? key,@required this.url}) : super(key: key);
  WebViewState createState() => WebViewState(url);

}

class WebViewState extends State<WebViewClass>{
  final url;
  int position = 1 ;

  final key = UniqueKey();

  WebViewState(@required this.url);

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A){
    setState(() {
      position = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
     appBar: AppBar(
         backgroundColor: Colors.pink,
        title: "Broker Space".text.bold.white.xl.make()),
      body: IndexedStack(
      index: position,
      children:<Widget>[

      SafeArea(
          top: true,
          bottom: true,
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          key: key ,
          onPageFinished: doneLoading,
          onPageStarted: startLoading,
          ),
      ),

       Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator()),
        ),
        
      ])
  );
  }
}