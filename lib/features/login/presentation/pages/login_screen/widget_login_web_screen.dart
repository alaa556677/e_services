import 'package:e_services/features/login/presentation/pages/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/button_custom_widget.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class LoginWebScreen extends StatelessWidget{
  TextEditingController emailController;
  TextEditingController passwordController;
  var formKey;
  LoginWebScreen({super.key, required this.emailController, required this.passwordController, required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 20),
        child: SizedBox(
          width: 500,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.jpg'),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: whiteColor
                  ),
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                        radius: 10,
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
                        radius: 10,
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
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: ButtonCustomWidget(
                          buttonColor: blueColor,
                          text: "Sign In",
                          color: whiteColor,
                          buttonWidth:
                          MediaQuery.of(context).size.width,
                          buttonHeight: 48,
                          onPressed: (){},
                        ),
                      ),
                      const SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "Don't have an account?",
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            fontColor: textGreyColor,
                          ),
                          const SizedBox(width: 5,),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  TextWidget(
                    text: "Or",
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontColor: whiteColor,
                  )
                ],),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 56,
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
          ),
        ),
      ),
    );
  }
}