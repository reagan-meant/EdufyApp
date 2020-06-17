import 'package:edufy/data/moor_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class QuestionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuestionPageState();
  }
}

class QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    List<Question> questions = new List();
    AppDatabase()
        .questionDao
        .watchQuestionByClassSubjectPaper(
            data["classId"], data["subjectId"], data["paperNumber"])
        .then((q) {
      questions.addAll(q);
    });
print(questions);
    //int minNo = questions.map<int>((q) => q.answered).reduce(min);
    int gotten = 0;

   /*  for (var a = 0; a < questions.length; a++) {
      if (questions[a].answered == minNo) {
        gotten = a;
      }
    } */
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
        ),
        body: Card(
          child: ListTile(
            onTap: () {},
            title: Text('${questions[gotten].question_text}'),
          ),
        ));
  }
}
/* 
import 'dart:math';
void main() {
  Animals anime1 = new Animals(4,'Insect',9);
   Animals anime2 = new Animals(2,'Bats',3);
  Animals anime3 = new Animals(4,'Crane',5);
  Animals anime4 = new Animals(2,'Goats',1);

  List<Animals> anims = new List();

  anims.add(anime1);
  anims.add(anime2);
  anims.add(anime3);
  anims.add(anime4);
   int minNo = anims.map<int>((e) => e.seen).reduce(min);
 int gotten=0;
  
  for(var a = 0;a<anims.length;a++){
    if (anims[a].seen == minNo){
      gotten = a;
    }
  }
  print('the min animalis ' + anims[gotten].name);
}

class Animals{
  int legs;
  String name;
  int seen;
  
  Animals(int legs,String name,int seen){
    this.legs = legs;
    this.name = name;
    this.seen = seen;
    
  }
}

 */
