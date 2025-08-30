import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:recetasappg13/models/screen_model.dart';

class HomeCurvedNavigationPage extends StatefulWidget {
  HomeCurvedNavigationPage({super.key});

  @override
  State<HomeCurvedNavigationPage> createState() =>
      _HomeCurvedNavigationPageState();
}

class _HomeCurvedNavigationPageState extends State<HomeCurvedNavigationPage> {
  int _activePageIndex = 0;

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: pageDetails.map((page) => Icon(page.icon)).toList(),
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: Duration(seconds: 1),
            curve: Curves.decelerate,
          );
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          _activePageIndex = index;
          setState(() {});
        },
        children: pageDetails.map((element) => element.page).toList(),
      ),
    );
  }
}
