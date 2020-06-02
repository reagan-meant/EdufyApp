import 'package:edufy/data/moor_db.dart';
import 'package:edufy/events/subject/add_subject_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/subjectsBloc.dart';

class subjectForm extends StatefulWidget {
  final Subject subject;

  subjectForm({this.subject});
  @override
  State<StatefulWidget> createState() {
    return subjectState();
  }
}

class subjectState extends State<subjectForm> {
  String _name;
  int _classId;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      initialValue: _name,
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 15,
      style: TextStyle(fontSize: 28),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildClassId() {
    return TextFormField(
      initialValue: null,
      decoration: InputDecoration(labelText: 'Class Id'),
      keyboardType: TextInputType.number,
      maxLength: 15,
      style: TextStyle(fontSize: 28),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Class Id is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _classId = value as int;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.subject != null) {
      _name = widget.subject.subject_name;
      _classId = widget.subject.class_id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Subject Form')),
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(), 
              _buildClassId(),
              widget.subject==null ? 
              RaisedButton(
                child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                onPressed: (){
                   if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _formKey.currentState.save();

                        Subject subject = Subject(
                          subject_name: _name,
                          class_id: _classId,
                        );

                        AppDatabase().subjectDao.insertSubject(subject).then(
                              (storedsubject) => BlocProvider.of<SubjectBloc>(context).add(
                                addSubject(storedsubject),
                              ),
                            );

                        Navigator.pop(context);
                      },
                ):
                Row()
                ]


          )),
    );
  }
}
