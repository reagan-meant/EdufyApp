import 'package:edufy/constants.dart';
import 'package:edufy/ui/Class/components/body.dart';
import 'package:flutter/material.dart';

class ClassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class'),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }
}
