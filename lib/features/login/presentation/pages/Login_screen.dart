import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/features/login/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/button_custom_widget.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .30,
                    width: double.infinity,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.jpg'),
                            fit: BoxFit.fill
                          )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Login",
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
                            label: "Email address",
                            prefix: const Icon(Icons.email_outlined),
                            autoFocus: false,
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
                          const SizedBox(height: 30),
                          ButtonCustomWidget(
                            buttonColor: blueColor,
                            text: "Sign In",
                            color: whiteColor,
                            buttonWidth:
                            MediaQuery.of(context).size.width,
                            buttonHeight: 48,
                            onPressed: (){},
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: "Don't have an account?",
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                fontColor: textGreyColor,
                              ),
                              const SizedBox(width: 5,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                                },
                                child: TextWidget(
                                  text: "Sign Up",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  fontColor: blueColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                            TextWidget(
                              text: "Or",
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontColor: textGreyColor,
                            )
                          ],),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 48,
                                  width: MediaQuery.of(context).size.width * .70,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: textGreyColor,
                                      )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/images/signin_google.svg"),
                                      const SizedBox(width: 10,),
                                      TextWidget(
                                        text: "Sign in with Google",
                                        fontColor: textGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
  }
}
