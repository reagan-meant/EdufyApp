import 'package:edufy/data/database_provider.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/ui/Level/level_screen.dart';
import 'package:edufy/ui/Signup/signup_screen.dart';
import 'package:edufy/ui/components/Loading_dialog.dart';
import 'package:edufy/ui/components/already_have_an_account_acheck.dart';
import 'package:edufy/ui/components/rounded_input_field.dart';
import 'package:edufy/ui/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:edufy/ui/Welcome/components/background.dart';
import 'package:edufy/ui/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    //  LoadingDialog.hide(context);

    Size size = MediaQuery.of(context).size;
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

                            Map data = {"db": username + ".sqlite"};
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => LevelScreen(),
                              settings: RouteSettings(
                                arguments: data,
                              ),
                            ));
                          }else{
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
  }
}
