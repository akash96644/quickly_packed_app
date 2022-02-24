import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:quickly_packed_app/constants/constants.dart';
import 'package:quickly_packed_app/styles/colors.dart';


class TopBarWidget extends StatefulWidget {
  bool isOnline;

  // static Route route() {
  //   return MaterialPageRoute<void>(builder: (_) => const TopBarWidget());
  // }

   TopBarWidget({ required this.isOnline, Key? key}) : super(key: key);

  @override
  _TopBarWidgetState createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {


  @override
  Widget build(BuildContext context) {
    return getTopBar();
  }

  Widget getTopBar() {
    return Container(
      color: ThemeColors.backgroundColor,
      child: Padding(
        padding:
        const EdgeInsets.only(left: 12, top: 30, right: 12, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 35,
                    child: Image.asset(
                      ConstantImages.logo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FlutterSwitch(
                    width: 80.0,
                    height: 35.0,
                    toggleSize: 25.0,
                    value: widget.isOnline,
                    borderRadius: 25.0,
                    padding: 0.5,
                    toggleColor: ThemeColors.primaryColor,
                    switchBorder: Border.all(
                      color: ThemeColors.primaryColor,
                      width: 6.0,
                    ),
                    toggleBorder: Border.all(
                      color: widget.isOnline
                          ? ThemeColors.orderStstusColor
                          : ThemeColors.whiteColor,
                      width: 5.0,
                    ),
                    activeColor: ThemeColors.primaryColor,
                    inactiveColor: ThemeColors.primaryColor,
                    activeText: "Online",
                    activeTextColor: ThemeColors.whiteColor,
                    inactiveText: "Offline",
                    inactiveTextColor: ThemeColors.whiteColor,
                    valueFontSize: 10,
                    showOnOff: true,
                    onToggle: (val) {

                      setState(() {
                         widget.isOnline = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
