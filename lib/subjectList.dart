
import 'package:edufy/bloc/subjectsBloc.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/events/subject/set_subject_event.dart';
import 'package:edufy/subject_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectPage extends StatefulWidget {
  @override
  _subjectListState createState() => _subjectListState();
}

class _subjectListState extends State<SubjectPage> {
  @override
  void initState() {
    super.initState();
    AppDatabase().subjectDao.getAllSubjects().then((subjectList) {
      BlocProvider.of<SubjectBloc>(context).add(setSubjects(subjectList));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edufy'),
      ),
      body: Container(
        child: BlocConsumer<SubjectBloc, List<Subject>>(
            builder: (context, subjectList) {
              return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {

                    Subject subject = subjectList[index];
                    return ListTile(
                        title: Text(subject.subject_name,
                            style: TextStyle(fontSize: 30)),
                        subtitle: Text(
                          "Subject: ${subject.subject_name}",
                          style: TextStyle(fontSize: 20),
                        ));

                    //onTap: () => showFoodDialog(context, food, index));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(color: Colors.black),
                  itemCount: subjectList.length);
            },
            listener: (BuildContext context, foodList) {}),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => subjectForm()),
        ),
      
      )
    );
  }
}
