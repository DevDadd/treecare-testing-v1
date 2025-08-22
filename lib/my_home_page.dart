import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testtree/feature/home/setting/views/home_page.dart';
import 'package:testtree/feature/home/setting/views/upload_page_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.index});
  final int? index;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavIndex = 1;

  final iconList = <IconData>[FontAwesomeIcons.file, FontAwesomeIcons.house];

  final List<Widget> pages = [const UploadPageProvider(), const HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_bottomNavIndex],

      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.white,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        inactiveColor: Colors.grey,
        activeColor: Colors.green,
      ),
    );
  }
}
