import 'package:fluttertest/base/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
      create: (context) => UserViewModel(),
      child: Scaffold(
        body: body(),
      ),
    );
  }

  Widget body() {
    return Consumer<UserViewModel>(
        builder: (context, model, child) {
          print('构建Consumer的builder');
          return Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              color: Colors.red,
              child: Column(
                children: [

                  child!,

                  Text('count = ${model.count}'),

                  IconButton(
                    onPressed: () {
                      model.changeCount();
                    },
                    icon: const Icon(Icons.add_circle),
                  )
                ],
              ));
        },
        child: getGreen());
  }

  Widget getGreen() {
    print('构建Consumer的child');
    return Container(
      width: 200,
      height: 200,
      color: Colors.green,
    );
  }
}
