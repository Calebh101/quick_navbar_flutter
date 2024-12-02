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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QuickNavBar(items: [
        {
          "label": "Home",
          "icon": Icons.home_outlined,
          "selectedIcon": Icons.home,
          "widget": HomePage(),
        },
        {
          "label": "Search",
          "icon": Icons.search,
          "widget": SearchPage(),
        },
        {
          "label": "Settings",
          "icon": Icons.settings_outlined,
          "selectedIcon": Icons.settings,
          "widget": SettingsPage(),
        },
      ], showLabels: true, type: QuickNavBarType.static),
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
