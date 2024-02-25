import 'package:e_services/core/widgets/default_screen.dart';
import 'package:e_services/features/home/presentation/pages/pay_bill_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/home_component.dart';

class WaterScreen extends StatelessWidget{
  const WaterScreen({super.key});
  Future pickCameraImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeComponent(
                    text: 'قراءة العداد',
                    onTap: () => pickCameraImage(),
                    fontSize: 14,
                    widthContainer: MediaQuery.of(context).size.width * (143 / 430),
                    heightContainer: MediaQuery.of(context).size.height * (156 / 932),
                    colorContainer: whiteColor,
                    isSvg: false,
                    pathImage: 'assets/images/water_meter.png',
                    imageWidth: 60,
                    imageHeight: 60,
                    fontColor: textGreyColor,
                  ),
                  const SizedBox(width: 20,),
                  HomeComponent(
                    text: 'الفاتورة',
                    fontSize: 14,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PayBillScreen(),));
                    },
                    widthContainer: MediaQuery.of(context).size.width * (143 / 430),
                    heightContainer: MediaQuery.of(context).size.height * (156 / 932),
                    colorContainer: whiteColor,
                    isSvg: false,
                    pathImage: 'assets/images/bill.png',
                    imageWidth: 60,
                    imageHeight: 60,
                    fontColor: textGreyColor,
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}