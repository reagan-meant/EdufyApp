// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Question extends DataClass implements Insertable<Question> {
  final int question_id;
  final String question_text;
  final int class_id;
  final int term_id;
  final int correct_option;
  final int answer_id;
  final int subject_id;
  final int answered;
  final int times_correct;
  final int times_wrong;
  Question(
      {@required this.question_id,
      @required this.question_text,
      @required this.class_id,
      @required this.term_id,
      @required this.correct_option,
      @required this.answer_id,
      @required this.subject_id,
      @required this.answered,
      @required this.times_correct,
      @required this.times_wrong});
  factory Question.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Question(
      question_id: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}question_id']),
      question_text: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}question_text']),
      class_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}class_id']),
      term_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}term_id']),
      correct_option: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}correct_option']),
      answer_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}answer_id']),
      subject_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}subject_id']),
      answered:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}answered']),
      times_correct: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}times_correct']),
      times_wrong: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}times_wrong']),
    );
  }
  factory Question.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Question(
      question_id: serializer.fromJson<int>(json['question_id']),
      question_text: serializer.fromJson<String>(json['question_text']),
      class_id: serializer.fromJson<int>(json['class_id']),
      term_id: serializer.fromJson<int>(json['term_id']),
      correct_option: serializer.fromJson<int>(json['correct_option']),
      answer_id: serializer.fromJson<int>(json['answer_id']),
      subject_id: serializer.fromJson<int>(json['subject_id']),
      answered: serializer.fromJson<int>(json['answered']),
      times_correct: serializer.fromJson<int>(json['times_correct']),
      times_wrong: serializer.fromJson<int>(json['times_wrong']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'question_id': serializer.toJson<int>(question_id),
      'question_text': serializer.toJson<String>(question_text),
      'class_id': serializer.toJson<int>(class_id),
      'term_id': serializer.toJson<int>(term_id),
      'correct_option': serializer.toJson<int>(correct_option),
      'answer_id': serializer.toJson<int>(answer_id),
      'subject_id': serializer.toJson<int>(subject_id),
      'answered': serializer.toJson<int>(answered),
      'times_correct': serializer.toJson<int>(times_correct),
      'times_wrong': serializer.toJson<int>(times_wrong),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Question>>(bool nullToAbsent) {
    return QuestionsCompanion(
      question_id: question_id == null && nullToAbsent
          ? const Value.absent()
          : Value(question_id),
      question_text: question_text == null && nullToAbsent
          ? const Value.absent()
          : Value(question_text),
      class_id: class_id == null && nullToAbsent
          ? const Value.absent()
          : Value(class_id),
      term_id: term_id == null && nullToAbsent
          ? const Value.absent()
          : Value(term_id),
      correct_option: correct_option == null && nullToAbsent
          ? const Value.absent()
          : Value(correct_option),
      answer_id: answer_id == null && nullToAbsent
          ? const Value.absent()
          : Value(answer_id),
      subject_id: subject_id == null && nullToAbsent
          ? const Value.absent()
          : Value(subject_id),
      answered: answered == null && nullToAbsent
          ? const Value.absent()
          : Value(answered),
      times_correct: times_correct == null && nullToAbsent
          ? const Value.absent()
          : Value(times_correct),
      times_wrong: times_wrong == null && nullToAbsent
          ? const Value.absent()
          : Value(times_wrong),
    ) as T;
  }

  Question copyWith(
          {int question_id,
          String question_text,
          int class_id,
          int term_id,
          int correct_option,
          int answer_id,
          int subject_id,
          int answered,
          int times_correct,
          int times_wrong}) =>
      Question(
        question_id: question_id ?? this.question_id,
        question_text: question_text ?? this.question_text,
        class_id: class_id ?? this.class_id,
        term_id: term_id ?? this.term_id,
        correct_option: correct_option ?? this.correct_option,
        answer_id: answer_id ?? this.answer_id,
        subject_id: subject_id ?? this.subject_id,
        answered: answered ?? this.answered,
        times_correct: times_correct ?? this.times_correct,
        times_wrong: times_wrong ?? this.times_wrong,
      );
  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('question_id: $question_id, ')
          ..write('question_text: $question_text, ')
          ..write('class_id: $class_id, ')
          ..write('term_id: $term_id, ')
          ..write('correct_option: $correct_option, ')
          ..write('answer_id: $answer_id, ')
          ..write('subject_id: $subject_id, ')
          ..write('answered: $answered, ')
          ..write('times_correct: $times_correct, ')
          ..write('times_wrong: $times_wrong')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      question_id.hashCode,
      $mrjc(
          question_text.hashCode,
          $mrjc(
              class_id.hashCode,
              $mrjc(
                  term_id.hashCode,
                  $mrjc(
                      correct_option.hashCode,
                      $mrjc(
                          answer_id.hashCode,
                          $mrjc(
                              subject_id.hashCode,
                              $mrjc(
                                  answered.hashCode,
                                  $mrjc(times_correct.hashCode,
                                      times_wrong.hashCode))))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Question &&
          other.question_id == question_id &&
          other.question_text == question_text &&
          other.class_id == class_id &&
          other.term_id == term_id &&
          other.correct_option == correct_option &&
          other.answer_id == answer_id &&
          other.subject_id == subject_id &&
          other.answered == answered &&
          other.times_correct == times_correct &&
          other.times_wrong == times_wrong);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<int> question_id;
  final Value<String> question_text;
  final Value<int> class_id;
  final Value<int> term_id;
  final Value<int> correct_option;
  final Value<int> answer_id;
  final Value<int> subject_id;
  final Value<int> answered;
  final Value<int> times_correct;
  final Value<int> times_wrong;
  const QuestionsCompanion({
    this.question_id = const Value.absent(),
    this.question_text = const Value.absent(),
    this.class_id = const Value.absent(),
    this.term_id = const Value.absent(),
    this.correct_option = const Value.absent(),
    this.answer_id = const Value.absent(),
    this.subject_id = const Value.absent(),
    this.answered = const Value.absent(),
    this.times_correct = const Value.absent(),
    this.times_wrong = const Value.absent(),
  });
  QuestionsCompanion copyWith(
      {Value<int> question_id,
      Value<String> question_text,
      Value<int> class_id,
      Value<int> term_id,
      Value<int> correct_option,
      Value<int> answer_id,
      Value<int> subject_id,
      Value<int> answered,
      Value<int> times_correct,
      Value<int> times_wrong}) {
    return QuestionsCompanion(
      question_id: question_id ?? this.question_id,
      question_text: question_text ?? this.question_text,
      class_id: class_id ?? this.class_id,
      term_id: term_id ?? this.term_id,
      correct_option: correct_option ?? this.correct_option,
      answer_id: answer_id ?? this.answer_id,
      subject_id: subject_id ?? this.subject_id,
      answered: answered ?? this.answered,
      times_correct: times_correct ?? this.times_correct,
      times_wrong: times_wrong ?? this.times_wrong,
    );
  }
}

class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  final GeneratedDatabase _db;
  final String _alias;
  $QuestionsTable(this._db, [this._alias]);
  final VerificationMeta _question_idMeta =
      const VerificationMeta('question_id');
  GeneratedIntColumn _question_id;
  @override
  GeneratedIntColumn get question_id => _question_id ??= _constructQuestionId();
  GeneratedIntColumn _constructQuestionId() {
    return GeneratedIntColumn('question_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _question_textMeta =
      const VerificationMeta('question_text');
  GeneratedTextColumn _question_text;
  @override
  GeneratedTextColumn get question_text =>
      _question_text ??= _constructQuestionText();
  GeneratedTextColumn _constructQuestionText() {
    return GeneratedTextColumn('question_text', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _class_idMeta = const VerificationMeta('class_id');
  GeneratedIntColumn _class_id;
  @override
  GeneratedIntColumn get class_id => _class_id ??= _constructClassId();
  GeneratedIntColumn _constructClassId() {
    return GeneratedIntColumn(
      'class_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _term_idMeta = const VerificationMeta('term_id');
  GeneratedIntColumn _term_id;
  @override
  GeneratedIntColumn get term_id => _term_id ??= _constructTermId();
  GeneratedIntColumn _constructTermId() {
    return GeneratedIntColumn(
      'term_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _correct_optionMeta =
      const VerificationMeta('correct_option');
  GeneratedIntColumn _correct_option;
  @override
  GeneratedIntColumn get correct_option =>
      _correct_option ??= _constructCorrectOption();
  GeneratedIntColumn _constructCorrectOption() {
    return GeneratedIntColumn(
      'correct_option',
      $tableName,
      false,
    );
  }

  final VerificationMeta _answer_idMeta = const VerificationMeta('answer_id');
  GeneratedIntColumn _answer_id;
  @override
  GeneratedIntColumn get answer_id => _answer_id ??= _constructAnswerId();
  GeneratedIntColumn _constructAnswerId() {
    return GeneratedIntColumn(
      'answer_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subject_idMeta = const VerificationMeta('subject_id');
  GeneratedIntColumn _subject_id;
  @override
  GeneratedIntColumn get subject_id => _subject_id ??= _constructSubjectId();
  GeneratedIntColumn _constructSubjectId() {
    return GeneratedIntColumn(
      'subject_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _answeredMeta = const VerificationMeta('answered');
  GeneratedIntColumn _answered;
  @override
  GeneratedIntColumn get answered => _answered ??= _constructAnswered();
  GeneratedIntColumn _constructAnswered() {
    return GeneratedIntColumn(
      'answered',
      $tableName,
      false,
    );
  }

  final VerificationMeta _times_correctMeta =
      const VerificationMeta('times_correct');
  GeneratedIntColumn _times_correct;
  @override
  GeneratedIntColumn get times_correct =>
      _times_correct ??= _constructTimesCorrect();
  GeneratedIntColumn _constructTimesCorrect() {
    return GeneratedIntColumn(
      'times_correct',
      $tableName,
      false,
    );
  }

  final VerificationMeta _times_wrongMeta =
      const VerificationMeta('times_wrong');
  GeneratedIntColumn _times_wrong;
  @override
  GeneratedIntColumn get times_wrong => _times_wrong ??= _constructTimesWrong();
  GeneratedIntColumn _constructTimesWrong() {
    return GeneratedIntColumn(
      'times_wrong',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        question_id,
        question_text,
        class_id,
        term_id,
        correct_option,
        answer_id,
        subject_id,
        answered,
        times_correct,
        times_wrong
      ];
  @override
  $QuestionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'questions';
  @override
  final String actualTableName = 'questions';
  @override
  VerificationContext validateIntegrity(QuestionsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.question_id.present) {
      context.handle(_question_idMeta,
          question_id.isAcceptableValue(d.question_id.value, _question_idMeta));
    } else if (question_id.isRequired && isInserting) {
      context.missing(_question_idMeta);
    }
    if (d.question_text.present) {
      context.handle(
          _question_textMeta,
          question_text.isAcceptableValue(
              d.question_text.value, _question_textMeta));
    } else if (question_text.isRequired && isInserting) {
      context.missing(_question_textMeta);
    }
    if (d.class_id.present) {
      context.handle(_class_idMeta,
          class_id.isAcceptableValue(d.class_id.value, _class_idMeta));
    } else if (class_id.isRequired && isInserting) {
      context.missing(_class_idMeta);
    }
    if (d.term_id.present) {
      context.handle(_term_idMeta,
          term_id.isAcceptableValue(d.term_id.value, _term_idMeta));
    } else if (term_id.isRequired && isInserting) {
      context.missing(_term_idMeta);
    }
    if (d.correct_option.present) {
      context.handle(
          _correct_optionMeta,
          correct_option.isAcceptableValue(
              d.correct_option.value, _correct_optionMeta));
    } else if (correct_option.isRequired && isInserting) {
      context.missing(_correct_optionMeta);
    }
    if (d.answer_id.present) {
      context.handle(_answer_idMeta,
          answer_id.isAcceptableValue(d.answer_id.value, _answer_idMeta));
    } else if (answer_id.isRequired && isInserting) {
      context.missing(_answer_idMeta);
    }
    if (d.subject_id.present) {
      context.handle(_subject_idMeta,
          subject_id.isAcceptableValue(d.subject_id.value, _subject_idMeta));
    } else if (subject_id.isRequired && isInserting) {
      context.missing(_subject_idMeta);
    }
    if (d.answered.present) {
      context.handle(_answeredMeta,
          answered.isAcceptableValue(d.answered.value, _answeredMeta));
    } else if (answered.isRequired && isInserting) {
      context.missing(_answeredMeta);
    }
    if (d.times_correct.present) {
      context.handle(
          _times_correctMeta,
          times_correct.isAcceptableValue(
              d.times_correct.value, _times_correctMeta));
    } else if (times_correct.isRequired && isInserting) {
      context.missing(_times_correctMeta);
    }
    if (d.times_wrong.present) {
      context.handle(_times_wrongMeta,
          times_wrong.isAcceptableValue(d.times_wrong.value, _times_wrongMeta));
    } else if (times_wrong.isRequired && isInserting) {
      context.missing(_times_wrongMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {question_id};
  @override
  Question map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Question.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(QuestionsCompanion d) {
    final map = <String, Variable>{};
    if (d.question_id.present) {
      map['question_id'] = Variable<int, IntType>(d.question_id.value);
    }
    if (d.question_text.present) {
      map['question_text'] =
          Variable<String, StringType>(d.question_text.value);
    }
    if (d.class_id.present) {
      map['class_id'] = Variable<int, IntType>(d.class_id.value);
    }
    if (d.term_id.present) {
      map['term_id'] = Variable<int, IntType>(d.term_id.value);
    }
    if (d.correct_option.present) {
      map['correct_option'] = Variable<int, IntType>(d.correct_option.value);
    }
    if (d.answer_id.present) {
      map['answer_id'] = Variable<int, IntType>(d.answer_id.value);
    }
    if (d.subject_id.present) {
      map['subject_id'] = Variable<int, IntType>(d.subject_id.value);
    }
    if (d.answered.present) {
      map['answered'] = Variable<int, IntType>(d.answered.value);
    }
    if (d.times_correct.present) {
      map['times_correct'] = Variable<int, IntType>(d.times_correct.value);
    }
    if (d.times_wrong.present) {
      map['times_wrong'] = Variable<int, IntType>(d.times_wrong.value);
    }
    return map;
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(_db, alias);
  }
}

class Answer extends DataClass implements Insertable<Answer> {
  final int answer_id;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  Answer(
      {@required this.answer_id,
      @required this.option1,
      @required this.option2,
      @required this.option3,
      @required this.option4});
  factory Answer.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Answer(
      answer_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}answer_id']),
      option1:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}option1']),
      option2:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}option2']),
      option3:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}option3']),
      option4:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}option4']),
    );
  }
  factory Answer.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Answer(
      answer_id: serializer.fromJson<int>(json['answer_id']),
      option1: serializer.fromJson<String>(json['option1']),
      option2: serializer.fromJson<String>(json['option2']),
      option3: serializer.fromJson<String>(json['option3']),
      option4: serializer.fromJson<String>(json['option4']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'answer_id': serializer.toJson<int>(answer_id),
      'option1': serializer.toJson<String>(option1),
      'option2': serializer.toJson<String>(option2),
      'option3': serializer.toJson<String>(option3),
      'option4': serializer.toJson<String>(option4),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Answer>>(bool nullToAbsent) {
    return AnswersCompanion(
      answer_id: answer_id == null && nullToAbsent
          ? const Value.absent()
          : Value(answer_id),
      option1: option1 == null && nullToAbsent
          ? const Value.absent()
          : Value(option1),
      option2: option2 == null && nullToAbsent
          ? const Value.absent()
          : Value(option2),
      option3: option3 == null && nullToAbsent
          ? const Value.absent()
          : Value(option3),
      option4: option4 == null && nullToAbsent
          ? const Value.absent()
          : Value(option4),
    ) as T;
  }

  Answer copyWith(
          {int answer_id,
          String option1,
          String option2,
          String option3,
          String option4}) =>
      Answer(
        answer_id: answer_id ?? this.answer_id,
        option1: option1 ?? this.option1,
        option2: option2 ?? this.option2,
        option3: option3 ?? this.option3,
        option4: option4 ?? this.option4,
      );
  @override
  String toString() {
    return (StringBuffer('Answer(')
          ..write('answer_id: $answer_id, ')
          ..write('option1: $option1, ')
          ..write('option2: $option2, ')
          ..write('option3: $option3, ')
          ..write('option4: $option4')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      answer_id.hashCode,
      $mrjc(option1.hashCode,
          $mrjc(option2.hashCode, $mrjc(option3.hashCode, option4.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Answer &&
          other.answer_id == answer_id &&
          other.option1 == option1 &&
          other.option2 == option2 &&
          other.option3 == option3 &&
          other.option4 == option4);
}

class AnswersCompanion extends UpdateCompanion<Answer> {
  final Value<int> answer_id;
  final Value<String> option1;
  final Value<String> option2;
  final Value<String> option3;
  final Value<String> option4;
  const AnswersCompanion({
    this.answer_id = const Value.absent(),
    this.option1 = const Value.absent(),
    this.option2 = const Value.absent(),
    this.option3 = const Value.absent(),
    this.option4 = const Value.absent(),
  });
  AnswersCompanion copyWith(
      {Value<int> answer_id,
      Value<String> option1,
      Value<String> option2,
      Value<String> option3,
      Value<String> option4}) {
    return AnswersCompanion(
      answer_id: answer_id ?? this.answer_id,
      option1: option1 ?? this.option1,
      option2: option2 ?? this.option2,
      option3: option3 ?? this.option3,
      option4: option4 ?? this.option4,
    );
  }
}

class $AnswersTable extends Answers with TableInfo<$AnswersTable, Answer> {
  final GeneratedDatabase _db;
  final String _alias;
  $AnswersTable(this._db, [this._alias]);
  final VerificationMeta _answer_idMeta = const VerificationMeta('answer_id');
  GeneratedIntColumn _answer_id;
  @override
  GeneratedIntColumn get answer_id => _answer_id ??= _constructAnswerId();
  GeneratedIntColumn _constructAnswerId() {
    return GeneratedIntColumn('answer_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _option1Meta = const VerificationMeta('option1');
  GeneratedTextColumn _option1;
  @override
  GeneratedTextColumn get option1 => _option1 ??= _constructOption1();
  GeneratedTextColumn _constructOption1() {
    return GeneratedTextColumn('option1', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _option2Meta = const VerificationMeta('option2');
  GeneratedTextColumn _option2;
  @override
  GeneratedTextColumn get option2 => _option2 ??= _constructOption2();
  GeneratedTextColumn _constructOption2() {
    return GeneratedTextColumn('option2', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _option3Meta = const VerificationMeta('option3');
  GeneratedTextColumn _option3;
  @override
  GeneratedTextColumn get option3 => _option3 ??= _constructOption3();
  GeneratedTextColumn _constructOption3() {
    return GeneratedTextColumn('option3', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _option4Meta = const VerificationMeta('option4');
  GeneratedTextColumn _option4;
  @override
  GeneratedTextColumn get option4 => _option4 ??= _constructOption4();
  GeneratedTextColumn _constructOption4() {
    return GeneratedTextColumn('option4', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [answer_id, option1, option2, option3, option4];
  @override
  $AnswersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'answers';
  @override
  final String actualTableName = 'answers';
  @override
  VerificationContext validateIntegrity(AnswersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.answer_id.present) {
      context.handle(_answer_idMeta,
          answer_id.isAcceptableValue(d.answer_id.value, _answer_idMeta));
    } else if (answer_id.isRequired && isInserting) {
      context.missing(_answer_idMeta);
    }
    if (d.option1.present) {
      context.handle(_option1Meta,
          option1.isAcceptableValue(d.option1.value, _option1Meta));
    } else if (option1.isRequired && isInserting) {
      context.missing(_option1Meta);
    }
    if (d.option2.present) {
      context.handle(_option2Meta,
          option2.isAcceptableValue(d.option2.value, _option2Meta));
    } else if (option2.isRequired && isInserting) {
      context.missing(_option2Meta);
    }
    if (d.option3.present) {
      context.handle(_option3Meta,
          option3.isAcceptableValue(d.option3.value, _option3Meta));
    } else if (option3.isRequired && isInserting) {
      context.missing(_option3Meta);
    }
    if (d.option4.present) {
      context.handle(_option4Meta,
          option4.isAcceptableValue(d.option4.value, _option4Meta));
    } else if (option4.isRequired && isInserting) {
      context.missing(_option4Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {answer_id};
  @override
  Answer map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Answer.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(AnswersCompanion d) {
    final map = <String, Variable>{};
    if (d.answer_id.present) {
      map['answer_id'] = Variable<int, IntType>(d.answer_id.value);
    }
    if (d.option1.present) {
      map['option1'] = Variable<String, StringType>(d.option1.value);
    }
    if (d.option2.present) {
      map['option2'] = Variable<String, StringType>(d.option2.value);
    }
    if (d.option3.present) {
      map['option3'] = Variable<String, StringType>(d.option3.value);
    }
    if (d.option4.present) {
      map['option4'] = Variable<String, StringType>(d.option4.value);
    }
    return map;
  }

  @override
  $AnswersTable createAlias(String alias) {
    return $AnswersTable(_db, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final int student_id;
  final String student_fname;
  final String student_lname;
  final String student_mname;
  final String student_email;
  final String student_username;
  final String student_password;
  final int class_id;
  Student(
      {@required this.student_id,
      @required this.student_fname,
      @required this.student_lname,
      @required this.student_mname,
      @required this.student_email,
      @required this.student_username,
      @required this.student_password,
      @required this.class_id});
  factory Student.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Student(
      student_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}student_id']),
      student_fname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}student_fname']),
      student_lname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}student_lname']),
      student_mname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}student_mname']),
      student_email: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}student_email']),
      student_username: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}student_username']),
      student_password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}student_password']),
      class_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}class_id']),
    );
  }
  factory Student.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Student(
      student_id: serializer.fromJson<int>(json['student_id']),
      student_fname: serializer.fromJson<String>(json['student_fname']),
      student_lname: serializer.fromJson<String>(json['student_lname']),
      student_mname: serializer.fromJson<String>(json['student_mname']),
      student_email: serializer.fromJson<String>(json['student_email']),
      student_username: serializer.fromJson<String>(json['student_username']),
      student_password: serializer.fromJson<String>(json['student_password']),
      class_id: serializer.fromJson<int>(json['class_id']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'student_id': serializer.toJson<int>(student_id),
      'student_fname': serializer.toJson<String>(student_fname),
      'student_lname': serializer.toJson<String>(student_lname),
      'student_mname': serializer.toJson<String>(student_mname),
      'student_email': serializer.toJson<String>(student_email),
      'student_username': serializer.toJson<String>(student_username),
      'student_password': serializer.toJson<String>(student_password),
      'class_id': serializer.toJson<int>(class_id),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Student>>(bool nullToAbsent) {
    return StudentsCompanion(
      student_id: student_id == null && nullToAbsent
          ? const Value.absent()
          : Value(student_id),
      student_fname: student_fname == null && nullToAbsent
          ? const Value.absent()
          : Value(student_fname),
      student_lname: student_lname == null && nullToAbsent
          ? const Value.absent()
          : Value(student_lname),
      student_mname: student_mname == null && nullToAbsent
          ? const Value.absent()
          : Value(student_mname),
      student_email: student_email == null && nullToAbsent
          ? const Value.absent()
          : Value(student_email),
      student_username: student_username == null && nullToAbsent
          ? const Value.absent()
          : Value(student_username),
      student_password: student_password == null && nullToAbsent
          ? const Value.absent()
          : Value(student_password),
      class_id: class_id == null && nullToAbsent
          ? const Value.absent()
          : Value(class_id),
    ) as T;
  }

  Student copyWith(
          {int student_id,
          String student_fname,
          String student_lname,
          String student_mname,
          String student_email,
          String student_username,
          String student_password,
          int class_id}) =>
      Student(
        student_id: student_id ?? this.student_id,
        student_fname: student_fname ?? this.student_fname,
        student_lname: student_lname ?? this.student_lname,
        student_mname: student_mname ?? this.student_mname,
        student_email: student_email ?? this.student_email,
        student_username: student_username ?? this.student_username,
        student_password: student_password ?? this.student_password,
        class_id: class_id ?? this.class_id,
      );
  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('student_id: $student_id, ')
          ..write('student_fname: $student_fname, ')
          ..write('student_lname: $student_lname, ')
          ..write('student_mname: $student_mname, ')
          ..write('student_email: $student_email, ')
          ..write('student_username: $student_username, ')
          ..write('student_password: $student_password, ')
          ..write('class_id: $class_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      student_id.hashCode,
      $mrjc(
          student_fname.hashCode,
          $mrjc(
              student_lname.hashCode,
              $mrjc(
                  student_mname.hashCode,
                  $mrjc(
                      student_email.hashCode,
                      $mrjc(
                          student_username.hashCode,
                          $mrjc(student_password.hashCode,
                              class_id.hashCode))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Student &&
          other.student_id == student_id &&
          other.student_fname == student_fname &&
          other.student_lname == student_lname &&
          other.student_mname == student_mname &&
          other.student_email == student_email &&
          other.student_username == student_username &&
          other.student_password == student_password &&
          other.class_id == class_id);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> student_id;
  final Value<String> student_fname;
  final Value<String> student_lname;
  final Value<String> student_mname;
  final Value<String> student_email;
  final Value<String> student_username;
  final Value<String> student_password;
  final Value<int> class_id;
  const StudentsCompanion({
    this.student_id = const Value.absent(),
    this.student_fname = const Value.absent(),
    this.student_lname = const Value.absent(),
    this.student_mname = const Value.absent(),
    this.student_email = const Value.absent(),
    this.student_username = const Value.absent(),
    this.student_password = const Value.absent(),
    this.class_id = const Value.absent(),
  });
  StudentsCompanion copyWith(
      {Value<int> student_id,
      Value<String> student_fname,
      Value<String> student_lname,
      Value<String> student_mname,
      Value<String> student_email,
      Value<String> student_username,
      Value<String> student_password,
      Value<int> class_id}) {
    return StudentsCompanion(
      student_id: student_id ?? this.student_id,
      student_fname: student_fname ?? this.student_fname,
      student_lname: student_lname ?? this.student_lname,
      student_mname: student_mname ?? this.student_mname,
      student_email: student_email ?? this.student_email,
      student_username: student_username ?? this.student_username,
      student_password: student_password ?? this.student_password,
      class_id: class_id ?? this.class_id,
    );
  }
}

class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  final GeneratedDatabase _db;
  final String _alias;
  $StudentsTable(this._db, [this._alias]);
  final VerificationMeta _student_idMeta = const VerificationMeta('student_id');
  GeneratedIntColumn _student_id;
  @override
  GeneratedIntColumn get student_id => _student_id ??= _constructStudentId();
  GeneratedIntColumn _constructStudentId() {
    return GeneratedIntColumn('student_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _student_fnameMeta =
      const VerificationMeta('student_fname');
  GeneratedTextColumn _student_fname;
  @override
  GeneratedTextColumn get student_fname =>
      _student_fname ??= _constructStudentFname();
  GeneratedTextColumn _constructStudentFname() {
    return GeneratedTextColumn('student_fname', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _student_lnameMeta =
      const VerificationMeta('student_lname');
  GeneratedTextColumn _student_lname;
  @override
  GeneratedTextColumn get student_lname =>
      _student_lname ??= _constructStudentLname();
  GeneratedTextColumn _constructStudentLname() {
    return GeneratedTextColumn('student_lname', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _student_mnameMeta =
      const VerificationMeta('student_mname');
  GeneratedTextColumn _student_mname;
  @override
  GeneratedTextColumn get student_mname =>
      _student_mname ??= _constructStudentMname();
  GeneratedTextColumn _constructStudentMname() {
    return GeneratedTextColumn('student_mname', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _student_emailMeta =
      const VerificationMeta('student_email');
  GeneratedTextColumn _student_email;
  @override
  GeneratedTextColumn get student_email =>
      _student_email ??= _constructStudentEmail();
  GeneratedTextColumn _constructStudentEmail() {
    return GeneratedTextColumn('student_email', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _student_usernameMeta =
      const VerificationMeta('student_username');
  GeneratedTextColumn _student_username;
  @override
  GeneratedTextColumn get student_username =>
      _student_username ??= _constructStudentUsername();
  GeneratedTextColumn _constructStudentUsername() {
    return GeneratedTextColumn('student_username', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _student_passwordMeta =
      const VerificationMeta('student_password');
  GeneratedTextColumn _student_password;
  @override
  GeneratedTextColumn get student_password =>
      _student_password ??= _constructStudentPassword();
  GeneratedTextColumn _constructStudentPassword() {
    return GeneratedTextColumn('student_password', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _class_idMeta = const VerificationMeta('class_id');
  GeneratedIntColumn _class_id;
  @override
  GeneratedIntColumn get class_id => _class_id ??= _constructClassId();
  GeneratedIntColumn _constructClassId() {
    return GeneratedIntColumn(
      'class_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        student_id,
        student_fname,
        student_lname,
        student_mname,
        student_email,
        student_username,
        student_password,
        class_id
      ];
  @override
  $StudentsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'students';
  @override
  final String actualTableName = 'students';
  @override
  VerificationContext validateIntegrity(StudentsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.student_id.present) {
      context.handle(_student_idMeta,
          student_id.isAcceptableValue(d.student_id.value, _student_idMeta));
    } else if (student_id.isRequired && isInserting) {
      context.missing(_student_idMeta);
    }
    if (d.student_fname.present) {
      context.handle(
          _student_fnameMeta,
          student_fname.isAcceptableValue(
              d.student_fname.value, _student_fnameMeta));
    } else if (student_fname.isRequired && isInserting) {
      context.missing(_student_fnameMeta);
    }
    if (d.student_lname.present) {
      context.handle(
          _student_lnameMeta,
          student_lname.isAcceptableValue(
              d.student_lname.value, _student_lnameMeta));
    } else if (student_lname.isRequired && isInserting) {
      context.missing(_student_lnameMeta);
    }
    if (d.student_mname.present) {
      context.handle(
          _student_mnameMeta,
          student_mname.isAcceptableValue(
              d.student_mname.value, _student_mnameMeta));
    } else if (student_mname.isRequired && isInserting) {
      context.missing(_student_mnameMeta);
    }
    if (d.student_email.present) {
      context.handle(
          _student_emailMeta,
          student_email.isAcceptableValue(
              d.student_email.value, _student_emailMeta));
    } else if (student_email.isRequired && isInserting) {
      context.missing(_student_emailMeta);
    }
    if (d.student_username.present) {
      context.handle(
          _student_usernameMeta,
          student_username.isAcceptableValue(
              d.student_username.value, _student_usernameMeta));
    } else if (student_username.isRequired && isInserting) {
      context.missing(_student_usernameMeta);
    }
    if (d.student_password.present) {
      context.handle(
          _student_passwordMeta,
          student_password.isAcceptableValue(
              d.student_password.value, _student_passwordMeta));
    } else if (student_password.isRequired && isInserting) {
      context.missing(_student_passwordMeta);
    }
    if (d.class_id.present) {
      context.handle(_class_idMeta,
          class_id.isAcceptableValue(d.class_id.value, _class_idMeta));
    } else if (class_id.isRequired && isInserting) {
      context.missing(_class_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {student_id};
  @override
  Student map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Student.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(StudentsCompanion d) {
    final map = <String, Variable>{};
    if (d.student_id.present) {
      map['student_id'] = Variable<int, IntType>(d.student_id.value);
    }
    if (d.student_fname.present) {
      map['student_fname'] =
          Variable<String, StringType>(d.student_fname.value);
    }
    if (d.student_lname.present) {
      map['student_lname'] =
          Variable<String, StringType>(d.student_lname.value);
    }
    if (d.student_mname.present) {
      map['student_mname'] =
          Variable<String, StringType>(d.student_mname.value);
    }
    if (d.student_email.present) {
      map['student_email'] =
          Variable<String, StringType>(d.student_email.value);
    }
    if (d.student_username.present) {
      map['student_username'] =
          Variable<String, StringType>(d.student_username.value);
    }
    if (d.student_password.present) {
      map['student_password'] =
          Variable<String, StringType>(d.student_password.value);
    }
    if (d.class_id.present) {
      map['class_id'] = Variable<int, IntType>(d.class_id.value);
    }
    return map;
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(_db, alias);
  }
}

class Classe extends DataClass implements Insertable<Classe> {
  final int class_id;
  final String class_name;
  Classe({@required this.class_id, @required this.class_name});
  factory Classe.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Classe(
      class_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}class_id']),
      class_name: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}class_name']),
    );
  }
  factory Classe.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Classe(
      class_id: serializer.fromJson<int>(json['class_id']),
      class_name: serializer.fromJson<String>(json['class_name']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'class_id': serializer.toJson<int>(class_id),
      'class_name': serializer.toJson<String>(class_name),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Classe>>(bool nullToAbsent) {
    return ClassesCompanion(
      class_id: class_id == null && nullToAbsent
          ? const Value.absent()
          : Value(class_id),
      class_name: class_name == null && nullToAbsent
          ? const Value.absent()
          : Value(class_name),
    ) as T;
  }

  Classe copyWith({int class_id, String class_name}) => Classe(
        class_id: class_id ?? this.class_id,
        class_name: class_name ?? this.class_name,
      );
  @override
  String toString() {
    return (StringBuffer('Classe(')
          ..write('class_id: $class_id, ')
          ..write('class_name: $class_name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(class_id.hashCode, class_name.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Classe &&
          other.class_id == class_id &&
          other.class_name == class_name);
}

class ClassesCompanion extends UpdateCompanion<Classe> {
  final Value<int> class_id;
  final Value<String> class_name;
  const ClassesCompanion({
    this.class_id = const Value.absent(),
    this.class_name = const Value.absent(),
  });
  ClassesCompanion copyWith({Value<int> class_id, Value<String> class_name}) {
    return ClassesCompanion(
      class_id: class_id ?? this.class_id,
      class_name: class_name ?? this.class_name,
    );
  }
}

class $ClassesTable extends Classes with TableInfo<$ClassesTable, Classe> {
  final GeneratedDatabase _db;
  final String _alias;
  $ClassesTable(this._db, [this._alias]);
  final VerificationMeta _class_idMeta = const VerificationMeta('class_id');
  GeneratedIntColumn _class_id;
  @override
  GeneratedIntColumn get class_id => _class_id ??= _constructClassId();
  GeneratedIntColumn _constructClassId() {
    return GeneratedIntColumn('class_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _class_nameMeta = const VerificationMeta('class_name');
  GeneratedTextColumn _class_name;
  @override
  GeneratedTextColumn get class_name => _class_name ??= _constructClassName();
  GeneratedTextColumn _constructClassName() {
    return GeneratedTextColumn('class_name', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  @override
  List<GeneratedColumn> get $columns => [class_id, class_name];
  @override
  $ClassesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'classes';
  @override
  final String actualTableName = 'classes';
  @override
  VerificationContext validateIntegrity(ClassesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.class_id.present) {
      context.handle(_class_idMeta,
          class_id.isAcceptableValue(d.class_id.value, _class_idMeta));
    } else if (class_id.isRequired && isInserting) {
      context.missing(_class_idMeta);
    }
    if (d.class_name.present) {
      context.handle(_class_nameMeta,
          class_name.isAcceptableValue(d.class_name.value, _class_nameMeta));
    } else if (class_name.isRequired && isInserting) {
      context.missing(_class_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {class_id};
  @override
  Classe map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Classe.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ClassesCompanion d) {
    final map = <String, Variable>{};
    if (d.class_id.present) {
      map['class_id'] = Variable<int, IntType>(d.class_id.value);
    }
    if (d.class_name.present) {
      map['class_name'] = Variable<String, StringType>(d.class_name.value);
    }
    return map;
  }

  @override
  $ClassesTable createAlias(String alias) {
    return $ClassesTable(_db, alias);
  }
}

class Mark extends DataClass implements Insertable<Mark> {
  final int mark_id;
  final String subject_id;
  Mark({@required this.mark_id, @required this.subject_id});
  factory Mark.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Mark(
      mark_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}mark_id']),
      subject_id: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}subject_id']),
    );
  }
  factory Mark.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Mark(
      mark_id: serializer.fromJson<int>(json['mark_id']),
      subject_id: serializer.fromJson<String>(json['subject_id']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'mark_id': serializer.toJson<int>(mark_id),
      'subject_id': serializer.toJson<String>(subject_id),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Mark>>(bool nullToAbsent) {
    return MarksCompanion(
      mark_id: mark_id == null && nullToAbsent
          ? const Value.absent()
          : Value(mark_id),
      subject_id: subject_id == null && nullToAbsent
          ? const Value.absent()
          : Value(subject_id),
    ) as T;
  }

  Mark copyWith({int mark_id, String subject_id}) => Mark(
        mark_id: mark_id ?? this.mark_id,
        subject_id: subject_id ?? this.subject_id,
      );
  @override
  String toString() {
    return (StringBuffer('Mark(')
          ..write('mark_id: $mark_id, ')
          ..write('subject_id: $subject_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(mark_id.hashCode, subject_id.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Mark &&
          other.mark_id == mark_id &&
          other.subject_id == subject_id);
}

class MarksCompanion extends UpdateCompanion<Mark> {
  final Value<int> mark_id;
  final Value<String> subject_id;
  const MarksCompanion({
    this.mark_id = const Value.absent(),
    this.subject_id = const Value.absent(),
  });
  MarksCompanion copyWith({Value<int> mark_id, Value<String> subject_id}) {
    return MarksCompanion(
      mark_id: mark_id ?? this.mark_id,
      subject_id: subject_id ?? this.subject_id,
    );
  }
}

class $MarksTable extends Marks with TableInfo<$MarksTable, Mark> {
  final GeneratedDatabase _db;
  final String _alias;
  $MarksTable(this._db, [this._alias]);
  final VerificationMeta _mark_idMeta = const VerificationMeta('mark_id');
  GeneratedIntColumn _mark_id;
  @override
  GeneratedIntColumn get mark_id => _mark_id ??= _constructMarkId();
  GeneratedIntColumn _constructMarkId() {
    return GeneratedIntColumn('mark_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _subject_idMeta = const VerificationMeta('subject_id');
  GeneratedTextColumn _subject_id;
  @override
  GeneratedTextColumn get subject_id => _subject_id ??= _constructSubjectId();
  GeneratedTextColumn _constructSubjectId() {
    return GeneratedTextColumn('subject_id', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  @override
  List<GeneratedColumn> get $columns => [mark_id, subject_id];
  @override
  $MarksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'marks';
  @override
  final String actualTableName = 'marks';
  @override
  VerificationContext validateIntegrity(MarksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.mark_id.present) {
      context.handle(_mark_idMeta,
          mark_id.isAcceptableValue(d.mark_id.value, _mark_idMeta));
    } else if (mark_id.isRequired && isInserting) {
      context.missing(_mark_idMeta);
    }
    if (d.subject_id.present) {
      context.handle(_subject_idMeta,
          subject_id.isAcceptableValue(d.subject_id.value, _subject_idMeta));
    } else if (subject_id.isRequired && isInserting) {
      context.missing(_subject_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mark_id};
  @override
  Mark map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Mark.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MarksCompanion d) {
    final map = <String, Variable>{};
    if (d.mark_id.present) {
      map['mark_id'] = Variable<int, IntType>(d.mark_id.value);
    }
    if (d.subject_id.present) {
      map['subject_id'] = Variable<String, StringType>(d.subject_id.value);
    }
    return map;
  }

  @override
  $MarksTable createAlias(String alias) {
    return $MarksTable(_db, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final int subject_id;
  final String subject_name;
  final int class_id;
  Subject(
      {@required this.subject_id,
      @required this.subject_name,
      @required this.class_id});
  factory Subject.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Subject(
      subject_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}subject_id']),
      subject_name: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}subject_name']),
      class_id:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}class_id']),
    );
  }
  factory Subject.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Subject(
      subject_id: serializer.fromJson<int>(json['subject_id']),
      subject_name: serializer.fromJson<String>(json['subject_name']),
      class_id: serializer.fromJson<int>(json['class_id']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'subject_id': serializer.toJson<int>(subject_id),
      'subject_name': serializer.toJson<String>(subject_name),
      'class_id': serializer.toJson<int>(class_id),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Subject>>(bool nullToAbsent) {
    return SubjectsCompanion(
      subject_id: subject_id == null && nullToAbsent
          ? const Value.absent()
          : Value(subject_id),
      subject_name: subject_name == null && nullToAbsent
          ? const Value.absent()
          : Value(subject_name),
      class_id: class_id == null && nullToAbsent
          ? const Value.absent()
          : Value(class_id),
    ) as T;
  }

  Subject copyWith({int subject_id, String subject_name, int class_id}) =>
      Subject(
        subject_id: subject_id ?? this.subject_id,
        subject_name: subject_name ?? this.subject_name,
        class_id: class_id ?? this.class_id,
      );
  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('subject_id: $subject_id, ')
          ..write('subject_name: $subject_name, ')
          ..write('class_id: $class_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      subject_id.hashCode, $mrjc(subject_name.hashCode, class_id.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Subject &&
          other.subject_id == subject_id &&
          other.subject_name == subject_name &&
          other.class_id == class_id);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<int> subject_id;
  final Value<String> subject_name;
  final Value<int> class_id;
  const SubjectsCompanion({
    this.subject_id = const Value.absent(),
    this.subject_name = const Value.absent(),
    this.class_id = const Value.absent(),
  });
  SubjectsCompanion copyWith(
      {Value<int> subject_id,
      Value<String> subject_name,
      Value<int> class_id}) {
    return SubjectsCompanion(
      subject_id: subject_id ?? this.subject_id,
      subject_name: subject_name ?? this.subject_name,
      class_id: class_id ?? this.class_id,
    );
  }
}

class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  final GeneratedDatabase _db;
  final String _alias;
  $SubjectsTable(this._db, [this._alias]);
  final VerificationMeta _subject_idMeta = const VerificationMeta('subject_id');
  GeneratedIntColumn _subject_id;
  @override
  GeneratedIntColumn get subject_id => _subject_id ??= _constructSubjectId();
  GeneratedIntColumn _constructSubjectId() {
    return GeneratedIntColumn('subject_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _subject_nameMeta =
      const VerificationMeta('subject_name');
  GeneratedTextColumn _subject_name;
  @override
  GeneratedTextColumn get subject_name =>
      _subject_name ??= _constructSubjectName();
  GeneratedTextColumn _constructSubjectName() {
    return GeneratedTextColumn('subject_name', $tableName, false,
        minTextLength: 1, maxTextLength: 255);
  }

  final VerificationMeta _class_idMeta = const VerificationMeta('class_id');
  GeneratedIntColumn _class_id;
  @override
  GeneratedIntColumn get class_id => _class_id ??= _constructClassId();
  GeneratedIntColumn _constructClassId() {
    return GeneratedIntColumn(
      'class_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [subject_id, subject_name, class_id];
  @override
  $SubjectsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'subjects';
  @override
  final String actualTableName = 'subjects';
  @override
  VerificationContext validateIntegrity(SubjectsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.subject_id.present) {
      context.handle(_subject_idMeta,
          subject_id.isAcceptableValue(d.subject_id.value, _subject_idMeta));
    } else if (subject_id.isRequired && isInserting) {
      context.missing(_subject_idMeta);
    }
    if (d.subject_name.present) {
      context.handle(
          _subject_nameMeta,
          subject_name.isAcceptableValue(
              d.subject_name.value, _subject_nameMeta));
    } else if (subject_name.isRequired && isInserting) {
      context.missing(_subject_nameMeta);
    }
    if (d.class_id.present) {
      context.handle(_class_idMeta,
          class_id.isAcceptableValue(d.class_id.value, _class_idMeta));
    } else if (class_id.isRequired && isInserting) {
      context.missing(_class_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {subject_id};
  @override
  Subject map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Subject.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(SubjectsCompanion d) {
    final map = <String, Variable>{};
    if (d.subject_id.present) {
      map['subject_id'] = Variable<int, IntType>(d.subject_id.value);
    }
    if (d.subject_name.present) {
      map['subject_name'] = Variable<String, StringType>(d.subject_name.value);
    }
    if (d.class_id.present) {
      map['class_id'] = Variable<int, IntType>(d.class_id.value);
    }
    return map;
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $QuestionsTable _questions;
  $QuestionsTable get questions => _questions ??= $QuestionsTable(this);
  $AnswersTable _answers;
  $AnswersTable get answers => _answers ??= $AnswersTable(this);
  $StudentsTable _students;
  $StudentsTable get students => _students ??= $StudentsTable(this);
  $ClassesTable _classes;
  $ClassesTable get classes => _classes ??= $ClassesTable(this);
  $MarksTable _marks;
  $MarksTable get marks => _marks ??= $MarksTable(this);
  $SubjectsTable _subjects;
  $SubjectsTable get subjects => _subjects ??= $SubjectsTable(this);
  StudentDao _studentDao;
  StudentDao get studentDao => _studentDao ??= StudentDao(this as AppDatabase);
  ClassesDao _classesDao;
  ClassesDao get classesDao => _classesDao ??= ClassesDao(this as AppDatabase);
  MarksDao _marksDao;
  MarksDao get marksDao => _marksDao ??= MarksDao(this as AppDatabase);
  SubjectDao _subjectDao;
  SubjectDao get subjectDao => _subjectDao ??= SubjectDao(this as AppDatabase);
  QuestionDao _questionDao;
  QuestionDao get questionDao =>
      _questionDao ??= QuestionDao(this as AppDatabase);
  AnswersDao _answersDao;
  AnswersDao get answersDao => _answersDao ??= AnswersDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables =>
      [questions, answers, students, classes, marks, subjects];
}
