import 'package:edufy/constants.dart';
import 'package:edufy/ui/Subject/components/body.dart';
import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }
}
