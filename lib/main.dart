
import 'package:cricket_scorer_app/screens/history_screen.dart';
import 'package:cricket_scorer_app/screens/teams_screen.dart';
import 'package:cricket_scorer_app/screens/notification_screen.dart';
import 'package:cricket_scorer_app/screens/start_match.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/advance_settings.dart';
void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cricket Scorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) =>  MatchSetupScreen(),
        '/settings': (context) =>  SettingScreen(),
        '/notification': (context) =>  NotificationScreen(),
        '/startMatch': (context) => startMatchScreen(),
        '/TeamsScreen': (context) => TeamsScreen(),
        '/historyScreen': (context) => HistoryScreen(),



      },
    );
  }
}
