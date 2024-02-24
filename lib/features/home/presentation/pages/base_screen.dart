import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/home_container.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import 'base_web_page.dart';
import 'edit_profile_screen.dart';
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
          return Scaffold(
            backgroundColor: Colors.white.withOpacity(0.9),

            body:  Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: kIsWeb ? AssetImage('assets/images/background_web2.jpg') : AssetImage('assets/images/starry-night-sky.jpg'),
                    fit: BoxFit.fill,
                  )),
              child: kIsWeb ? BaseWebPage()
                  : Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: screens[homeCubit.barIndex],
              )
            ),
            bottomNavigationBar: kIsWeb ? null :_buildBottomBar(homeCubit: homeCubit),
          );
        },
      ),
    );
  }

  ClipRRect _buildBottomBar({HomeCubit? homeCubit}) {
    return ClipRRect(
      borderRadius: const BorderRadiusDirectional.only(
        topEnd: Radius.circular(25),
        topStart: Radius.circular(25),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.grey.withOpacity(0.4),
        elevation: 0,
        currentIndex: homeCubit!.barIndex,
        onTap: (newIndex) {
          homeCubit.changeIndex(newIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white,),
            label: 'Home',
            activeIcon:Icon(Icons.home,color: blueColor,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: Colors.white,),
            label: 'Settings',
            activeIcon:Icon(Icons.settings,color: blueColor,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.white,),
            label: 'Edit Profile',
            activeIcon:Icon(Icons.person,color: blueColor,),
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