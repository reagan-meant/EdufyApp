import 'package:edufy/bloc/level/level_bloc.dart';
import 'package:edufy/data/models/Levels.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/ui/Login.dart';
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
          stream: AppDatabase().classesDao.watchClassesByLevel(data["classId"]),
          builder: (context, AsyncSnapshot<List<Classe>> snapshot) {
            final classes = snapshot.data ?? List();

            return ListView.builder(
                itemCount: classes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => Login(),
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
  