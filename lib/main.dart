import 'package:flutter/material.dart';
import 'package:rusalangit_gis/screens/login_screen.dart';
import 'package:rusalangit_gis/screens/home_screen.dart';
import 'package:rusalangit_gis/screens/location_screen.dart';
import 'package:rusalangit_gis/screens/profile_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RusalangitGIS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        "/login": (context) => const LoginScreen(),
        "/home": (context) => const HomeScreen(),
        "/location": (context) => const LocationScreen(),
        "/profile": (context) => const ProfileScreen(),

      },
    );
  }
}


