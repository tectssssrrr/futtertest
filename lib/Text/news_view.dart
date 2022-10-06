import 'package:flutter/material.dart';
import 'package:fluttertest/base/http/api.dart';
import 'package:fluttertest/base/http/http_manager.dart';
import 'package:fluttertest/login/login_views.dart';
import 'package:fluttertest/login/news_s.dart';
import 'package:fluttertest/utils/list_util.dart';

import 'context_view.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  News? news;

  LoadStatus loadStatus = LoadStatus.init;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('头条'),
        centerTitle: true,
      ),
      body: newsBody(),
    );
  }

  Widget newsBody() {
    if (loadStatus == LoadStatus.init) {
      return ElevatedButton(
          onPressed: () {
            getHttp();
          },
          child: const Text('登录'));
    }

    if (loadStatus == LoadStatus.loading) {
      return const Text('加载中');
    }

    if (loadStatus == LoadStatus.error) {
      return const Text('加载失败');
    }

    if (loadStatus == LoadStatus.success) {
      return ListView(
        children: List.generate(news!.result!.data!.length, (index) {
          final vo = news!.result!.data![index];
          return ElevatedButton(
            onPressed: () {
              
            },
            child: Text("${vo.title}"),
          );
        }),
      );
    }
    return const SizedBox();
  }

  void getHttp() async {
    setState(() {
      loadStatus = LoadStatus.loading;
    });

    final manager = HttpManager.getInstance();
    final response = await manager.get(Api.getNewsList);

    if (response.statusCode == 200) {
      final data = response.data;

      News news = News.fromJson(data);

      final list = news.result?.data;

      if (ListUtil.isNull(list)) {
        loadStatus = LoadStatus.noData;
      } else {
        loadStatus = LoadStatus.success;
      }

      setState(() {
        this.news = news;
      });
    } else {
      loadStatus = LoadStatus.error;
    }
  }
}
