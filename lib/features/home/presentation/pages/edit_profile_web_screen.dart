import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/button_custom_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'base_screen.dart';

class EditProfileWebScreen extends StatelessWidget {
  EditProfileWebScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.35),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
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
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: whiteColor
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CustomTextFormField(
                      label: 'name',
                      autoFocus: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required Field';
                        }
                        return null;
                      },
                      controller: nameController,
                    ),
                    CustomTextFormField(
                      label: 'Email Address',
                      autoFocus: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required Field';
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                    CustomTextFormField(
                      label: 'Date of birth',
                      autoFocus: false,
                      controller: dateController,
                    ),
                    CustomTextFormField(
                      label: 'Password',
                      autoFocus: false,
                      controller: passwordController,
                    ),
                    CustomTextFormField(
                      label: 'Confirm Password',
                      autoFocus: false,
                      controller: repeatPasswordController,
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonCustomWidget(
              buttonColor: blueColor,
              text: "Edit Profile",
              color: whiteColor,
              buttonWidth:
              MediaQuery.of(context).size.width,
              buttonHeight: 48,
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  BaseScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
