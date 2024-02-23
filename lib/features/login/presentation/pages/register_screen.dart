import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/features/login/presentation/pages/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/button_custom_widget.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static String route = "RegisterScreen";
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
                      image: AssetImage('assets/images/starry-night-sky.jpg'),
                      fit: BoxFit.fill,
                    )),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Form(
                    key: formKey,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .30,
                          child: ConditionalBuilder(
                            condition: state is! UploadImageRegisterLoading,
                            builder: (context) => GestureDetector(
                              onTap: () {
                                registerCubit!.uploadImage();
                              },
                              child: registerCubit!.file == null ? SvgPicture.asset(
                                "assets/images/profilePicture.svg",
                                color: textGreyColor,
                                width: 100,
                                height: 100,
                              ) : Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: FileImage(registerCubit!.file!)
                                    )
                                ),
                              ),
                            ),
                            fallback: (context) => const Center(child: CircularProgressIndicator(),),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .70,
                          decoration: const BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "Sign Up",
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    fontColor: blackColor,
                                  ),
                                  const SizedBox(height: 30),
                                  CustomTextFormField(
                                    controller: emailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'require';
                                      }
                                      return null;
                                    },
                                    autoFocus: false,
                                    label: "Email address",
                                    prefix: const Icon(Icons.email_outlined),
                                  ),
                                  const SizedBox(height: 15),
                                  CustomTextFormField(
                                    autoFocus: false,
                                    controller: passwordController,
                                    label: "Password",
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'require';
                                      }
                                      return null;
                                    },
                                    prefix: const Icon(Icons.lock_outline),
                                  ),
                                  const SizedBox(height: 15),
                                  CustomTextFormField(
                                    controller: repeatPasswordController,
                                    autoFocus: false,
                                    label: "Repeat Password",
                                    prefix: const Icon(Icons.lock_outline),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'require';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  ConditionalBuilder(
                                      condition: state is !RegisterLoading,
                                      builder: (context) => ButtonCustomWidget(
                                        buttonColor: blueColor,
                                        text: "Sign Up",
                                        color: whiteColor,
                                        buttonWidth:
                                        MediaQuery.of(context).size.width,
                                        buttonHeight: 48,
                                        onPressed: (){},
                                      ),
                                      fallback: (context) => const Center(child: CircularProgressIndicator(),)
                                  ),
                                  const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      TextWidget(
                                        text: "Already have an account?",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                        fontColor: textGreyColor,
                                        fontFamily: "poppins",
                                      ),
                                      const SizedBox(width: 5,),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                        },
                                        child: TextWidget(
                                          text: "Sign In",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          fontColor: blueColor,
                                          fontFamily: "poppins",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
