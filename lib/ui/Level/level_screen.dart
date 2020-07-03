import 'package:edufy/constants.dart';
import 'package:edufy/ui/Level/components/body.dart';
import 'package:flutter/material.dart';

class LevelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level'),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }
}
