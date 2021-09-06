import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasabahce_artifacts/models/artifact_model.dart';
import 'package:pasabahce_artifacts/screens/categories_screen.dart';
import 'package:pasabahce_artifacts/screens/home_screen.dart';
import 'package:pasabahce_artifacts/screens/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bnbIndex = 0;

  List<Widget> bnbScreens = [HomeScreen(),CategoryScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bnbIndex,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(color: Color(0xFFCC9D76)),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          elevation: 100,
          onTap: (int index) {
            setState(() => bnbIndex = index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps_rounded,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                ),
                label: '')
          ],
        ),
        body: bnbScreens[bnbIndex],
      ),
    );
  }
}

