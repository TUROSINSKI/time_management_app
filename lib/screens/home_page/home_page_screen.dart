import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:timemanagementapp/constants.dart';
import 'package:timemanagementapp/screens/calendar_page/calendar_screen.dart';
import 'package:timemanagementapp/screens/home_page/home_screen.dart';
import 'package:timemanagementapp/screens/to_do_page/to_do_screen.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.settings,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomeScreen(),
          ToDoScreen(),
          CalendarScreen(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: kPrimaryColor,
        selectedItemColor: kPrimaryLightColor,
        unselectedItemColor: Colors.white,
        margin: const EdgeInsets.all(16),
        items: [
          SalomonBottomBarItem(icon: const Icon(Icons.home), title: const Text("Home")),
          SalomonBottomBarItem(
              icon: const Icon(Icons.check_box), title: const Text("ToDo")),
          SalomonBottomBarItem(
              icon: const Icon(Icons.calendar_month), title: const Text("Calendar")),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300), curve: Curves.ease);
          });
        },
      ),
    );
  }
}
