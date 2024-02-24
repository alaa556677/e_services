import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/features/login/presentation/pages/register_screen/register_screen.dart';
import 'package:e_services/features/login/presentation/pages/login_screen/widget_login_mobile_screen.dart';
import 'package:e_services/features/login/presentation/pages/login_screen/widget_login_web_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/button_custom_widget.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          //color: mainColorLight2,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: kIsWeb ? AssetImage('assets/images/background_web.jpg') : AssetImage('assets/images/starry-night-sky.jpg'),
                fit: BoxFit.fill,
              )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child:  kIsWeb ? LoginWebScreen(
                emailController: emailController,
                passwordController: passwordController,
                formKey: formKey
            ): LoginMobileScreen(
              emailController: emailController,
              passwordController: passwordController,
              formKey: formKey,
            )
          ),
        ),
      ],
    );
  }
}
