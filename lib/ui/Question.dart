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
  //Color colour = Colors.cyan;

  Color correctColor;
  Color wrongColor;

  var isSelected;

  @override
  void initState() {
    super.initState();
    correctColor = Colors.blue;
    wrongColor = Colors.red;
  }

  int selectedItemIndex;
  List<Question> questionz = new List();
  int gotten = 0;
  int answerId;

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;

    // TODO: implement build
    return FutureBuilder(
      future: AppDatabase().questionDao.watchQuestionByClassSubjectPaper(
          data["classId"], data["subjectId"], data["paperNumber"]),
      builder: (BuildContext context, AsyncSnapshot questions) {
        if (questions.connectionState == ConnectionState.none &&
            questions.hasData == null) {
          return Container();
        } else {
          if (questionz.length == 0) {
            questionz.addAll(questions.data);
            print("questions are");
            print(questionz);
          }

          print("questions are");
          print(questionz);
          int minNo = questionz.map<int>((q) => q.answered).reduce(min);
          print("min no");
          print(minNo);
          for (var a = 0; a < questions.data.length; a++) {
            if (questions.data[a].answered == minNo) {
              if (questions.data[a].answered != 0) {
                gotten = a;
              }
              if (answerId == null) {
                answerId = questions.data[a].answer_id;
              }
            }
          }

          return FutureBuilder(
              future: AppDatabase().answersDao.getAnswersById(answerId),
              builder: (C, data) {
                if (data.connectionState == ConnectionState.none &&
                    data.hasData == null) {
                  return Container();
                } else {
                  final answers = data.data ?? Answer();
                  //print()
                  print(answers);
                  var ourList = new List();
                  ourList.add("a) " + answers.option1);
                  ourList.add("b) " + answers.option2);
                  ourList.add("c) " + answers.option3);
                  ourList.add("d) " + answers.option4);

                  return Container(
                    color: Colors.deepPurpleAccent,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          title: Text("Questions"),
                          pinned: true,
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                              // height: 1000,
                              child: Card(
                            child: ListTile(
                              onTap: () {},
                              title: Text('${gotten + 1}. ' +
                                  '${questionz[gotten].question_text}'),
                            ),
                          )),
                        ),

                        SliverList(
                          delegate: SliverChildListDelegate([
                            Container(
                                child: ListView.builder(
                                    itemCount: ourList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: Ink(
                                          color: Colors.deepOrange,
                                          child: ListTile(
                                            onTap: () {
                                              setState(() {
                                                selectedItemIndex = index;
                                              });

                                              //int selectedItemIndex;
                                              /*  if ((1 + index) ==
                                                  questions.data[gotten]
                                                      .correct_option) {
                                                setState(() {
                                                  isSelected =true;
                                                });
                                              } else {
                                                setState(() {
                                                  isSelected =true;
                                                  wrongColor = Colors.red;
                                                });
                                              } */
                                            },
                                            title: Text(
                                                '${ourList.elementAt(index)}'),
                                          ),
                                        ),
                                      );
                                    }))
                          ]),
                        ),
                        // Place sliver widgets here
                        SliverToBoxAdapter(
                          child: SizedBox(
                            // height: 1000,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                (gotten > 0)
                                    ? (new FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            gotten -= 1;
                                            answerId =
                                                questionz[gotten].answer_id;
                                          });
                                        },
                                        backgroundColor: Colors.blue,
                                        //if you set mini to true then it will make your floating button small
                                        mini: false,
                                        child: new Icon(Icons.navigate_before),
                                      ))
                                    : new Container(),
                                (gotten < questionz.length - 1)
                                    ? (new FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            gotten += 1;
                                            answerId =
                                                questionz[gotten].answer_id;
                                          });
                                        },
                                        backgroundColor: Colors.blue,
                                        //if you set mini to true then it will make your floating button small
                                        mini: false,
                                        child: new Icon(Icons.navigate_next),
                                      ))
                                    : new Container(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              });
        }
      },
    );
  }
}
