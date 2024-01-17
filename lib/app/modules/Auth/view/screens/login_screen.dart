import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser/app/modules/Auth/controller/login_controller.dart';
import 'package:laser/app/modules/Auth/view/widgets/model_layout.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthModelPage(
      authContant: Column(
        children: [],
      ),
    );
  }
}
