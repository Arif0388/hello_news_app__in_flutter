
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key, required this.blogUrl});
 final String blogUrl;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  var loadingPercentage = 0;
  @override
  void initState(){
    super.initState();
    controller = WebViewController()
    ..setNavigationDelegate(NavigationDelegate(
      onPageStarted:(url){
         setState(() {
           loadingPercentage = 0;
         });
      },
      onProgress:(progress){
        setState(() {
           loadingPercentage = progress;
        });
      },
      onPageFinished:(url){
        setState(() {
          loadingPercentage = 100;
        });
      }
    ))
    ..loadRequest(Uri.parse(widget.blogUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        title:Text('Article View Page!',style:Theme.of(context).textTheme.headlineSmall,),
        elevation:1,
      ),
      body:Stack(
        children:[
          WebViewWidget(
            controller:controller,
          ),
          loadingPercentage < 100 ? const Center(child: CupertinoActivityIndicator(color:Colors.greenAccent)) : Container(),
        ]
      ),
    );
  }
}
