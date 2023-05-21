import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const button_color = Color.fromRGBO(235, 189, 94 ,1);

class Webview_Coinbase extends StatefulWidget {
  @override
  State<Webview_Coinbase> createState() => _Webview_Coinbase();
}

class _Webview_Coinbase extends  State<Webview_Coinbase>{

  bool isLoading = true;
  String url = 'https://www.coinbase.com/tr/';

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        WebView(
          initialUrl: url,
          allowsInlineMediaPlayback: true,
          debuggingEnabled: false,
          initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
          },
        ),

        Visibility(
          visible: isLoading,
          child: const Center(
            child: CircularProgressIndicator(color: button_color,),
          ),
        ),
      ],

    );


  }
}