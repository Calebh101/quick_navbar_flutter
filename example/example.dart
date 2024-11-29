import 'package:flutter/material.dart';
import 'package:quick_navbar/quick_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QuickNavBar(items: [
        {
          "label": "Home", // optional
          "icon": Icons.home_outlined, // required
          "selectedIcon": Icons.home, // optional
          "widget": HomePage(), // required
        },
        {
          "label": "Search", // optional
          "icon": Icons.search_outlined, // required
          "selectedIcon": Icons.search, // optional
          "widget": SettingsPage(), // required
        },
        {
          "label": "Settings", // optional
          "icon": Icons.settings_outlined, // required
          "selectedIcon": Icons.settings, // optional
          "widget": SettingsPage(), // required
        },
      ], showLabels: false, type: QuickNavBarType.animate, hoverEffect: false),
      // items - required - a list of items containing at least an icon and a widget, and optional label and selectedIcon
      // showLabels - required - shows or hides the labels (setting the labels to blank or removing them altogether leaves space, so this will hide them and remove the extra space) - default is true
      /* type - optional - default is auto
        the type determines what style the navbar will use
        type can be set to these three things:
          - QuickNavBarType.animate - all the Material Design things enabled
          - QuickNavBarType.static - all the Material Design things disabled, making it like an iOS tab style
          - QuickNavBarType.auto: will use static if the platform is on an Apple device, otherwise use animate
      */
      // hoverEffect - optional - set to true if you want a small circle to show up when hovered on (and/or pressed), false if not - default is false
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Text("Home page");
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Text("Search page");
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Text("Settings page");
  }
}
