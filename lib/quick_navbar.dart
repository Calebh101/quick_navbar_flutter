library quick_navbar;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// the actual widget that loads the navbar and inputted pages
class QuickNavBar extends StatefulWidget {
  final List<QuickNavBarItem> items;
  final Color? color;
  final Color? selectedColor;
  final QuickNavBarType? type;
  final double fontSize;
  final double? selectedFontSize;
  final bool hoverEffect;
  final bool showLabels;
  final bool? sidebar;
  final bool sidebarBeta;

  const QuickNavBar({
    super.key,
    required this.items,
    this.showLabels = true,
    this.sidebar,
    this.type,
    this.fontSize = 12.0,
    this.selectedFontSize,
    this.color,
    this.selectedColor,
    this.hoverEffect = false,
    @Deprecated(
        "sidebar mode has exited beta, so sidebarBeta is no longer necessary to use sidebar mode.")
    this.sidebarBeta = true,
  });

  @override
  _QuickNavBarState createState() => _QuickNavBarState();
}

class _QuickNavBarState extends State<QuickNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (widget.items[index].onPressed != null) {
      widget.items[index].onPressed!();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  bool allowSidebar() {
    bool disableAutoSidebar = widget.sidebar == false;
    return widget.sidebar ??
        (disableAutoSidebar
            ? false
            : (MediaQuery.of(context).size.width >
                MediaQuery.of(context).size.height));
  }

  @override
  Widget build(BuildContext context) {
    bool sidebar = allowSidebar();

    return Scaffold(
      body: Center(
        child: sidebar
            ? Row(
                children: [
                  NavigationRail(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: _onItemTapped,
                    labelType: widget.showLabels
                        ? NavigationRailLabelType.all
                        : NavigationRailLabelType.none,
                    destinations: widget.items.map((tab) {
                      return NavigationRailDestination(
                        icon: Icon(tab.icon),
                        selectedIcon: Icon(tab.selectedIcon ?? tab.icon),
                        label: tab.label != null || widget.showLabels == false
                            ? Text(tab.label ?? "")
                            : const SizedBox.shrink(),
                      );
                    }).toList(),
                    selectedIconTheme: IconThemeData(
                      color: widget.selectedColor ??
                          Theme.of(context).colorScheme.secondary,
                    ),
                    unselectedIconTheme: IconThemeData(
                        color: widget.color ??
                            Theme.of(context).colorScheme.secondary),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: widget.items[_selectedIndex].widget,
                    ),
                  ),
                ],
              )
            : widget.items[_selectedIndex].widget,
      ),
      bottomNavigationBar: sidebar
          ? null
          : Theme(
              data: _getBottomNavBarType() == QuickNavBarType.static
                  ? Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor:
                          widget.hoverEffect ? null : Colors.transparent,
                    )
                  : Theme.of(context).copyWith(
                      hoverColor:
                          widget.hoverEffect ? null : Colors.transparent,
                    ),
              child: BottomNavigationBar(
                showSelectedLabels: widget.showLabels,
                showUnselectedLabels: widget.showLabels,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: widget.items.map((tab) {
                  return tab.label != null || widget.showLabels == false
                      ? BottomNavigationBarItem(
                          icon: Icon(tab.icon),
                          activeIcon: Icon(tab.selectedIcon ?? tab.icon),
                          label: tab.label,
                        )
                      : BottomNavigationBarItem(
                          icon: Icon(tab.icon),
                          activeIcon: Icon(tab.selectedIcon ?? tab.icon),
                          label: null,
                        );
                }).toList(),
                selectedItemColor: widget.selectedColor ??
                    Theme.of(context).colorScheme.secondary,
                unselectedItemColor:
                    widget.color ?? Theme.of(context).colorScheme.secondary,
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

/// represents the type of navbar animation
enum QuickNavBarType { animate, static, auto }

/// the navbar items
class QuickNavBarItem {
  String? label;
  IconData icon;
  IconData? selectedIcon;
  Widget widget;
  Function? onPressed;

  QuickNavBarItem({
    required this.label,
    required this.icon,
    this.selectedIcon,
    required this.widget,
    this.onPressed,
  });
}
