import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with TickerProviderStateMixin {
  TextEditingController? textEditingController;
  late final AnimationController animationController;
  bool animate = false;
  String? error;

  /*
  Future<void> loginWithPhoneNumber(String phoneNumber) {
    if (phoneNumber.isNotEmpty && RegExp(r"[0-9]{10}").hasMatch(phoneNumber)) {}
    return null;
  }*/

  String? phoneValidtor(String? value) {
    if (value!.isEmpty) {
      return "This field can't be empty";
    } else if (!RegExp(r"[0-9]{10}").hasMatch(value)) {
      return "Please enter a valid number";
    }

    return null;
  }

  @override
  void initState() {
    textEditingController = TextEditingController();
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController?.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(56, 100, 56, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Enter your',
                  style: TextStyle(
                    fontFamily: 'Asap-Medium',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent,
                  ),
                ),
                Text(
                  'Mobile number',
                  style: TextStyle(
                    color: HexColor('#4A4A4A'),
                    fontFamily: 'Asap-Medium',
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'we will send you a One Time Password (OTP)',
                  style: TextStyle(
                    color: HexColor('#A3A4A6'),
                    fontFamily: 'Asap-Medium',
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '+91 ',
                      style: TextStyle(
                        color: HexColor('##A4A4A4'),
                        fontFamily: 'Asap-Medium',
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: textEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Enter here',
                          hintStyle: TextStyle(
                            color: HexColor('#C2C3C3'),
                            fontFamily: 'Asap-Medium',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          errorStyle: TextStyle(
                            color: HexColor('#F65B2A'),
                            fontFamily: 'Asap-Medium',
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: TextStyle(
                          color: HexColor('##A4A4A4'),
                          fontFamily: 'Asap-Medium',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        validator: phoneValidtor,
                        autocorrect: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),
                if (animate)
                  Center(
                    child: Container(
                      height: 50,
                      width: 100,
                      child: Lottie.asset('assets/lottie.json',
                          controller: animationController,
                          onLoaded: (composition) {
                        animationController
                          ..duration = composition.duration
                          ..repeat();
                      }),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        String phoneNumber =
                            textEditingController?.text as String;
                        if (phoneNumber.isNotEmpty &&
                            RegExp(r"[0-9]{10}").hasMatch(phoneNumber)) {
                          setState(() {
                            animate = true;
                          });
                          Future.delayed(Duration(seconds: 3)).then((value) => {
                                Navigator.pushNamed(context, '/otp',
                                    arguments: '$phoneNumber')
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Container(
                      height: 300,
                      child: Image.asset('assets/images/Group 841.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        /*
        AnimatedPositioned(
          bottom: -(MediaQuery.of(context).size.height * 0.2),
          child: LoginOptions(),
          duration: Duration(milliseconds: 200),
        ),*/
      ],
    )));
  }
}
