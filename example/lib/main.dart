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
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: QuickNavBar(items: [
        {
          "label": "Home",
          "icon": Icons.home_outlined,
          "selectedIcon": Icons.home,
          "widget": const HomePage(),
          "onPressed": () {
            debugPrint("Page 1");
          }
        },
        {
          "label": "Search",
          "icon": Icons.search,
          "widget": const SearchPage(),
          "onPressed": () {
            debugPrint("Page 2");
          }
        },
        {
          "label": "Settings",
          "icon": Icons.settings_outlined,
          "selectedIcon": Icons.settings,
          "widget": const SettingsPage(),
          "onPressed": () {
            debugPrint("Page 3");
          }
        },
      ], selectedColor: Colors.blue, sidebarBeta: true),
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
    return const Text("Home page");
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
    return const Text("Search page");
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
    return const Text("Settings page");
  }
}
