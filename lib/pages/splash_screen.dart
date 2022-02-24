import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quickly_packed_app/styles/colors.dart';

import '../constants/constants.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName =  'Splash-screen';

  const SplashScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashScreen());
  }


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), onTimerFinished);
    super.initState();

  }

  void onTimerFinished() {
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.4,),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ConstantImages.splashIcon),
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      ),
                    ),
                    // child: Image.asset(
                    //   ConstantImages.splashIcon,
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
