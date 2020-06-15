import 'package:edufy/data/moor_db.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:moor_flutter/moor_flutter.dart';

class RegistrationBloc extends FormBloc<String, String> {
  final firstname = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );
  final lastname = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );
  final middlename = TextFieldBloc(
    validators: [],
  );
  final username = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );
  final classId = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );
  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  RegistrationBloc() {
    addFieldBlocs(
      fieldBlocs: [
        firstname,
        lastname,
        middlename,
        username,
        classId,
        email,
        password,
      ],
    );
  }

  @override
  void onSubmitting() {
    final student = new StudentsCompanion(
        student_fname: Value(firstname.value),
        student_lname: Value(lastname.value),
        student_mname: Value(middlename.value),
        student_email: Value(email.value),
        student_username: Value(username.value),
        student_password: Value(password.value),
        class_id: Value(int.parse(classId.value)));
    AppDatabase().studentDao.insertStudent(student);
    emitSuccess();
  }
}
