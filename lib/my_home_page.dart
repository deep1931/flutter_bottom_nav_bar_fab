import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_fab/custom/circular_outer_notched_rectangle.dart';
import 'package:flutter_bottom_nav_bar_fab/custom/fab_bottom_nav_bar.dart';
import 'package:flutter_bottom_nav_bar_fab/tabs/about_tab.dart';
import 'package:flutter_bottom_nav_bar_fab/tabs/category_tab.dart';
import 'package:flutter_bottom_nav_bar_fab/tabs/home_tab.dart';
import 'package:flutter_bottom_nav_bar_fab/tabs/notification_tab.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> screensList = [
    HomeTab(),
    CategoryTab(),
    NotificationTab(),
    AboutTab()
  ];

  int currentIndex = 0;

  void onTapSelected(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FabBottomNavBar(
        centerItemLabel: 'Add',
        color: Colors.grey,
        backgroundColor: Colors.white,
        selectedColor: Colors.red,
        //you can use outer and inner circular notch as per need
        //notchedShape: CircularOuterNotchedRectangle(),
        notchedShape: CircularNotchedRectangle(),

        onTabSelected: (index) {
          onTapSelected(index);
        },

        items: [
          FabBottomNavBarItem(icon: Icons.home, title: 'Home'),
          FabBottomNavBarItem(icon: Icons.category, title: 'Category'),
          FabBottomNavBarItem(icon: Icons.info, title: 'About'),
          FabBottomNavBarItem(icon: Icons.notifications, title: 'Notifi'),
        ],
      ),
      body: screensList[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hi i am center button');
        },
        child: Icon(Icons.add),
        elevation: 3.0,
      ),
    );
  }
}
