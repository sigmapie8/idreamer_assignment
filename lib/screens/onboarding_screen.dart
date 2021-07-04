import 'package:flutter/material.dart';
import 'dart:math';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:hexcolor/hexcolor.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingScreenBuildData> pages = [
    OnboardingScreenBuildData(
      colorParm: Colors.white,
      heading: 'Ninja!',
      subHeading: 'Explore like a',
      text:
          'Take your career to next level with personalized career info based on your interests, skill & personality.',
      imageLocation: 'assets/images/Illustration.png',
      iconLocation: 'assets/images/image 28.png',
    ),
    OnboardingScreenBuildData(
      colorParm: HexColor('#58ABF9'),
      heading: 'Pro!',
      subHeading: 'Choose like a',
      text:
          'No matter what aspect of college life you are looking for, we provide listings and rankings based on your preferences.',
      imageLocation: 'assets/images/Group 840.png',
      iconLocation: 'assets/images/image 32.png',
    ),
    OnboardingScreenBuildData(
      colorParm: Colors.white,
      heading: 'Real World!',
      subHeading: 'Prepare for the',
      text:
          "We'll show you exactly what to do to make your dream job a reality",
      imageLocation: 'assets/images/Group 838.png',
      iconLocation: 'assets/images/image 30.png',
    ),
    OnboardingScreenBuildData(
      colorParm: HexColor('#58ABF9'),
      heading: 'Help?',
      subHeading: 'How can we',
      text:
          "Get ready for your transition from school to college and finally to a perfect career with us!",
      imageLocation: 'assets/images/Group 845.png',
      iconLocation: 'assets/images/image 34.png',
    ),
  ];
  LiquidController? liquidController;
  int page = 0;

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }

  Widget buildOnboardingPage({
    required BuildContext context,
    required Color colorParm,
    required String heading,
    required String subHeading,
    required String text,
    required String imageLocation,
    required String iconLocation,
    required bool lastPage,
  }) {
    return Stack(
      children: <Widget>[
        //******************************************************* Page BluePrint
        Container(
          color: colorParm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 16),
                width: MediaQuery.of(context).size.width - 32,
                child: Image.asset(
                  imageLocation,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 0.1 * MediaQuery.of(context).size.height,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 2),
                child: Text(
                  subHeading,
                  style: TextStyle(
                    color: (colorParm == Colors.white)
                        ? Colors.blueAccent
                        : Colors.white,
                    fontSize: 19,
                    fontFamily: 'Asap-Bold',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 2, 2, 10),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: HexColor('#193853'),
                        fontSize: 50,
                        fontFamily: 'Asap-Bold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2, 2, 0, 10),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Image.asset(iconLocation),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 10, 0, 10),
                width: 229,
                child: Text(
                  text,
                  style: TextStyle(
                    color: (colorParm == Colors.white)
                        ? HexColor('#A9A9A9')
                        : Colors.white,
                    fontSize: 15,
                    fontFamily: 'Roboto-Regular',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        //**************************************************** Navigational Dots
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List<Widget>.generate(
                  pages.length,
                  (index) {
                    double selectedness = Curves.easeOut.transform(
                      max(
                        0.0,
                        1.0 - ((page) - index).abs(),
                      ),
                    );
                    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
                    return Container(
                      width: 25.0,
                      child: Center(
                        child: Material(
                          color: (colorParm == Colors.white)
                              ? HexColor('#64B3FD').withOpacity(0.5)
                              : Colors.white.withOpacity(0.67),
                          type: MaterialType.circle,
                          child: Container(
                            width: 8.0 * zoom,
                            height: 8.0 * zoom,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        //********************************************************** Skip Button
        if (!lastPage)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: (colorParm == Colors.white)
                        ? Colors.black.withOpacity(.48)
                        : Colors.white.withOpacity(.78),
                  ),
                ),
              ),
            ),
          ),
        //********************************************************** Next Button
        if (lastPage)
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white.withOpacity(.78))),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.78),
                    ),
                  ),
                ),
              )),
      ],
    );
  }

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe.builder(
            itemBuilder: (context, index) {
              return buildOnboardingPage(
                context: context,
                colorParm: pages[index].colorParm,
                heading: pages[index].heading,
                subHeading: pages[index].subHeading,
                text: pages[index].text,
                imageLocation: pages[index].imageLocation,
                iconLocation: pages[index].iconLocation,
                lastPage: (index == pages.length - 1) ? true : false,
              );
            },
            itemCount: pages.length,
            positionSlideIcon: 0.75,
            slideIconWidget: Image.asset(
              'assets/images/circle.png',
              height: 33,
              width: 33,
              color: HexColor('#193853'),
            ),
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
            ignoreUserGestureWhileAnimating: true,
            onPageChangeCallback: pageChangeCallback,
            enableLoop: true,
            enableSideReveal: true,
          ),
        ],
      ),
    ));
  }
}

// Details required to generate a page
class OnboardingScreenBuildData {
  final Color colorParm;
  final String heading;
  final String subHeading;
  final String text;
  final String imageLocation;
  final String iconLocation;

  OnboardingScreenBuildData(
      {required this.colorParm,
      required this.heading,
      required this.subHeading,
      required this.text,
      required this.iconLocation,
      required this.imageLocation});
}
