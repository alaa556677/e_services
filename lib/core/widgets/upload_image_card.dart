import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import '../utils/colors.dart';
import 'custom_text.dart';

class UploadImageCard extends StatelessWidget{
  String text;
  String imagePath;
  void Function()? onTap;
  File? image;
  UploadImageCard({super.key, required this.text, this.onTap, required this.imagePath, this.image});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150.h,
        padding: EdgeInsetsDirectional.symmetric(vertical: 12.h,horizontal: 12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: textGreyColor,
              width: 1,
            )
        ),
        child: image == null ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 80.h, width: 80.w,),
            SizedBox(height: 8.h,),
            TextWidget(
              text: text,
              fontColor: textGreyColor,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ],
        ) : Image.file(image!, fit: BoxFit.cover,),
      ),
    );
  }
}