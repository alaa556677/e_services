import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/utils/colors.dart';
import 'features/login/presentation/pages/login_screen/Login_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds:3), (){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light
        ),
      ),
      body: const Center(child: Image(image: AssetImage('assets/images/splash_image.png')),),
    );
  }
}