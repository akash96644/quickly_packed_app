import 'package:flutter/material.dart';
import 'package:quickly_packed_app/pages/home_page.dart';
import 'package:quickly_packed_app/pages/login_screen.dart';
import 'package:quickly_packed_app/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        SplashScreen.routeName : (ctx) => const SplashScreen(),
        LoginScreen.routeName : (ctx) => const LoginScreen(),
        HomePage.routeName : (ctx) => const HomePage(),
      },
    );
  }
}

