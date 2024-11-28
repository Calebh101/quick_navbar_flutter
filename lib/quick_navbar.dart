library quick_navbar;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuickNavBar extends StatefulWidget {
  final List items;
  final Color selectedColor;
  final dynamic type;

  const QuickNavBar({
    super.key,
    required this.items,
    this.type,
    this.selectedColor = Colors.blue,
  });

  @override
  _QuickNavBarState createState() => _QuickNavBarState();
}

class _QuickNavBarState extends State<QuickNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.items[_selectedIndex]["widget"],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: widget.items.map((tab) {
          return BottomNavigationBarItem(
            icon: Icon(tab['icon']),
            activeIcon: Icon(tab.containsKey('selectedIcon') ? tab["selectedIcon"] : tab["icon"]),
            label: tab['label'],
          );
        }).toList(),
        selectedItemColor: widget.selectedColor,
        type: widget.type ?? Platform.isIOS || Platform.isMacOS || kIsWeb ? BottomNavigationBarType.fixed : BottomNavigationBarType.shifting,
      ),
    );
  }
}