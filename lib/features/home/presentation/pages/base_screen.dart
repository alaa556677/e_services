import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/home_container.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import 'base_web_page.dart';
import 'edit_profile_screen_mobile.dart';
import 'home_screen.dart';
import 'home_web_screen.dart';
import 'settings_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          HomeCubit homeCubit = BlocProvider.of(context);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: kIsWeb ? AssetImage('assets/images/background_web2.jpg') : AssetImage('assets/images/starry-night-sky.jpg'),
                      fit: BoxFit.fill,
                    )),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body:  SafeArea(
                  child: Container(
                    child: kIsWeb ? BaseWebPage() : screens[homeCubit.barIndex],
                  ),
                ),
                bottomNavigationBar: kIsWeb ? null :_buildBottomBar(homeCubit: homeCubit),
              ),
            ],
          );
        },
      ),
    );
  }

  ClipRRect _buildBottomBar({HomeCubit? homeCubit}) {
    return ClipRRect(
      borderRadius: const BorderRadiusDirectional.only(
        topEnd: Radius.circular(0),
        topStart: Radius.circular(0),
      ),
      child: BottomNavigationBar(
        backgroundColor: blueColor,
        elevation: 0,
        currentIndex: homeCubit!.barIndex,
        onTap: (newIndex) {
          homeCubit.changeIndex(newIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: textGreyColor,),
            label: 'Home',
            activeIcon:Icon(Icons.home,color: whiteColor,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: textGreyColor,),
            label: 'Settings',
            activeIcon:Icon(Icons.settings,color: whiteColor,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: textGreyColor,),
            label: 'Edit Profile',
            activeIcon:Icon(Icons.person,color: whiteColor,),
          ),
        ],
      ),
    );
  }


  List screens = [
    HomeScreen(),
    SettingsScreen(),
    EditProfileScreen(),
  ];
}