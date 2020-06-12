import 'package:edufy/data/moor_db.dart';
import 'package:flutter/material.dart';

class subjectView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return subjectState();
  }
}

class subjectState extends State<subjectView> {
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('meantex'),
      ),
      body: StreamBuilder(
          stream: AppDatabase().subjectDao.watchAllSubjects(),
          builder: (context, AsyncSnapshot<List<Subject>> snapshot) {
            final subjects = snapshot.data ?? List();

            //List<String> subjects = <String>['A', 'B', 'C'];

            return ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (_, index) {
                return Container(
                  height: 50,
                  child: Center(child: Text('${subjects[index].class_id} '+'${subjects[index].subject_name}')),
                );
              },
            );
          }),
    );
  }
}
