import 'package:edufy/bloc/RegistrationBloc.dart';
import 'package:edufy/subject_form.dart';
import 'package:edufy/ui/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //create bloc instance and pass it as context
      create: (context) => RegistrationBloc(),
      child: Builder(
        //widget to provide bloc
        builder: (context) {
          final registrationBloc = context.bloc<RegistrationBloc>();

          return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(title: Text('Registration')),
              body: FormBlocListener<RegistrationBloc, String, String>(
                onSubmitting: (context, state) {
                  LoadingDialog.show(context);
                },
                onSuccess: (context, state) {
                  LoadingDialog.hide(context);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => Login())); //change this redirect
                },
                onFailure: (context, state) {
                  LoadingDialog.hide(context);

                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text(state.failureResponse)));
                },
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      TextFieldBlocBuilder(
                        textFieldBloc: registrationBloc.firstname,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: registrationBloc.lastname,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: registrationBloc.middlename,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Middle Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: registrationBloc.username,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: registrationBloc.classId,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Class',
                          prefixIcon: Icon(Icons.help_outline),
                        ),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: registrationBloc.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: registrationBloc.password,
                        suffixButton: SuffixButton.obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      RaisedButton(
                        onPressed: registrationBloc.submit,
                        child: Text('Register'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text('Go to Login'),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}

//loading widget
class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  LoadingDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: EdgeInsets.all(12.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
