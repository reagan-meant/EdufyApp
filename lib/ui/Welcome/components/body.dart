import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edufy/constants.dart';
import 'package:edufy/ui/Login/login_screen.dart';
import 'package:edufy/ui/Signup/signup_screen.dart';
import 'package:edufy/ui/Welcome/components/background.dart';
import 'package:edufy/ui/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "EDUFY",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/student.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                Response response;
                Dio dio = new Dio();/* 

                response = await dio.get(
                    "http://10.0.2.2/officialedufy/app/flutter_utils/test.php");
                String store = (await getApplicationDocumentsDirectory()).path; */
                //var file = File(store + '/estafi.sqlite');
                // file.writeAsBytesSync(response.data);
                //file.writeAsString(response.data);
                //print(response.data.toString());
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
