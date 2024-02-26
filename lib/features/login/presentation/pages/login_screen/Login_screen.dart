import 'package:e_services/core/widgets/default_screen.dart';
import 'package:e_services/features/login/presentation/pages/login_screen/widget_login_mobile_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      body: LoginMobileScreen(
        emailController: emailController,
        passwordController: passwordController,
        formKey: formKey,
      )
    );
  }
}
