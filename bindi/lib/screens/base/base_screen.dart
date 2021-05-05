import 'package:bindi/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final PageController  pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          Container(color: Colors.blue,),
          Container(color: Colors.red,),
          Container(color: Colors.amber,),
          Container(color: Colors.purple,)
        ],
      ),
    );
  }
}
