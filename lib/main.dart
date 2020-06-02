import 'package:edufy/bloc/subjectsBloc.dart';
import 'package:edufy/subjectList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Application',
      home: BlocProvider<SubjectBloc>(
        create: (context) => SubjectBloc(),
        child: SubjectPage(),
      ),
    );
  }
}
