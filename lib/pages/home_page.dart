import 'package:flutter/material.dart';
import 'package:quickly_packed_app/pages/order_screen.dart';
import 'package:quickly_packed_app/pages/profile_screen.dart';
import 'package:quickly_packed_app/styles/colors.dart';

import '../constants/constants.dart';
import '../styles/theme.dart';


class HomePage extends StatefulWidget {
  static const routeName =  'home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOnline = false;
  num currentIndex = 1;

  Widget getScreens() {
    if (currentIndex == 1) {
      return const OrderScreen();
    } else if (currentIndex == 2) {
      return const ProfileScreen();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: getScreens(),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.only(left: 12, right: 12),
        decoration: const BoxDecoration(
          color: ThemeColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            getBottomWidget(
              1,
              "Task",
              ConstantImages.lightTaskIcon,
              ConstantImages.darkTaskIcon,
            ),

            getBottomWidget(
              2,
              "Profile",
              ConstantImages.lightProfileIcon,
              ConstantImages.darkProfileIcon,
            ),
          ],
        ),
      ),
    );
  }

  Widget getBottomWidget(
      num index, String title, String unselectedIcon, String selectedIcon) {
    return InkWell(
      highlightColor: ThemeColors.whiteColor,
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 18,
            width: 18,
            child: Image.asset(
              currentIndex == index ? selectedIcon : unselectedIcon,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyles.semiBold17((currentIndex == index)
                ? ThemeColors.primaryColor
                : ThemeColors.lightColor),
          ),
        ],
      ),
    );
  }
}
