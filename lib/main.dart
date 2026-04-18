import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_controller.dart';
import 'controllers/counter_controller.dart';

import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/counter_page.dart';
import 'pages/profile_page.dart';
import 'pages/setting_page.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => CounterController()),
        ChangeNotifierProvider(create: (_) => SettingController()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // ✅ TARUH DI SINI
    final setting = Provider.of<SettingController>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 🌙 DARK MODE
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: setting.isDark ? ThemeMode.dark : ThemeMode.light,

      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/counter': (context) => const CounterPage(),
        '/setting': (context) => const SettingPage(),
      },
    

      // dynamic route
      onGenerateRoute: (settings) {
        if (settings.name!.startsWith('/profile')) {
          final username = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => ProfilePage(username: username),
          );
        }
        return null;
      },
    );
  }
}
