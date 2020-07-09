import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:edufy/data/database_provider.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/ui/Level/level_screen.dart';
import 'package:edufy/ui/Signup/signup_screen.dart';
import 'package:edufy/ui/components/Loading_dialog.dart';
import 'package:edufy/ui/components/already_have_an_account_acheck.dart';
import 'package:edufy/ui/components/rounded_input_field.dart';
import 'package:edufy/ui/components/rounded_password_field.dart';
import 'package:edufy/ui/interceptor/dio_connectivity_request_retrier.dart';
import 'package:edufy/ui/interceptor/retry_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:edufy/ui/Welcome/components/background.dart';
import 'package:edufy/ui/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BodyState();
  }
}

class BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String password;
  bool showLoginForm;
  Dio dio;

  Future<List<String>> _getLoginCredentialFromSharedPref() async {
    final pref = await SharedPreferences.getInstance();
    final credentials = pref.getStringList('credentials') ?? [];
    if (credentials.isNotEmpty && credentials.length > 1) {
      List<Student> students = await AppDatabase(credentials[0] + ".sqlite")
          .studentDao
          .findStudentByUsernameAndPassword(credentials[0], credentials[1]);
      print("studs");
      print(students[0]);
      if (students.length > 0) {
        AppDatabase(credentials[0] + ".sqlite")
            .questionDao
            .getAllQuestions()
            .then((value) {
          print("response");
          //Hacky way to add username to the json payload
          List<Question> studentQuestions = [];

          studentQuestions.add(Question(
              question_id: 30,
              question_text: credentials[0],
              class_id: 1,
              tag: "nothing",
              term_id: 1,
              correct_option: 1,
              answer_id: 1,
              paper_number: 1,
              subject_id: 1,
              answered: 0,
              times_correct: 0,
              times_wrong: 1));
          studentQuestions.addAll(value);
          print(studentQuestions);
          print("encoded");
          print(jsonEncode(studentQuestions));
          //print(
          dio
              .post(
            "http://10.0.2.2/officialedufy/app/flutter_utils/updateDB.php",
            data: jsonEncode(studentQuestions),
          )
              .then((value) {
            //response = value;
            //print(value.data);
          });
          ;
        });

        Map data = {"db": credentials[0] + ".sqlite"};
        Navigator.of(this.context).push(MaterialPageRoute(
          builder: (_) => LevelScreen(),
          settings: RouteSettings(
            arguments: data,
          ),
        ));
      } else {
        setState(() {
          showLoginForm = true;
        });
      }
    } else {
      setState(() {
        showLoginForm = true;
      });
    }
  }

  @override
  Future<void> initState() {
    super.initState();
    showLoginForm = false;
    dio = Dio();

    dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: Dio(),
          connectivity: Connectivity(),
        ),
      ),
    );
    _getLoginCredentialFromSharedPref();
  }

  Future<void> _setLoginCredentialToSharedPref(
      String username, String password) async {
    final pref = await SharedPreferences.getInstance();

    //prefs.setStringList('my_string_list_key', ['horse', 'cow', 'sheep']);

    final credentials = pref.setStringList('credentials', [username, password]);
  }

  @override
  Widget build(BuildContext context) {
    //  LoadingDialog.hide(context);

    Size size = MediaQuery.of(context).size;
    if (showLoginForm) {
      return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/student.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    RoundedInputField(
                      hintText: "Your Username",
                      onChanged: (value) {
                        this.username = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter username';
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
                      text: "LOGIN",
                      press: () async {
                        if (_formKey.currentState.validate()) {
                          //await AppDatabase().studentDao.finduserByUsername(studentUsername);
                          LoadingDialog.show(context);

                          /*    getDatabasesPath().then((value){
                          var databasesPath = value;
                                                  var path = join(databasesPath, username + ".sqlite");
                        var exists = await databaseExists(path);

                        }); */
                          var databasesPath = await getDatabasesPath();
                          var path = join(databasesPath, username + ".sqlite");

// Check if the database exists
                          var exists = await databaseExists(path);

                          if (!exists) {
                            //AppDatabase(username + ".sqlite")
                            //make a check online
                            LoadingDialog.hide(context);
                            final snackBar =
                                SnackBar(content: Text('User does not exist'));

                            Scaffold.of(context).showSnackBar(snackBar);
                          } else {
                            List<Student> students =
                                await AppDatabase(username + ".sqlite")
                                    .studentDao
                                    .findStudentByUsernameAndPassword(
                                        username, password);
                            if (students.length > 0) {
                              LoadingDialog.hide(context);
                              _setLoginCredentialToSharedPref(
                                  username, password);
                              Map data = {"db": username + ".sqlite"};
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => LevelScreen(),
                                settings: RouteSettings(
                                  arguments: data,
                                ),
                              ));
                            } else {
                              LoadingDialog.hide(context);
                              final snackBar =
                                  SnackBar(content: Text('Password is wrong'));

                              Scaffold.of(context).showSnackBar(snackBar);
                            }
                          }
                        }
                      },
                    ),
                    // Add TextFormFields and RaisedButton here.
                  ])),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
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
    } else
      return Background(
        child: new Container(
          child: new Center(
            child: new CircularProgressIndicator(),
          ),
        ),
      );
  }
}
