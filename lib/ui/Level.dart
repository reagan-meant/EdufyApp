import 'package:edufy/bloc/level/level_bloc.dart';
import 'package:edufy/data/models/Levels.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/ui/Login.dart';
import 'package:edufy/ui/class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LevelPageState();
  }
  
}

class LevelPageState extends State<LevelPage>{
  final _levelbloc = LevelBloc();
 @override
  Widget build(BuildContext context) {
    Map todo = ModalRoute.of(context).settings.arguments;
    print(todo);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Levels'),
      ),
      body: StreamBuilder(
          stream: AppDatabase().levelsDao.watchAllLevels(),
          builder: (context, AsyncSnapshot<List<Level>> snapshot) {
            final levels = snapshot.data ?? List();

            return ListView.builder(
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => ClassPage(),
                      settings: RouteSettings(arguments: levels[index].level_id,)
                      
                      ));
                      },
                      title: Text('${levels[index].level_name}'),
                    ),
                  );
                });
          }),
    );
  }
    
}
  