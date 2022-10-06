
import 'package:flutter/material.dart';

enum LoadStatus {
  init,
  loading,
  success,
  error,
  noData,
  noMore,
}


///页面的状态
abstract class BaseStatus{

  Widget success();

  Widget error();
}