import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/features/login/presentation/pages/login_screen/Login_screen.dart';
import 'package:e_services/features/login/presentation/pages/register_screen/widget_register_mobile_screen.dart';
import 'package:e_services/features/login/presentation/pages/register_screen/widget_register_web_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/widgets/button_custom_widget.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../cubit/register_cubit.dart';
import '../../cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static String route = "RegisterScreen";
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  RegisterCubit? registerCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          registerCubit = RegisterCubit.get(context);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                //color: mainColorLight2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: kIsWeb ? AssetImage('assets/images/background_web2.jpg') : AssetImage('assets/images/starry-night-sky.jpg'),
                      fit: BoxFit.fill,
                    )),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: kIsWeb ? RegisterWebScreen(
                      state: state,
                      registerCubit: registerCubit!,
                      formKey: formKey,
                      lastNameController: lastNameController,
                      firstNameController: firstNameController,
                      passwordController: passwordController,
                      emailController: emailController,
                      repeatPasswordController: repeatPasswordController
                  ):RegisterMobileScreen(
                    formKey: formKey,
                    passwordController: passwordController,
                    emailController: emailController,
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    registerCubit: registerCubit!,
                    repeatPasswordController: repeatPasswordController,
                    state: state,
                  )
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
