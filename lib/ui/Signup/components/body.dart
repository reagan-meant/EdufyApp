import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/ui/Level/level_screen.dart';
import 'package:edufy/ui/Login/login_screen.dart';
import 'package:edufy/ui/Signup/components/background.dart';
import 'package:edufy/ui/Signup/components/or_divider.dart';
import 'package:edufy/ui/Signup/components/social_icon.dart';
import 'package:edufy/ui/components/Loading_dialog.dart';
import 'package:edufy/ui/components/already_have_an_account_acheck.dart';
import 'package:edufy/ui/components/rounded_button.dart';
import 'package:edufy/ui/components/rounded_input_field.dart';
import 'package:edufy/ui/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moor/moor.dart' as moor;
import 'package:http/http.dart' as http;

class Body extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String firstname;
  String lastname;
  String middlename;
  String username;
  int clas;

  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/student.svg",
              height: size.height * 0.35,
            ),
            Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  RoundedInputField(
                    icon: Icons.person,
                    hintText: "Your First name",
                    onChanged: (value) {
                      this.firstname = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your First name';
                      }
                      return null;
                    },
                  ),
                  RoundedInputField(
                    icon: Icons.person,
                    hintText: "Your Last name",
                    onChanged: (value) {
                      this.lastname = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your Last name';
                      }
                      return null;
                    },
                  ),
                  RoundedInputField(
                    icon: Icons.person,
                    hintText: "Your Middle name",
                    onChanged: (value) {
                      this.middlename = value;
                    },
                  ),
                  RoundedInputField(
                    icon: Icons.person,
                    hintText: "Your User name",
                    onChanged: (value) {
                      this.username = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your user name';
                      }
                      return null;
                    },
                  ),
                  RoundedInputField(
                    icon: Icons.ac_unit,
                    hintText: "Your Class",
                    onChanged: (value) {
                      this.clas = int.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your class';
                      }
                      return null;
                    },
                  ),
                  RoundedInputField(
                    icon: Icons.email,
                    hintText: "Your email address",
                    onChanged: (value) {
                      this.email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {
                      this.password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  RoundedButton(
                    text: "SIGN UP",
                    press: () async {
                      if (_formKey.currentState.validate()) {
                        LoadingDialog.show(context);

                        final student = new StudentsCompanion(
                            student_fname: moor.Value(firstname),
                            student_lname: moor.Value(lastname),
                            student_mname: moor.Value(middlename),
                            student_email: moor.Value(email),
                            student_username: moor.Value(username),
                            student_password: moor.Value(password),
                            class_id: moor.Value(clas));

                        Dio dio = new Dio();

                        //response = await dio.get("http://10.0.2.2/officialedufy/app/test.php");
                        FormData formData = new FormData.fromMap({
                          "student_fname": firstname,
                          "student_lname": lastname,
                          "student_mname": middlename,
                          "student_email": email,
                          "student_username": username,
                          "student_password": password,
                          "class_id": clas
                        });

                        Response response = await dio.get(
                          "http://10.0.2.2/officialedufy/app/flutter_utils/checkusername.php",
                          queryParameters: {
                            "username": username,
                            "password": password
                          },
                          /*  options: Options(
                            responseType: ResponseType.plain,
                          ), */
                        );

                        String A = response.data['present'] as String;

                        if ((A.compareTo("true")) == 0) {
                          LoadingDialog.hide(context);

                          final snackBar = SnackBar(
                              content: Text(
                                  'Username taken or try signing in if you already have an account'));

                          Scaffold.of(context).showSnackBar(snackBar);
                        } else if (A == 'userpresent') {
                          LoadingDialog.hide(context);

                          final snackBar = SnackBar(
                              content: Text(
                                  'Username taken or try signing in if you already have an account'));

                          Scaffold.of(context).showSnackBar(snackBar);
                        } else {
                          // AppDatabase().studentDao.insertStudent(student);
                          LoadingDialog.hide(context);

                          dio.post(
                            "http://10.0.2.2/officialedufy/app/flutter_utils/database.php",
                            data: formData,
                            options: Options(
                                //followRedirects: false,
                                validateStatus: (status) {
                              return status < 500;
                            }),
                          ).then((value) {
                            //response = value;
                            //print(response.data);
                          });

                          AppDatabase(username + ".sqlite")
                              .studentDao
                              .insertStudent(student);

                          Map data = {"db": username + ".sqlite"};
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => LevelScreen(),
                            settings: RouteSettings(
                              arguments: data,
                            ),
                          ));
                        }
                      }
                    },
                  ),
                  // Add TextFormFields and RaisedButton here.
                ])),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
