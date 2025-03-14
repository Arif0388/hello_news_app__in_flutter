
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key, required this.blogUrl});
 final String blogUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        title:Text('Article View Page!',style:Theme.of(context).textTheme.headlineSmall,),
        elevation:1,
      ),
      body:WebView(
        initialUrl:blogUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
