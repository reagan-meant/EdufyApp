import 'package:edufy/data/moor_db.dart';

import 'package:edufy/ui/Class/class_screen.dart';
import 'package:edufy/ui/Welcome/components/background.dart';
import 'package:flutter/material.dart';
import 'package:edufy/data/database_provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map userData = ModalRoute.of(context).settings.arguments;

    // This size provide us total height and width of our screen
    return Background(
      child: StreamBuilder(
          stream: AppDatabase(userData["db"]).levelsDao.watchAllLevels(),
          builder: (context, AsyncSnapshot<List<Level>> snapshot) {
            final levels = snapshot.data ?? List();

            return Center(
              child: ListView.builder(
                  itemCount: levels.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Map data = {
                            "db": userData["db"],
                            "levelId": levels[index].level_id
                          };
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ClassScreen(),
                              settings: RouteSettings(
                                arguments: data,
                              )));
                        },
                        title: Text('${levels[index].level_name}'),
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
