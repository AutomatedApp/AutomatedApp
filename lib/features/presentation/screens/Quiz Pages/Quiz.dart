import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/features/presentation/screens/Quiz%20Pages/sendQR.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'navigation_controls.dart';
import 'menu.dart';
import 'web_view_stack.dart';

class QuizPage extends StatefulWidget {
  static final ROUTE='Quiz';
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://docs.google.com/forms/u/0/'),
      );
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'.tr,style: TextStyle(fontSize: AppStrings.app_header),),
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom
                ),
                child: send(),
              ),
            ),
          );
        },
        backgroundColor: AppColors.primary,
      ),
      body:WebViewStack(controller: controller),
    );
  }
}
