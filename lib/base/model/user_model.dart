import 'package:fluttertest/base/http/http_manager.dart';
import 'package:fluttertest/bean/user_vo.dart';

///数据提供者
class UserModel {


  ///获取用户信息
  Future<UserVo?> getUserInfo() async {

    await Future.delayed(const Duration(seconds: 2));

    return UserVo(name: '张三',avatar: '');
  }



}
