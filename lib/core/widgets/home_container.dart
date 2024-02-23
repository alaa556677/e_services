import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HomeContainer extends StatelessWidget {
  HomeContainer({
    super.key,
    required this.title,
    this.onTap,
    this.image,
  });
  String title;
  void Function()? onTap;
  String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 190,
        width: 300,
        decoration:BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(20),
              topEnd:Radius.circular(20)),
        ),
        child:Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd:Radius.circular(20)),
                  ),
                ),
                Center(child: Image.asset(image!,height: 100,width: 100,)),
              ],
            ),

            Text(title,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}