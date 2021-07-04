import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  Color borderColor = Colors.grey;
  String? otpMessage;
  bool? isDisabled;
  int? resendTime;

  //********************************************* Function managing resend timer
  void resendTimeManager() {
    resendTime = 30;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendTime == 0) {
        setState(() {
          isDisabled = false;
          timer.cancel();
        });
      } else {
        setState(() {
          resendTime = resendTime! - 1;
          isDisabled = true;
        });
      }
    });
  }

  @override
  void initState() {
    for (TextEditingController con in controllers) {
      con.clear();
    }
    otpMessage = "";
    isDisabled = false;
    resendTime = 30;
    super.initState();
  }

  @override
  void dispose() {
    for (TextEditingController con in controllers) {
      con.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //********************************************* Function for textform fields
    Flexible genrateOtpField(int index) {
      final node = FocusScope.of(context);

      return Flexible(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: TextFormField(
          controller: controllers[index],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: "",
            border: UnderlineInputBorder(
                borderSide: BorderSide(
              color: borderColor,
            )),
          ),
          textAlign: TextAlign.center,
          onChanged: (value) {
            if (value.length > 0 && index < 5) {
              node.nextFocus();
            }
          },
          maxLength: 1,
        ),
      ));
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                //**************************************************** Enter OTP
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 56),
                  child: Text(
                    'Enter OTP',
                    style: TextStyle(
                      color: HexColor('#4A4A4A'),
                      fontFamily: 'Asap-Medium',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                //******************* Please enter the verification code sent to
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 56, vertical: 1),
                  child: Text(
                      'Please enter the verification code sent to ${widget.phoneNumber}',
                      style: TextStyle(
                        color: HexColor('#999999'),
                        fontFamily: 'Asap-Medium',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                //*************************************************** OTP Fields
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 56, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(6, (index) => genrateOtpField(index)),
                  ),
                ),
                //************************************************** OTP Message
                if (otpMessage != "")
                  Center(
                    child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: (otpMessage == "OTP Correct")
                              ? Colors.greenAccent.withOpacity(0.11)
                              : Colors.redAccent.withOpacity(.11),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              '$otpMessage',
                              style: TextStyle(
                                color: (otpMessage == "OTP Correct")
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                                fontFamily: 'Asap-Medium',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),
                  ),
                //************************************************ Submit button
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        String otp = "";
                        for (TextEditingController con in controllers) {
                          otp += con.text;
                        }
                        print('*************** OTP: $otp');
                        if (otp == "858585") {
                          setState(() {
                            otpMessage = "OTP Correct";
                          });
                          await Future.delayed(Duration(seconds: 1)).then(
                              (value) => Navigator.pushNamed(context, '/feed'));
                        } else {
                          setState(() {
                            otpMessage = "OTP Incorrect";
                          });
                        }
                      },
                      child: Icon(Icons.arrow_forward_ios),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                ),
                //******************************************** OTP Resend button
                if (otpMessage != 'OTP Correct')
                  Center(
                    child: TextButton(
                      onPressed: (isDisabled!)
                          ? null
                          : () {
                              setState(() {
                                isDisabled = true;
                              });
                              resendTimeManager();
                            },
                      child: (isDisabled!)
                          ? Text('Resend OTP in 00:$resendTime')
                          : Text('Resend OTP'),
                    ),
                  ),
                //************************************************* Illustration
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.asset('assets/images/Fingerprint-bro 1.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
