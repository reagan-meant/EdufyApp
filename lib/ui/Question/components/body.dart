import 'dart:math';

import 'package:edufy/constants.dart';
import 'package:edufy/data/database_provider.dart';
import 'package:edufy/data/moor_db.dart';
import 'package:edufy/ui/Welcome/components/background.dart';
import 'package:edufy/ui/components/Loading_dialog.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BodyState();
  }
}

class BodyState extends State<Body> {
  Color correctColor;
  Color wrongColor;

  bool isSelected = false;

  int selectedItemIndex;
//    var questionz;
static Question qn = Question(question_id: 09, question_text: "nill", class_id: 2, term_id: 1, correct_option: 1, answer_id: 1, paper_number: 1, subject_id: null, answered: null, times_correct: null, times_wrong: null);
  List<Question> questionz ;
  //= [qn];
  int gotten;
  int answerId;
  @override
  void initState() {
    super.initState();
    isSelected = false;

    correctColor = Colors.blue;
    wrongColor = Colors.white;
    questionz = List<Question>();
    gotten = 0;
    answerId;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map data = ModalRoute.of(context).settings.arguments;

    // This size provide us total height and width of our screen
    return Background(
        child: FutureBuilder(
      future: AppDatabase(data["db"])
          .questionDao
          .watchQuestionByClassSubjectPaper(
              data["classId"], data["subjectId"], data["paperNumber"]),
      builder: (BuildContext context, AsyncSnapshot questions) {
        if (questions.connectionState == ConnectionState.none &&
            questions.hasData == null) {
          LoadingDialog.show(context);

          return Container();
        } else {
          //LoadingDialog.show(context);
          print("fail in else");
          if (questionz.isEmpty) {
            //    if (questionz.length == 0) {
            print("fail on adding");
            questionz.addAll(questions.data);
            print("questions are");
            print(questionz);
          }

          print("questions are");
          print(questionz);
//int minNo =0;
          int minNo = questionz.map<int>((q) => q.answered).reduce(min);
          print("he fails before");
          for (var a = 0; a < questions.data.length; a++) {
            print("am well inside");
            if (questions.data[a].answered == minNo) {
              print("did we fail after");
              if (questions.data[a].answered != 0) {
                print("or rather here");
                gotten = a;
              }
              if (answerId == null) {
                print("am the last i promise");
                answerId = questions.data[a].answer_id;
              }
            }
          }
          // LoadingDialog.show(context);

          return FutureBuilder(
              future:
                  AppDatabase(data["db"]).answersDao.getAnswersById(answerId),
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
                          backgroundColor: kPrimaryColor,
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
                                          color: ((isSelected) &&
                                                  ((1 + index) ==
                                                      questions.data[gotten]
                                                          .correct_option))
                                              ? correctColor
                                              : Colors.white,
                                          child: ListTile(
                                            onTap: () {
                                              if ((1 + index) ==
                                                  questions.data[gotten]
                                                      .correct_option) {
                                                setState(() {
                                                  isSelected = true;
                                                });
                                              } else {
                                                setState(() {
                                                  isSelected = true;
                                                });
                                              }
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
                                            isSelected = false;
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
                                            isSelected = false;
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
    ));
  }
}
