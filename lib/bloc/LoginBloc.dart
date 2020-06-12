import 'package:edufy/data/moor_db.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginBloc extends FormBloc<String, String> {
  final username = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );
  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  LoginBloc() {
    addFieldBlocs(
      fieldBlocs: [
        username,
        password,
      ],
    );
  }

  @override
  Future<void> onSubmitting() async {
    String studentUsername = username.value;
    //String student_password = password.value;

    List<Student> students =
        await AppDatabase().studentDao.finduserByUsername(studentUsername);
emitSuccess();
 
/* 
    if (students != null) {
      if (students[0].student_username == studentUsername) {
        emitSuccess();
      } else {
        emitFailure();
      }
    } else {
      emitFailure();
    }
  } */
}
}