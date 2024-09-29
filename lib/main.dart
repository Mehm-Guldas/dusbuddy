import 'package:flutter/material.dart';
import 'Pages/CalendarPage.dart';
import 'Pages/ProgressPage.dart';
import 'Pages/SavedResultsPage.dart';
import 'Pages/examinfo.dart';
import 'Pages/settings.dart';
import 'Pages/about.dart';
import 'Pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _toggleTheme(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black12,

        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode, // Tema modu burada kontrol ediliyor
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/about': (context) => About(),
        '/settings': (context) => Settings(toggleTheme: _toggleTheme), // toggleTheme fonksiyonu gönderildi
        '/examinfo': (context) => Examinfo(),
        '/resultspage': (context) => SavedResultsPage(),
        '/progresspage': (context) => ProgressPage(),
        '/calendarpage': (context) => CalendarPage(),
      },
    );
  }
}
