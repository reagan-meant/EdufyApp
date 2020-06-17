import 'dart:io';
import 'package:edufy/subjects.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SubjectPages extends StatefulWidget {
  @override
  _subjectListState createState() => _subjectListState();
}

class _subjectListState extends State<SubjectPages> {
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edufy'),
      ),
      body: Center(
        child: Text('Home page'),
      ),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22),
          backgroundColor: Color(0xFF801E48),
          visible: true,
          curve: Curves.bounceIn,
          children: [
            // FAB 1
            SpeedDialChild(
                child: Icon(Icons.assignment_turned_in),
                backgroundColor: Color(0xFF801E48),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => subjectView()));
                },
                label: 'Next',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16.0),
                labelBackgroundColor: Color(0xFF801E48)),
            // FAB 2 initialise db
            SpeedDialChild(
                child: Icon(Icons.assignment_turned_in),
                backgroundColor: Color(0xFF801E48),
                onTap: () async {
                },
                label: 'Start DB',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16.0),
                labelBackgroundColor: Color(0xFF801E48)),
          ]),
    );
  }
}
