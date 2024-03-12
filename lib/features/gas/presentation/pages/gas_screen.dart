import 'package:e_services/core/widgets/default_screen.dart';
import 'package:e_services/features/home/presentation/pages/pay_bill_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/card_basic_item.dart';
import '../../../../core/widgets/home_component.dart';
import '../cubit/gas_cubit.dart';
import '../cubit/gas_states.dart';
import 'gas_installation_screen.dart';

class GasScreen extends StatelessWidget{
  const GasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GasCubit(),
      child: BlocConsumer<GasCubit, GasStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultScreen(
                body: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardBasicItem(
                        title: 'التعاقد',
                        subTitle: 'يمكنك تقديم طلب لتركيب عداد جديد بدون الحاجة للذهاب الى الشركة',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  GasInstallationScreen()));
                        },
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/installation.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                      SizedBox(height: 20.h,),
                      CardBasicItem(
                        title: 'التعديل والصيانة',
                        subTitle: 'يمكنك تقديم طلب للتعديل او لصيانة العداد من خلال البرنامج وسيتم التواصل معك للمتابعة',
                        onTap: () {},
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/maintenance.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                      SizedBox(height: 20.h,),
                      CardBasicItem(
                        title: 'قراءة العداد',
                        subTitle: 'يمكنك تصوير العداد لرفع القراءة بدون الحاجة لحضور المحصل',
                        onTap: (){},
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/water_meter.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                      SizedBox(height: 20.h,),
                      CardBasicItem(
                        title: 'رفع العداد',
                        subTitle: 'يمكنك تقديم طلب لرفع العداد بدود الحضور الى مقر الشركة',
                        onTap: (){},
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/request_remove.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }
}