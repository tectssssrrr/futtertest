import 'package:flutter/material.dart';
import 'package:fluttertest/base/http/api.dart';
import 'package:fluttertest/base/http/http_manager.dart';

import 'Text/routes.dart';

///哈哈哈哈

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: "login",
    );
  }
}
