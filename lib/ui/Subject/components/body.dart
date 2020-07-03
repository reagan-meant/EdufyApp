import 'package:edufy/data/database_provider.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/ui/Paper/paper_screen.dart';
import 'package:edufy/ui/Welcome/components/background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map data = ModalRoute.of(context).settings.arguments;

    // This size provide us total height and width of our screen
    return Background(
      child: StreamBuilder(
          stream: AppDatabase(data["db"])
              .subjectDao
              .watchSubjectsByClass(data["classId"]),
          builder: (context, AsyncSnapshot<List<Subject>> snapshot) {
            final subjects = snapshot.data ?? List();

            return ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        data["subjectId"] = subjects[index].subject_id;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PaperScreen(),
                            settings: RouteSettings(
                              arguments: data,
                            )));
                      },
                      title: Text('${subjects[index].subject_name}'),
                    ),
                  );
                });
          }),
    );
  }
}
