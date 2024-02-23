import 'package:flutter/material.dart';

import '../../../../core/widgets/home_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            HomeContainer(
              title: 'Water',
              onTap: (){},
              image: 'assets/images/water.jpg',
            ),
            const SizedBox(height: 40,),
            HomeContainer(
              title: 'Electricity',
              onTap: (){},
              image: 'assets/images/water.jpg',
            ),
            SizedBox(height: 40,),
            HomeContainer(
              title: 'Gas',
              onTap: (){},
              image: 'assets/images/water.jpg',
            ),
          ],
        ),
      ),
    );
  }
}


