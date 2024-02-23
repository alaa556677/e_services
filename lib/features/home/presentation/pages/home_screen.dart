import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.only(top: 20),
        child: Column(
          children: [
            HomeContainer(
              title: 'Water',
              onTap: (){},
              image: 'assets/water.jpg',
            ),
            SizedBox(height: 40,),
            HomeContainer(
              title: 'Electricity',
              onTap: (){},
              image: 'assets/water.jpg',
            ),
            SizedBox(height: 40,),
            HomeContainer(
              title: 'Gas',
              onTap: (){},
              image: 'assets/water.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

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
          color: Colors.blue,
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
