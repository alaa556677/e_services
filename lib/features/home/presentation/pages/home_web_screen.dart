import 'package:e_services/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/home_container.dart';
import 'pay_bill_screen.dart';

class HomeWebScreen extends StatefulWidget {
  const HomeWebScreen({super.key});

  @override
  State<HomeWebScreen> createState() => _HomeWebScreenState();
}

class _HomeWebScreenState extends State<HomeWebScreen> {
  bool isHome = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height:  MediaQuery.of(context).size.width *0.1,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.02 ),
          child: isHome ? Row(
            children: [
              HomeContainer(
                title: 'Water',
                width: MediaQuery.of(context).size.width *0.28,
                onTap: (){
                  setState(() {
                    isHome =! isHome;
                  });
                },
                image: 'assets/images/water-removebg-preview.png',
              ),
               SizedBox(width: MediaQuery.of(context).size.width *0.04),
              HomeContainer(
                title: 'Electricity',
                width: MediaQuery.of(context).size.width *0.28,
                onTap: (){
                  setState(() {
                    isHome =! isHome;
                  });
                },
                image: 'assets/images/electricity.png',
              ),
              SizedBox(width: MediaQuery.of(context).size.width *0.04),
              HomeContainer(
                title: 'Gas',
                width: MediaQuery.of(context).size.width *0.28,
                onTap: (){
                  setState(() {
                    isHome =! isHome;
                  });
                },
                image: 'assets/images/gas.png',
              ),
            ],
          )
          :payWebScreen(context),
        ),
        SizedBox(height:  MediaQuery.of(context).size.width *0.05,),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: TextWidget(
                fontColor: blueColor,
                fontSize: 20,
                text: 'هل تبحث عن طريقة سهلة لدفع فواتير الماء، الكهرباء، والغاز؟'
                ' موقعنا يقدم لك الحل الذي تبحث عنه! مع واجهة مستخدم بسيطة وآمنة'
                '، يمكنك الآن دفع فواتيرك بكل يسر وسهولة. استمتع بالراحة'
                ' والسهولة في إدارة حساباتك المالية مع خدمتنا السلسة للدفع الإلكتروني.'),
          ),
        )
      ],
    );
  }

  SingleChildScrollView payWebScreen(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width *0.13,
              height: MediaQuery.of(context).size.height *0.07,
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      isHome =! isHome;
                    });
                  },
                  child: TextWidget(
                    text: 'Back',
                    fontSize: 25,
                    fontColor: Colors.white,
                  ),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.028,),
            Stack(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.018),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width *0.040,
                        vertical: MediaQuery.of(context).size.width *0.015),
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
                      height: MediaQuery.of(context).size.height * 0.120,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *0.04,
                      height: MediaQuery.of(context).size.height *0.05,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *0.500,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *0.04,
                      height: MediaQuery.of(context).size.height *0.05,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),

                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.02,),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width *0.250,
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
            SizedBox(height: MediaQuery.of(context).size.height *0.05,),
          ],
        ),
      );
  }
}
