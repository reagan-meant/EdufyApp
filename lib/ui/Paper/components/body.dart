import 'package:edufy/data/database_provider.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/ui/Question/question_screen.dart';
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
              .questionDao
              .watchPaperByClassAndSubject(data["classId"], data["subjectId"]),
          builder: (context, AsyncSnapshot<List<Question>> snapshot) {
            final questions = snapshot.data ?? List();

            Set paper_number = new Set();

            questions.forEach((q) {
              paper_number.add(q.paper_number);
            });

            return ListView.builder(
                itemCount: paper_number.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                         data.addAll(
                            {"paperNumber": paper_number.elementAt(index)}); 
                       // data["paperNumber"] = paper_number.elementAt(index);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => QuestionScreen(),
                            settings: RouteSettings(arguments: data)));
                      },
                      title: Text('${paper_number.elementAt(index)}'),
                    ),
                  );
                });
          }),
    );
  }
}
