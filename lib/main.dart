import 'dart:developer';

import 'package:crypto_cal/page/home_page.dart';
import 'package:crypto_cal/page/todo_page.dart';
import 'package:flutter/material.dart';

import 'constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  List pages = [const HomePage(), const TodoPage()];

  void onTap(int index) {
    log("message index: $index");
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text("Crypto Calculator"),
      ),
      body: pages[0],
      /*bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,
        onTap: (index) {
          onTap(index);
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.grey[500],
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                size: 30,
                color: AppColors.white,
              ),
              label: "Home",
              icon: Icon(
                Icons.home,
                size: 30,
                color: AppColors.blackGrey,
              )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.ac_unit,
                size: 30,
                color: AppColors.white,
              ),
              label: "Todo",
              icon: Icon(
                Icons.ac_unit,
                size: 30,
                color: AppColors.blackGrey,
              )),
        ],
      ),*/
    );
  }
}
