import 'package:coffee_counter/presentation/maschines/maschines_page.dart';
import 'package:coffee_counter/presentation/settings/settings_page.dart';
import 'package:flutter/material.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int _currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavbarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.coffee_maker), label: "Maschinen"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Einstellungen")
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          MaschinesPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.white38,
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        items: bottomNavbarItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
