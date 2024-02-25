import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget{
  DefaultScreen({super.key, required this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
        child,
      ],
    );
  }
}