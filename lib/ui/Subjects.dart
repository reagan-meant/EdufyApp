import 'package:edufy/data/moor_db.dart';
import 'package:edufy/ui/Paper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubjectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SubjectPageState();
  }
}

class SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
          int classId = ModalRoute.of(context).settings.arguments;
          print (classId);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
      ),
      body: StreamBuilder(
          stream: AppDatabase().subjectDao.watchSubjectsByClass(classId),
          builder: (context, AsyncSnapshot<List<Subject>> snapshot) {
            final subjects = snapshot.data ?? List();

            return ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Map data = {"subjectId":subjects[index].subject_id,"classId":classId};
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => PaperPage(),
                          settings: RouteSettings(arguments: data,)
                        ));

                      },
                      title: Text('${subjects[index].subject_name}'),
                    ),
                  );
                });
          }),
    );
  }
}
