import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/features/home/presentation/pages/edit_profile_screen_mobile.dart';
import 'package:e_services/features/home/presentation/pages/home_web_screen.dart';
import 'package:e_services/features/home/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_tab_bar.dart';
import '../../../../core/widgets/tab_widget.dart';
import 'edit_profile_screen.dart';

class BaseWebPage extends StatefulWidget {
  BaseWebPage ({super.key});

  @override
  State<BaseWebPage> createState() => _BaseWebPageState();
}

class _BaseWebPageState extends State<BaseWebPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
@override
  void initState() {
  tabController = TabController(vsync: this, length: tabList.length);
  super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: double.infinity,
            color: Colors.white.withOpacity(0.9),
            child: CustomTabBar(
                tabController: tabController, tabList: tabList)),
        Expanded(
            child: TabBarView(
                controller: tabController,
                children: [
                  HomeWebScreen(),
                  SettingsScreen(),
                  EditProfileScreen()
                ]
            )
        ),
      ],
    );
  }

  final List<Widget> tabList = [
    TabWidget(
      label: 'Home',
      rightDivider: true,
    ),
    TabWidget(
      label: 'Settings',
      rightDivider: true,
    ),
    TabWidget(
      label: 'Edit Profile',
      rightDivider: false,
    ),

  ];

}
