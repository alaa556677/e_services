import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/features/electricity/presentation/pages/electricity_screen.dart';
import 'package:e_services/features/gas/presentation/pages/gas_screen.dart';
import 'package:e_services/features/water/presentation/pages/water_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/home_component.dart';
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
      child: Padding(
        padding:  const EdgeInsetsDirectional.only(top: 56),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .6,
              alignment: Alignment.center,
              padding: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).size.height * (50 / 932),
                bottom: MediaQuery.of(context).size.height * (50 / 932),
                start: MediaQuery.of(context).size.width * (25 / 430),
                end: MediaQuery.of(context).size.width * (25 / 430),
              ),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: blackColor.withOpacity(.2),
                        offset: const Offset(0, 0),
                        blurRadius: 14)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeComponent(
                        text: 'Water',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const WaterScreen()));
                        },
                        fontSize: 14,
                        widthContainer: MediaQuery.of(context).size.width * (143 / 430),
                        heightContainer: MediaQuery.of(context).size.height * (156 / 932),
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/water.jpg',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColor: textGreyColor,
                      ),
                      const SizedBox(width: 20,),
                      HomeComponent(
                        text: 'Gas',
                        fontSize: 14,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const GasScreen()));
                        },
                        widthContainer: MediaQuery.of(context).size.width * (143 / 430),
                        heightContainer: MediaQuery.of(context).size.height * (156 / 932),
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/gas.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColor: textGreyColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeComponent(
                        text: 'Electricity',
                        fontSize: 14,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ElectricityScreen()));
                        },
                        widthContainer: MediaQuery.of(context).size.width * (143 / 430),
                        heightContainer: MediaQuery.of(context).size.height * (156 / 932),
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/water.jpg',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColor: textGreyColor,
                      ),
                      const SizedBox(width: 20,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * (143 / 430),
                        height: MediaQuery.of(context).size.height * (156 / 932),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }

}


