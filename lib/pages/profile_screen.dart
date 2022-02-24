import 'package:flutter/material.dart';
import 'package:quickly_packed_app/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName =  'profile-screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return  Container(
        height: mediaQuery.height,
        width: mediaQuery.width,
        color: ThemeColors.backgroundColor,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: Container(
                  width: mediaQuery.width,

              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: ThemeColors.whiteColor

              ),
              child: const Text('Profile', style: TextStyle(color: ThemeColors.backgroundColor, fontWeight: FontWeight.bold, fontSize: 16,),),
            ),),
            Positioned(
                top: mediaQuery.height * 0.2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.1, vertical: mediaQuery.height * 0.1),
                  decoration: const BoxDecoration(
                    color: ThemeColors.whiteColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),)
                  ),
              width: mediaQuery.width,
                  height: mediaQuery.height * 0.8,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleContainer('Full Name'),
                      const SizedBox(height: 10,),
                      fieldContainer('Ankit Mishra'),
                      const SizedBox(height: 15,),
                      titleContainer('Phone Number'),
                      const SizedBox(height: 10,),
                      fieldContainer('99900924738'),
                      const SizedBox(height: 15,),
                      titleContainer('Email Id'),
                      const SizedBox(height: 10,),
                      fieldContainer('ankit@gmail.com'),

                    ],
                  ),
            ))
          ],
        ),

    );
  }
  Widget titleContainer(String title){
    return Text(title, style: const TextStyle(color: ThemeColors.termColor, fontWeight: FontWeight.bold, fontSize: 12,),);
  }

  Widget fieldContainer(String field){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: ThemeColors.bordercolor)

      ),
child: Text(field, style: const TextStyle(color: ThemeColors.termColor, fontWeight: FontWeight.bold, fontSize: 12,),)    ,
    );
  }

}
