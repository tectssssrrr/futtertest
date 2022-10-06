// import 'package:flutter/material.dart';
// import 'package:fluttertest/text/view/login_view.dart';
// import 'package:fluttertest/text/view/menu_view.dart';
// import 'package:fluttertest/text/view/register_view.dart';
//
// Map<String, WidgetBuilder> routes = {
//   "/": (BuildContext context) => LoginView(),
//   "menu": (BuildContext context) => MenuView(),
//   "register": (BuildContext context) => RegisterView(),
// };

import 'package:flutter/material.dart';
import 'package:fluttertest/Text/news_view.dart';
import 'package:fluttertest/login/login_page.dart';

import '../login/login_views.dart';

Map<String, WidgetBuilder> routes = {
  // "/": (BuildContext context) => LoginView(),
  "news": (BuildContext context) => NewsView(),
  "login": (BuildContext context) => const LoginPage(),
};
