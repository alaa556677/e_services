import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomeContainer extends StatelessWidget {
  HomeContainer({
    super.key,
    required this.title,
    this.onTap,
    this.image,
    this. width,
    this.height
  });
  String title;
  double? height;
  double? width;
  void Function()? onTap;
  String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:  MediaQuery.of(context).size.height *0.28 ,
        width: width ?? MediaQuery.of(context).size.width *0.3,
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
                  height: height ??MediaQuery.of(context).size.height *0.18,
                  decoration:BoxDecoration(
                    color: kIsWeb ? Colors.white.withOpacity(0.9):Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd:Radius.circular(20)),
                  ),
                ),
                Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(image!,
                    height: MediaQuery.of(context).size.height *0.15,
                    width: MediaQuery.of(context).size.width *0.15,),
                )),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15,),
                Text(title,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}