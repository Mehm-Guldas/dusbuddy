import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  final Function(bool) toggleTheme;

  const Settings({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference(); // Uygulama açıldığında tema tercihini yükle
  }

  // Kullanıcının tema tercihini SharedPreferences'tan yükle
  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false; // Varsayılan açık mod
    });
  }

  // Tema tercihini kaydet
  Future<void> _saveThemePreference(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
      ),


      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 10),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Koyu Mod:'),
                const SizedBox(width: 10), // Mod durumu
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                      widget.toggleTheme(value); // Tema değişikliği çağrısı
                      _saveThemePreference(value); // Tercihi kaydet
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
