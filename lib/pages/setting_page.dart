
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingController extends ChangeNotifier {
  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<SettingController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text("Dark Mode"),
            trailing: Switch(
              value: setting.isDark,
              onChanged: (value) {
                setting.toggleTheme();
              },
            ),
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("Tentang Aplikasi"),
            subtitle: const Text("Versi 1.0"),
          ),
        ],
      ),
    );
  }
}
