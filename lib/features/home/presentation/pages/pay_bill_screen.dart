import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_horizontal_divider.dart';

class PayBillScreen extends StatelessWidget {
  const PayBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.only(top:50,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
            text: 'Pay Bill',
          fontColor: blueColor,
          fontSize: 35,
              fontWeight: FontWeight.bold,
        ),
            SizedBox(height: 25,),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                    height: 600,
                    width: double.infinity,
                    decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        payWidget(text: 'ق سابقة'),
                        payWidget(text: 'ق حالية'),
                        payWidget(text: 'متوسط'),
                        payWidget(text: 'ك استهلاك'),
                        payWidget(text: 'قيمة استهلاك'),
                        payWidget(text: 'صرف'),
                        payWidget(text: 'خصومات'),
                        payWidget(text: 'منطقة'),
                        payWidget(text: 'إجمالى الفاتورة'),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    Container(
                      width: 40,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        // gradient: LinearGradient(
                        //     colors: [Colors.white, constantColor]),
                      ),
                    ),
                    SizedBox(
                      height: 255,
                    ),
                    Container(
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        // gradient: LinearGradient(
                        //     colors: [Colors.white, constantColor]),
                      ),
                    ),

                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 250,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(

                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(blueColor)),
                    onPressed: (){},
                    child: Text('ادفع الان',style: TextStyle(
                        fontSize: 30
                    ),)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class payWidget extends StatelessWidget {
  payWidget({
    super.key,
    required this.text
  });
String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: text,
          fontColor: blueColor,
          fontSize: 20,
        ),
        TextWidget(
          text: '1990',
          fontColor: textGreyColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 4,),
        CustomHorizontalDivider(
          width: double.infinity,
        ),
      ],
    );
  }
}
