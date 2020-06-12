import 'package:edufy/bloc/LoginBloc.dart';
import 'package:edufy/subjects.dart';
import 'package:edufy/ui/Questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //create bloc instance and pass it as context
      create: (context) => LoginBloc(),
      child: Builder(
        //widget to provide bloc
        builder: (context) {
          final loginBloc = context.bloc<LoginBloc>();

          return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(title: Text('Login')),
              body: FormBlocListener<LoginBloc, String, String>(
                onSubmitting: (context, state) {
                  LoadingDialog.show(context);
                },
                onSuccess: (context, state) {
                  LoadingDialog.hide(context);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => questions())); //change this redirect
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
                        textFieldBloc: loginBloc.username,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                     
                      TextFieldBlocBuilder(
                        textFieldBloc: loginBloc.password,
                        suffixButton: SuffixButton.obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      RaisedButton(
                        onPressed: loginBloc.submit,
                        child: Text('Login'),
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
