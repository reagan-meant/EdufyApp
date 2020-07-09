import 'dart:math';
import 'dart:convert';

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
  bool showcard;

  int selectedItemIndex;
  int minNo;
//    var questionz;
//static Question qn = Question(question_id: 09, question_text: "nill", class_id: 2, term_id: 1, correct_option: 1, answer_id: 1, paper_number: 1, subject_id: null, answered: null, times_correct: null, times_wrong: null);
  List<Question> questionz;
  //= [qn];
  int gotten;
  int answerId;
  @override
  void initState() {
    super.initState();
    isSelected = false;

    correctColor = Colors.blue;
    wrongColor = Colors.white;
    questionz = <Question>[];
    gotten = 0;
    answerId;
    showcard = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map data = ModalRoute.of(context).settings.arguments;
    String dbName = data["db"];

    // This size provide us total height and width of our screen
    return Background(
        child: FutureBuilder(
      future: AppDatabase(dbName).questionDao.watchQuestionByClassSubjectPaper(
          data["classId"], data["subjectId"], data["paperNumber"]),
      builder: (BuildContext context, AsyncSnapshot questions) {
        if (questions.connectionState == ConnectionState.none &&
            questions.hasData == null) {
          print("hit here");
          LoadingDialog.show(context);

          return CircularProgressIndicator();
          //Container();
        } else if (questions.hasData) {
          //LoadingDialog.show(context);
          print("fail in else");
          print(questionz.isEmpty);
          if (questionz.isEmpty) {
            //    if (questionz.length == 0) {
            print("fail on adding");
            //  questionz = questions.data;
            for (var qnz in questions.data) {
              questionz.add(qnz);
              minNo = questionz.map<int>((q) => q.answered).reduce(max);

              for (var a = 0; a < questions.data.length; a++) {
                answerId = questions.data[0].answer_id;

                print("am well inside");
                if (questions.data[a].answered == minNo) {
                  print("did we fail after");
                  if (questions.data[a].answered != 0) {
                    if ((a + 1) == questions.data.length) {
                      gotten = 0;
                      answerId = questions.data[0].answer_id;
                    } else {
                      gotten = a + 1;
                      answerId = questions.data[a + 1].answer_id;
                    }
                  }
                }
              }
            }

            // questionz.addAll(questions.data);
            print("questions are");
            print(questionz);
            print("json QNs");
            print(jsonEncode(questionz));
          }

          print("questions out are");
          print(questionz);
          /* gotten = 0;
                      answerId = questions.data[0].answer_id;
//int minNo =0; */
          print("he fails before");
          print(minNo);

          if (questionz[gotten].tag == 'objective') {
            return FutureBuilder(
                future: AppDatabase(dbName).answersDao.getAnswersById(answerId),
                builder: (C, data) {
                  if (data.connectionState == ConnectionState.none &&
                      data.hasData == null) {
                    return Container();
                  } else if (data.hasData) {
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
                          SliverToBoxAdapter(
                              child: (questionz[gotten].images == 1)
                                  ? Container(
                                      child: Image.asset(
                                        "assets/images/database/cr7.jpg",
                                        width: size.width * 0.3,
                                      ),
                                    )
                                  : Container()),
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
                                                  AppDatabase(dbName)
                                                      .questionDao
                                                      .updateQuestion(questions
                                                          .data[gotten]
                                                          .copyWith(
                                                              answered:
                                                                  (index + 1),
                                                              times_correct: (questions
                                                                      .data[
                                                                          gotten]
                                                                      .times_correct +
                                                                  1)));

                                                  setState(() {
                                                    isSelected = true;
                                                  });
                                                } else {
                                                  AppDatabase(dbName)
                                                      .questionDao
                                                      .updateQuestion(questions
                                                          .data[gotten]
                                                          .copyWith(
                                                              answered:
                                                                  (index + 1),
                                                              times_wrong: (questions
                                                                      .data[
                                                                          gotten]
                                                                      .times_wrong +
                                                                  1)));

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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          child:
                                              new Icon(Icons.navigate_before),
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
                  } else {
                    return CircularProgressIndicator();
                  }
                });
          } else {
//structured
            return FutureBuilder(
                future: AppDatabase(dbName).answersDao.getAnswersById(answerId),
                builder: (C, data) {
                  if (data.connectionState == ConnectionState.none &&
                      data.hasData == null) {
                    return Container();
                  } else if (data.hasData) {
                    final answers = data.data ?? Answer();
                    //print()
                    print(answers);
                    var ourList = new List();
                    ourList.add(answers.option1);

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
                                // subtitle: ,
                              ),
                            )),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              // height: 1000,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  showcard
                                      ? new FloatingActionButton(
                                          onPressed: () {
                                            setState(() {
                                              showcard = !showcard;
                                            });
                                          },
                                          backgroundColor: Colors.blue,
                                          //if you set mini to true then it will make your floating button small
                                          mini: false,
                                          child: new Icon(Icons.arrow_drop_up),
                                        )
                                      : new FloatingActionButton(
                                          onPressed: () {
                                            AppDatabase(dbName)
                                                .questionDao
                                                .updateQuestion(questions
                                                    .data[gotten]
                                                    .copyWith(
                                                  answered: (questions
                                                          .data[gotten]
                                                          .answered +
                                                      1),
                                                ));
                                            setState(() {
                                              showcard = !showcard;
                                            });
                                          },
                                          backgroundColor: Colors.blue,
                                          //if you set mini to true then it will make your floating button small
                                          mini: false,
                                          child:
                                              new Icon(Icons.arrow_drop_down),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          showcard
                              ? SliverToBoxAdapter(
                                  child: SizedBox(
                                      // height: 1000,
                                      child: Card(
                                    child: ListTile(
                                      onTap: () {},
                                      title: Text('${ourList[0]}'),
                                    ),
                                  )),
                                )
                              : new SliverToBoxAdapter(),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              // height: 1000,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          child:
                                              new Icon(Icons.navigate_before),
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
                          // Place sliver widgets here
                        ],
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                });
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }
}
