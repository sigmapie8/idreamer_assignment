import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({Key? key}) : super(key: key);

  @override
  _LoginOptionsState createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  Icon _icon = Icon(
    Icons.arrow_drop_down_outlined,
    color: HexColor('#A3A4A6'),
  );
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        color: Colors.grey.shade700,
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  if (_open) {
                    _icon = Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: HexColor('#A3A4A6'),
                    );
                    _open = false;
                  } else {
                    _icon = Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: HexColor('#A3A4A6'),
                    );
                    _open = true;
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'more login options',
                    style: TextStyle(
                      color: HexColor('#A3A4A6'),
                      fontFamily: 'Asap-Medium',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  _icon,
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                tileColor: Colors.grey.shade100,
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/icons/google.png'),
                  backgroundColor: Colors.white,
                ),
                title: Text('SIGN IN USING GOOGLE'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                tileColor: Colors.grey.shade100,
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/icons/facebook.png'),
                  backgroundColor: Colors.white,
                ),
                title: Text('SIGN IN USING FACEBOOK'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
