import 'package:flutter/material.dart';
import 'package:testtree/feature/home/setting/views/upload_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, this.index});
  int? index;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndexed = 0;
  List<Widget> pages = [UploadPage()];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
