import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'edit_profile_mobile_screen.dart';
import 'edit_profile_web_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? EditProfileWebScreen()
        :EditProfileMobileScreen();
  }
}
