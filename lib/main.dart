

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:lecture_app/core/utils/constant.dart';
import 'package:lecture_app/features/modules/firebase_options.dart';
import 'package:lecture_app/home.dart';

import 'core/utils/network/local_network.dart';

//late SharedPreferences shaedpref;
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await cashNetwork.cashInitialization();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  token= cashNetwork.getCashData(key: "token");
  runApp(const MyApp());
}



