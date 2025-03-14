import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newsapplication/Pages/WelcomePage/WelcomePage.dart';
import 'package:newsapplication/controller/all_service_controller.dart';

import 'Config/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'News App',
      theme:darkTheme,
      home:const WelcomePage()
    );
  }
}
