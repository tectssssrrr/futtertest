import 'package:flutter/material.dart';
import 'package:fluttertest/base/http/api.dart';
import 'package:fluttertest/base/http/http_manager.dart';
import 'package:fluttertest/login/news_s.dart';
import 'package:fluttertest/utils/list_util.dart';

enum LoadStatus {
  init,
  loading,
  success,
  error,
  noData,
  noMore,
}


class ContextView extends StatefulWidget {
  const ContextView({Key? key}) : super(key: key);

  @override
  State<ContextView> createState() => _ContextViewState();
}

class _ContextViewState extends State<ContextView> {
  News? news;

  LoadStatus? loadStatus = LoadStatus.init;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('${news!.result!.data}')
          ],
        ),
      ),
    );
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
