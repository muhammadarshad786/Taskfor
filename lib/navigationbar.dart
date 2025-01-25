import 'package:flutter/material.dart';
import 'package:task_app/Home/home_screen.dart';
import 'package:task_app/earning/earn.dart';
import 'package:task_app/job/job_screen.dart';
import 'package:task_app/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Home(),
    JobScreen(),
    EarningScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Icons/Home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Icons/Work.png')),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Icons/Wallet.png')),
            label: 'earnings',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Icons/Profile1.png')),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
