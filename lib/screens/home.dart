import 'package:flutter/material.dart';
import 'screens.dart';
import 'package:immune_africa/themes/themes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Dashboard(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[0],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        unselectedItemColor: const Color(0xffCDC8C8),
        selectedItemColor: primaryAppColor,
        // unselectedFontSize: 12,
        // selectedFontSize: 12,
        // unselectedLabelStyle: Theme.of(context).textTheme.headline1,
        // selectedLabelStyle: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 12, color:primaryAppColor),
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 40,), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 40,), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings, size: 40,), label: 'Settings'),
        ],
      ),

    );
  }
}
