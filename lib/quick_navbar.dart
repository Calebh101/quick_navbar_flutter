library quick_navbar;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// the actual widget that loads the navbar and inputted pages
class QuickNavBar extends StatefulWidget {
  final List items;
  final Color? color;
  final Color? selectedColor;
  final QuickNavBarType? type;
  final double fontSize;
  final double? selectedFontSize;
  final bool hoverEffect;
  final bool showLabels;

  const QuickNavBar({
    super.key,
    required this.items,
    this.showLabels = true,
    this.type,
    this.fontSize = 12.0,
    this.selectedFontSize,
    this.color,
    this.selectedColor,
    this.hoverEffect = false,
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
      bottomNavigationBar: Theme(
        data: _getBottomNavBarType() == QuickNavBarType.static
            ? ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: widget.hoverEffect ? null : Colors.transparent,
              )
            : ThemeData(
                hoverColor: widget.hoverEffect ? null : Colors.transparent,
              ),
        child: BottomNavigationBar(
          showSelectedLabels: widget.showLabels,
          showUnselectedLabels: widget.showLabels,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: widget.items.map((tab) {
            return tab.containsKey("label") || widget.showLabels == false
                ? BottomNavigationBarItem(
                    icon: Icon(tab['icon']),
                    activeIcon: Icon(tab.containsKey('selectedIcon')
                        ? tab["selectedIcon"]
                        : tab["icon"]),
                    label: tab['label'],
                  )
                : BottomNavigationBarItem(
                    icon: Icon(tab['icon']),
                    activeIcon: Icon(tab.containsKey('selectedIcon')
                        ? tab["selectedIcon"]
                        : tab["icon"]),
                    label: null,
                  );
          }).toList(),
          selectedItemColor: widget.selectedColor,
          unselectedItemColor: widget.color,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
              fontSize: _getBottomNavBarType() == QuickNavBarType.static
                  ? widget.fontSize
                  : (widget.selectedFontSize ?? widget.fontSize * 1.25)),
          unselectedLabelStyle: TextStyle(fontSize: widget.fontSize),
        ),
      ),
    );
  }

  QuickNavBarType _getBottomNavBarType() {
    QuickNavBarType value = _getBottomNavBarTypeHelper(widget.type);
    return value;
  }

  QuickNavBarType _getBottomNavBarTypeHelper(QuickNavBarType? value) {
    if (value != null && value != QuickNavBarType.auto) {
      return value;
    } else if (kIsWeb) {
      return QuickNavBarType.animate;
    } else {
      TargetPlatform platform = defaultTargetPlatform;
      return platform == TargetPlatform.iOS || platform == TargetPlatform.macOS
          ? QuickNavBarType.static
          : QuickNavBarType.animate;
    }
  }
}

enum QuickNavBarType { animate, static, auto }

/// represents the type of navbar animation
class QuickNavbarType {
  final QuickNavBarType type;

  /// animates the navbar with material design
  QuickNavbarType.typeOne() : type = QuickNavBarType.animate;

  /// doesn't animate the navbar with material design
  QuickNavbarType.typeTwo() : type = QuickNavBarType.static;

  /// decides to animate or not animate the navbar with material design by platform
  QuickNavbarType.typeThree() : type = QuickNavBarType.auto;
}
