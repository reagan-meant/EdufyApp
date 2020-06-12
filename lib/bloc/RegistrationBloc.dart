import 'package:edufy/data/moor_db.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

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
    Student student = new Student(
        student_fname: firstname.value,
        student_lname: lastname.value,
        student_mname: middlename.value,
        student_email: email.value,
        student_username: username.value,
        student_password: password.value,
        class_id: int.parse(classId.value));
    AppDatabase().studentDao.insertStudent(student);
    emitSuccess();
  }
}
