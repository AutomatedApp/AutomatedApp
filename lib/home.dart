
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lecture_app/config/Thems/app_them.dart';
import 'package:lecture_app/core/utils/Route/RoutePath.dart';
import 'package:lecture_app/core/utils/local/local_controller.dart';
import 'package:lecture_app/features/presentation/screens/splash_screen/splash_screen.dart';
import 'core/utils/local/app_local.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocaleController controller=Get.put(MyLocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appthem(),
      locale:controller.initialLang,
      translations: MyLocale(),
      initialRoute: SplshScreen.ROUTE,
      routes: routes,
    );
  }
}