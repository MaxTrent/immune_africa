import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:immune_africa/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';
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
    Profile(),
    Settings(),
  ];
  DateTime? currentBackPressTime;


  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Tap again to exit');
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashBoardProvider>(
      create: (_)=> DashBoardProvider(),
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          body: _pages[_selectedIndex],
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
            // unselectedLabelStyle: Theme.of(context).textTheme.displaySmall,
            // selectedLabelStyle: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 12, color:primaryAppColor),
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 40.r,), label: 'Home',),
              BottomNavigationBarItem(icon: Icon(Icons.person, size: 40.r,), label: 'Profile'),
              BottomNavigationBarItem(icon: Icon(Icons.settings, size: 40.r,), label: 'Settings'),
            ],
          ),

        ),
      ),
    );
  }

}
