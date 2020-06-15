import 'package:edufy/bloc/level/level_bloc.dart';
import 'package:edufy/data/models/Levels.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/subjectList.dart';
import 'package:edufy/ui/Login.dart';
import 'package:edufy/ui/Paper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClassPageState();
  }
  
}

class ClassPageState extends State<ClassPage>{

  final _levelbloc = LevelBloc();
 @override
  Widget build(BuildContext context) {
      int levelId = ModalRoute.of(context).settings.arguments;
      
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes'),
      ),
      body: StreamBuilder(
          stream: AppDatabase().classesDao.watchClassesByLevel(levelId),
          builder: (context, AsyncSnapshot<List<Classe>> snapshot) {
            final classes = snapshot.data ?? List();

            return ListView.builder(
                itemCount: classes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => SubjectPage(),
                      settings: RouteSettings(arguments: classes[index],)
                      
                      ));
                      },
                      title: Text('${classes[index].class_name}'),
                    ),
                  );
                });
          }),
    );
  }
    
}
  