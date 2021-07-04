import 'package:flutter/material.dart';
import 'package:manav_flutter_assignment/screens/onboarding_screen.dart';
import 'package:manav_flutter_assignment/screens/otp_screen.dart';
import 'package:manav_flutter_assignment/screens/registration_Screen.dart';
import 'package:manav_flutter_assignment/screens/splash_screen.dart';
import 'package:manav_flutter_assignment/screens/unknown_screen.dart';

class CustomRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case '/otp':
        return MaterialPageRoute(
            builder: (_) => OTPScreen(
                  phoneNumber: settings.arguments as String,
                ));
      default:
        return MaterialPageRoute(builder: (_) => UnknownScreen());
    }
  }
}
