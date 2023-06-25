import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'navigation_controls3.dart';
import 'web_view_stack3.dart';


class Uploadedfiles extends StatefulWidget {
  static final ROUTE='Uploadedfiles';
  const Uploadedfiles({Key? key}) : super(key: key);

  @override
  State<Uploadedfiles> createState() => _Uploadedfiles();
}

class _Uploadedfiles extends State<Uploadedfiles> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://drive.google.com/'),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploaded Files'.tr,style: TextStyle(fontSize: 20),),
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: WebViewStack(controller: controller),
    );
  }
}
