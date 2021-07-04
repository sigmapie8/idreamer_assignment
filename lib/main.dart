import 'package:flutter/material.dart';
import 'package:manav_flutter_assignment/custom_router.dart';
import 'package:manav_flutter_assignment/screens/splash_screen.dart';

void main() {
  runApp(AssignmentApp());
}

class AssignmentApp extends StatefulWidget {
  AssignmentApp({Key? key}) : super(key: key);

  @override
  _AssignmentAppState createState() => _AssignmentAppState();
}

class _AssignmentAppState extends State<AssignmentApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Assignment App",
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: "/splash",
        onGenerateRoute: (settings) => CustomRouter.generateRoute(settings));
  }
}
