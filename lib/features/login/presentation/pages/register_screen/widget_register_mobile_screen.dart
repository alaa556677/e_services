import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_services/features/home/presentation/pages/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/button_custom_widget.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../cubit/register_cubit.dart';
import '../../cubit/register_states.dart';
import '../login_screen/Login_screen.dart';

class RegisterMobileScreen extends StatelessWidget{
  RegisterMobileScreen({super.key, required this.state,
    required this.registerCubit, required this.formKey, required this.lastNameController,
    required this.firstNameController, required this.passwordController,
    required this.emailController, required this.repeatPasswordController
  });
  RegisterStates state;
  RegisterCubit registerCubit;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController repeatPasswordController;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConditionalBuilder(
                      condition: state is! UploadImageRegisterLoading,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          registerCubit.uploadImage();
                        },
                        child: registerCubit.file == null ? SvgPicture.asset(
                          "assets/images/profilePicture.svg",
                          color: textGreyColor,
                          width: 80,
                          height: 80,
                        ) : Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: FileImage(registerCubit.file!)
                              )
                          ),
                        ),
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator(),),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(14),
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
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: firstNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'require';
                                }
                                return null;
                              },
                              autoFocus: false,
                              label: "First name",
                              //prefix: const Icon(Icons.person),
                            ),
                          ),
                          const SizedBox(width: 6,),
                          Expanded(
                            child: CustomTextFormField(
                              controller: lastNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'require';
                                }
                                return null;
                              },
                              autoFocus: false,
                              label: "Last name",
                              //prefix: const Icon(Icons.person),
                            ),
                          ),
                        ],
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
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BaseScreen()));
                            },
                          ),
                          fallback: (context) => const Center(child: CircularProgressIndicator(),)
                      ),
                      const SizedBox(height: 20,),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}