import 'package:edufy/constants.dart';
import 'package:edufy/ui/Paper/components/body.dart';
import 'package:flutter/material.dart';

class PaperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Papers'),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }
}
