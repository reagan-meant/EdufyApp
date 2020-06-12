import 'package:edufy/data/moor_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class questions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return questionState();
  }
}

class questionState extends State<questions> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),
      body: StreamBuilder(
          stream: AppDatabase().questionDao.watchAllQuestions(),
          builder: (context, AsyncSnapshot<List<Question>> snapshot) {
            final questions = snapshot.data ?? List();

            return ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text('${questions[index].question_text}'),
                    ),
                  );
                });
          }),
    );
  }
}
