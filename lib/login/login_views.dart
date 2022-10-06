// import 'package:flutter/material.dart';
// import 'package:fluttertest/bean/api.dart';
// import 'package:fluttertest/login/http_manager.dart';
// import 'package:fluttertest/login/news_s.dart';
// import 'package:fluttertest/utils/list_util.dart';
//
// enum LoadStatus {
//   init,
//   loading,
//   success,
//   error,
//   noData,
//   noMore,
// }
//
// class LoginView extends StatefulWidget {
//   const LoginView({Key? key}) : super(key: key);
//
//   @override
//   State<LoginView> createState() => _LoginViewState();
// }
//
// class _LoginViewState extends State<LoginView> {
//   LoadStatus loadStatus = LoadStatus.init;
//
//   News? news;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('登录'),
//       ),
//       body: getBody(),
//     );
//   }
//
//   Widget getBody() {
//     if (loadStatus == LoadStatus.init) {
//       return ElevatedButton(
//           onPressed: () {
//             getHttp();
//           },
//           child: Text('登录'));
//     }
//
//     if (loadStatus == LoadStatus.loading) {
//       return Text('加载中...');
//     }
//     if (loadStatus == LoadStatus.error) {
//       return Text('加载失败');
//     }
//     if (loadStatus == LoadStatus.success) {
//       return SingleChildScrollView(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 getHttp();
//               },
//               child: Text('Dio Get'),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, "news");
//                 },
//                 child: const Text("新闻")),
//             ...List.generate(news!.result!.data!.length, (index) {
//               final vo = news!.result!.data![index];
//
//               return Text('${vo.title}');
//             })
//           ],
//         ),
//       );
//     }
//     return const SizedBox();
//   }
//
//   void getHttp() async {
//     setState(() {
//       loadStatus = LoadStatus.loading;
//     });
//
//     final manager = HttpManager.getInstance();
//     final response = await manager.get(Api.getNewsList);
//
//     if (response.statusCode == 200) {
//       final data = response.data;
//
//       News news = News.fromJson(data);
//
//       final list = news.result?.data;
//
//       if (ListUtil.isNull(list)) {
//         loadStatus = LoadStatus.noData;
//       } else {
//         loadStatus = LoadStatus.success;
//       }
//
//       setState(() {
//         this.news = news;
//       });
//     } else {
//       loadStatus = LoadStatus.error;
//     }
//   }
// }
