import 'package:e_services/features/login/presentation/pages/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/button_custom_widget.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../home/presentation/pages/base_screen.dart';

class LoginMobileScreen extends StatelessWidget{
  TextEditingController emailController;
  TextEditingController passwordController;
  var formKey;
  LoginMobileScreen({super.key, required this.emailController, required this.passwordController, required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                       width: 100,
                       height: 100,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0,0),
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 14
                      )
                    ]
                  ),
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
                        controller: passwordController,
                        radius: 10,
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
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const BaseScreen()));
                        },
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
                    ],
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


//const SizedBox(height: 20,),
// Row(mainAxisAlignment: MainAxisAlignment.center,children: [
//   TextWidget(
//     text: "Or",
//     fontSize: 16,
//     fontWeight: FontWeight.w300,
//     fontColor: blackColor,
//   )
// ],),
// const SizedBox(height: 20,),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     GestureDetector(
//       onTap: (){},
//       child: Container(
//         height: 56,
//         width: MediaQuery.of(context).size.width * .70,
//         decoration: BoxDecoration(
//             color: whiteColor,
//             borderRadius: BorderRadius.circular(25),
//             border: Border.all(color: textGreyColor,
//             )
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset("assets/images/signin_google.svg"),
//             const SizedBox(width: 10,),
//             TextWidget(
//               text: "Sign in with Google",
//               fontColor: textGreyColor,
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//             ),
//           ],
//         ),
//       ),
//     ),
//   ],
// ),