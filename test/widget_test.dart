// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// import 'package:fluttertest/pages/main.dart';
//
// void main() {
//   // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//   //   // Build our app and trigger a frame.
//   //   await tester.pumpWidget(const MyApp());
//   //
//   //   // Verify that our counter starts at 0.
//   //   expect(find.text('0'), findsOneWidget);
//   //   expect(find.text('1'), findsNothing);
//   //
//   //   // Tap the '+' icon and trigger a frame.
//   //   await tester.tap(find.byIcon(Icons.add));
//   //   await tester.pump();
//   //
//   //   // Verify that our counter has incremented.
//   //   expect(find.text('0'), findsNothing);
//   //   expect(find.text('1'), findsOneWidget);
//   // });
//   String userinfo = '{"username": "张三", "age": 20}';
//
//   Map u = json.decode(userinfo); //把json字符串转换成Map类型
//
//   print(u["username"]);
//   // @override
//   // void initState() {
//   //   super.initState();
//   //
//   //   // Map userInfo = {'username': '张三', 'age': 20};
//   //   // var a = json.encode(userInfo);  //把Map类型转换成json字符串
//   //   //
//   //   // print(userInfo is Map);
//   //   //
//   //   // print(a is String);
//   //
//   //   // String userinfo = '{"username": "张三", "age": 20}';
//   //   //
//   //   // Map u = json.decode(userinfo); //把json字符串转换成Map类型
//   //   //
//   //   // print(u["username"]);
//   // }
// }
