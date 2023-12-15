import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/pages/login_signup.dart';

import 'controller/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginSignup(),
      ),
    );
  }
}
