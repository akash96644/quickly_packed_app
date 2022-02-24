import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickly_packed_app/pages/home_page.dart';
import 'package:quickly_packed_app/styles/colors.dart';
import 'package:quickly_packed_app/constants/constants.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../styles/login_style.dart';
import '../styles/strings.dart';

class LoginScreen extends StatefulWidget {
  static const routeName =  'login-page';

  const LoginScreen({Key? key}) : super(key: key);


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController mobileNumber = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  static const double containerHeight = 300.0;
  double clipHeight = containerHeight * 0.35;
  TermCheck _termCheck = TermCheck.uncheck;
  bool isOTPWidget = false;
  String currentCode = "";
  bool termAndConError = false;
  int timeCounter = 0;
  bool timeUpFlag = false;

  Widget buildLoginForm() {
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                // alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: MediaQuery.of(context).size.height * 0.1,),
                child: SvgPicture.asset(

                  ConstantImages.storeLogo,
                  fit: BoxFit.contain,
                ),
              ),
              // Image.asset(
              //   ConstantImages.loginIcon,
              //   fit: BoxFit.cover,
              // ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
                height: MediaQuery.of(context).size.height * 0.38,
                decoration: const BoxDecoration(
                  color: ThemeColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: (isOTPWidget) ? otpWidgets() : loginWidgets(),
              ),
            ),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return buildLoginForm();
  }

  Widget otpWidgets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 0),
          child: Row(
            children: [
              InkWell(
                child: const Icon(
                  Icons.keyboard_arrow_left,
                  color: ThemeColors.buttonColor,
                ),
                onTap: () {
                  setState(() {
                    isOTPWidget = false;
                    currentCode = "";
                  });
                },
              ),
              Text(
                Strings.otp_sent,
                style: LoginTextStyles.enterMobileText(),
              ),
            ],
          ),
        ),
        getOtpFields(),
        const SizedBox(
          height: 2,
        ),

          getButton(context),

      ],
    );
  }


  Widget loginWidgets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 0),
          child: Text(
            Strings.enter_your_mobile_number,
            style: LoginTextStyles.enterMobileText(),
          ),
        ),
        mobileNumberField(),
        // if (loginBloc.state.isBusy == true) ...[
        //   const SizedBox(
        //     height: 5,
        //   ),
        //   Helpers.loadingWidget(),
        // ] else
          getButton(context),
        const SizedBox(
          height: 5,
        ),
        termAndCondition(),
        if (termAndConError)
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "Please accept the term and condition",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          )
      ],
    );
  }




  Widget mobileNumberField() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: mobileNumber,
          keyboardType: TextInputType.number,
          style: LoginTextStyles.mobileNumberText(),
          validator: (value){
            if(value == null || value.isEmpty){
              return 'Mobile Number InValid';
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: ThemeColors.mobileTextField,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: ThemeColors.mobileTextField,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: ThemeColors.mobileTextField,
                )),
            filled: true,
            fillColor: ThemeColors.mobileTextField,
            contentPadding: const EdgeInsets.only(left: 5),
            hintText: "+91 7600243539",
            hintStyle: LoginTextStyles.mobileNumberHintText(),
            prefixIcon: mobileCode(),

            counterText: "Invalid mobile number",
            // errorText: _emailErrorText(loginBloc.state.mobileNumberError),
          ),
          cursorColor: Colors.black.withOpacity(0.5),
          maxLength: 10,
        ),
      ),
    );
  }

  Widget getButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
      child: SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0.0,
            primary: ThemeColors.buttonColor,
            textStyle: const TextStyle(
              color: Colors.white,),
            visualDensity: VisualDensity.compact,

            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          ),
          child: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Center(
                child: Text(
                  (isOTPWidget) ? Strings.continueText : Strings.get_otp,
                  textAlign: TextAlign.center,
                  style: LoginTextStyles.mobileNumberHintText(
                      color: ThemeColors.whiteColor),
                ),
              ),
            ],
          ),
          onPressed: () {

            if(_formKey.currentState == null && _formKey.currentState!.validate()){
              null;
            }else{
              setState(() {
                isOTPWidget = true;
              });
            }
            if(isOTPWidget == true){
              Navigator.of(context).pushReplacementNamed(HomePage.routeName);
            }


          },
        ),
      ),
    );
  }




  Widget mobileCode() {
    return Container(
      width: 40,
      margin: const EdgeInsets.only(right: 10),
      child: const Center(
        child: Icon(
          Icons.phone,
          color: ThemeColors.hintColor,
        ),
      ),
    );
  }

  Widget termAndCondition() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Radio(
            toggleable: true,
            activeColor: ThemeColors.buttonColor,
            focusColor: ThemeColors.buttonColor.withOpacity(0.5),
            hoverColor: ThemeColors.buttonColor.withOpacity(0.5),
            value: TermCheck.check,
            groupValue: _termCheck,
            onChanged: (TermCheck? value) {
              if (value != null) {
                if (_termCheck == TermCheck.check) {
                  setState(() {
                    _termCheck = TermCheck.uncheck;
                  });
                } else {
                  setState(() {
                    _termCheck = TermCheck.check;
                  });
                }
              }
            },
          ),
          RichText(
            text: TextSpan(
              text: Strings.I_accept_the,
              style: LoginTextStyles.termText(ThemeColors.termColor),
              children: [
                TextSpan(
                  text: " " + Strings.Term_and_Conditions,
                  style: LoginTextStyles.termText(ThemeColors.buttonColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget getOtpFields() {
    return Padding(
      padding: const EdgeInsets.only(left: 44, right: 44, top: 12),
      child: PinFieldAutoFill(
        textInputAction: TextInputAction.done,
        enableInteractiveSelection: true,
        controller: otpController,
        decoration: BoxLooseDecoration(
          hintTextStyle:
          LoginTextStyles.otpText(ThemeColors.termColor.withOpacity(0.5)),
          strokeColorBuilder:
          const FixedColorBuilder(ThemeColors.mobileTextField),
          bgColorBuilder: const FixedColorBuilder(ThemeColors.mobileTextField),
          textStyle: LoginTextStyles.otpText(ThemeColors.termColor),
          hintText: "----",
        ),
        onCodeSubmitted: (code) {},
        currentCode: currentCode,
        codeLength: 4,
        onCodeChanged: (String? code) {
          if (code != null) {
            setState(() {
              currentCode = code;
            });
          }
          if (code!.length == 4) {
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        keyboardType: TextInputType.number,
        cursor: Cursor(
          width: 2,
          color: ThemeColors.termColor,
          radius: const Radius.circular(1),
          enabled: true,
        ),
      ),
    );
  }




}

enum TermCheck { check, uncheck }

// enum FieldError { Empty, Invalid }
