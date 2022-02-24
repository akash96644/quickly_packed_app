import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:quickly_packed_app/styles/colors.dart';
import '../widgets/top_bar_widgets.dart';

class OrderScreen extends StatefulWidget {

  static const routeName =  'order-page';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  bool isOnline = false;
  bool showPickOrder = false;
  final int _duration = 30;
  final CountDownController _controller = CountDownController();


  Widget orderItem(BuildContext context){

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => InkWell(
        onTap: (){},
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)
          ),
          color: ThemeColors.backgroundColor,
          child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),          child: Row(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,


                  children: const [
  Text('Order Id', style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold, color: ThemeColors.whiteColor),),
   SizedBox(height: 40,),
   Text('10 : 20 Am', style: TextStyle( fontSize: 17, color: ThemeColors.darkGrey),)

],
                ),

                const Text('#5554552', style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold, color: ThemeColors.whiteColor),),

                CircularCountDownTimer(
                  // Countdown duration in Seconds.
                  duration: _duration,

                  // Countdown initial elapsed Duration in Seconds.
                  initialDuration: 0,

                  // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                  controller: _controller,

                  // Width of the Countdown Widget.
                  width: 90,

                  // Height of the Countdown Widget.
                  height: 90,

                  // Ring Color for Countdown Widget.
                  ringColor: ThemeColors.timerRingColor,

                  // Ring Gradient for Countdown Widget.
                  ringGradient: null,

                  // Filling Color for Countdown Widget.
                  fillColor: ThemeColors.primaryColor,

                  // Filling Gradient for Countdown Widget.
                  fillGradient: null,

                  // Background Color for Countdown Widget.
                  backgroundColor: ThemeColors.backgroundColor,

                  // Background Gradient for Countdown Widget.
                  backgroundGradient: null,

                  // Border Thickness of the Countdown Ring.
                  strokeWidth: 4.0,

                  // Begin and end contours with a flat edge and no extension.
                  strokeCap: StrokeCap.round,

                  // Text Style for Countdown Text.
                  textStyle: const TextStyle(
                      fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),

                  // Format for the Countdown Text.
                  textFormat: CountdownTextFormat.S,

                  // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                  isReverse: true,

                  // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                  isReverseAnimation: false,

                  // Handles visibility of the Countdown Text.
                  isTimerTextShown: true,

                  // Handles the timer start.
                  autoStart: true,

                  // This Callback will execute when the Countdown Starts.
                  onStart: () {
                    // Here, do whatever you want
                    print('Countdown Started');
                  },

                  // This Callback will execute when the Countdown Ends.
                  onComplete: () {
                    // Here, do whatever you want
                    print('Countdown Ended');
                  },
                )


              ],
            ),
          ),),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        // DraggableBottomSheet(
        //   blurBackground: false,
        //   backgroundWidget:
        //   Container(
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     color: ThemeColors.whiteColor,
        //
        //     child:
            Column(
              children:  [
                TopBarWidget(isOnline: isOnline,),


                isOnline == true ?
                  const Expanded(
                    child: Center(
                      child: Text(
                        'We Will Assigned order shortly', style: TextStyle(color: ThemeColors.backgroundColor, fontSize: 15, fontWeight: FontWeight.bold,),


                      ),
                    ),
                  )
                    : Expanded(child: orderItem(context)),







              ],
            ),
          // ),

    );


  }












}
