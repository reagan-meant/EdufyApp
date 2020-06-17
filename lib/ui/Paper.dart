import 'package:edufy/bloc/level/level_bloc.dart';
import 'package:edufy/data/models/Levels.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/ui/Login.dart';
import 'package:edufy/ui/Question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaperPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PaperPageState();
  }
  
}

class PaperPageState extends State<PaperPage>{

  final _levelbloc = LevelBloc();
 @override
  Widget build(BuildContext context) {
      Map data = ModalRoute.of(context).settings.arguments;
      print (data);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Papers'),
      ),
      body: StreamBuilder(
          stream: AppDatabase().questionDao.watchPaperByClassAndSubject(data["classId"],data["subjectId"]),
          builder: (context, AsyncSnapshot<List<Question>> snapshot) {
            final questions = snapshot.data ?? List();

            Set paper_number = new Set();

            questions.forEach((q){
              paper_number.add(q.paper_number);
            });
            
            return ListView.builder(
                itemCount: paper_number.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        data.addAll(
                           {"paperNumber":paper_number.elementAt(index)}
                        );

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => QuestionPage(),
                      settings: RouteSettings(arguments: data)
                      
                      ));
                      },
                      title: Text('${paper_number.elementAt(index)}'),
                    ),
                  );
                });
          }),
    );
  }
    
}
  