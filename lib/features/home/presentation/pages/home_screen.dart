import 'package:e_services/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/home_container.dart';
import 'pay_bill_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHome = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isHome ? Padding(
        padding:   EdgeInsets.only(top:  MediaQuery.of(context).size.height *0.02 ),
        child: Column(
          children: [
            HomeContainer(
              title: 'Water',
              onTap: (){
                setState(() {
                isHome =! isHome;
                });
              },
              image: 'assets/images/water.jpg',
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.04 ,),
            HomeContainer(
              title: 'Electricity',
              onTap: (){
                setState(() {
                  isHome =! isHome;
                });
              },
              image: 'assets/images/electricity.png',
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.04,),
            HomeContainer(
              title: 'Gas',
              onTap: (){
                setState(() {
                  isHome =! isHome;
                });
              },
              image: 'assets/images/gas.png',
            ),
          ],
        )
      )
          :Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 250,
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(blueColor)),
                  onPressed: () => pickCameraImage(),
                  child: Text('قراءة العداد',style: TextStyle(
                      fontSize: 30
                  ),)
              ),
            ),
            SizedBox(height:  MediaQuery.of(context).size.height *0.06,),
            Container(
              height: 100,
              width: 250,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(blueColor)),
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PayBillScreen(),));
                  },
                  child: Text('دفع الفاتورة',style: TextStyle(
                      fontSize: 30
                  ),)
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future pickCameraImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }
}


