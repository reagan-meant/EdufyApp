import 'package:edufy/data/database_provider.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/ui/Subject/subject_screen.dart';
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
          stream: AppDatabase(data["db"]).classesDao.watchClassesByLevel(data["levelId"]),
          builder: (context, AsyncSnapshot<List<Classe>> snapshot) {
            final classes = snapshot.data ?? List();

            return ListView.builder(
                itemCount: classes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                          data["classId"] = classes[index].class_id;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => SubjectScreen(),
                            settings: RouteSettings(
                              arguments: data,
                            )));
                      },
                      title: Text('${classes[index].class_name}'),
                    ),
                  );
                });
          }),
    );
  }
}
