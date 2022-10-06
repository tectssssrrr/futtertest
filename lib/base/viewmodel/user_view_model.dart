
import 'package:flutter/material.dart';
import 'package:fluttertest/base/model/user_model.dart';
import 'package:fluttertest/base/view/base_status.dart';
import 'package:fluttertest/bean/user_vo.dart';

///   git    代码仓库， ，下载，安装，以及
///   github  开设一个账号
///
class UserViewModel extends ChangeNotifier{

  int count = 0;

  UserVo? userVo;

  LoadStatus status = LoadStatus.loading;

  late UserModel userModel;

  UserViewModel(){
    userModel = UserModel();
  }


  ///获取用户信息
  void getUserInfo() async {

    final user = await userModel.getUserInfo();

    if(user!=null){
      userVo = user;
      status = LoadStatus.success;
    }else{
      status = LoadStatus.error;
    }

    notifyListeners();

  }



  void changeCount(){
    count++;
    notifyListeners();
  }
}