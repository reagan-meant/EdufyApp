import 'package:edufy/ui/Login/login_screen.dart';
import 'package:edufy/ui/Question/components/body.dart';
import 'package:edufy/ui/components/logOut.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Body(),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.filter_vintage),
              onTap: () {},
              title: Text("Upgrade to Premium"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.filter_vintage),
              onTap: () {
                final snackBar = SnackBar(content: Text('User logged Out'));

                // Scaffold.of(context).showSnackBar(snackBar);
                _scaffoldKey.currentState.showSnackBar(snackBar);
                LogOut logOut = LogOut();
                logOut.clearLoginCredentialToSharedPref();
                Navigator.pop(
                    _scaffoldKey.currentState.context); // Then close the drawer

               /*  Navigator.push(
                  _scaffoldKey.currentState.context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                ); */
              },
              title: Text("Log Out"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
