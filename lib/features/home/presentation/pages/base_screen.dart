import 'dart:io';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import '../../../login/presentation/pages/edit_profile_screen.dart';
import 'home_screen.dart';
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
          return DefaultScreen(
            body:  SafeArea(
              child: Container(
                child: screens[homeCubit.barIndex],
              ),
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
        topEnd: Radius.circular(0),
        topStart: Radius.circular(0),
      ),
      child: BottomNavigationBar(
        backgroundColor: blueColor.withOpacity(.9),
        elevation: 0,
        currentIndex: homeCubit!.barIndex,
        onTap: (newIndex) {
          homeCubit.changeIndex(newIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: blackColor,),
            label: 'Home',
            activeIcon:Icon(Icons.home,color: whiteColor,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: blackColor,),
            label: 'Settings',
            activeIcon:Icon(Icons.settings,color: whiteColor,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: blackColor,),
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