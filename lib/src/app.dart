import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/src/pages/LoginScreen.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF128C7E),
      ),
      home: LoginScreen(),
    );
  }
}
