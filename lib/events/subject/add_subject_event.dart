import 'package:edufy/data/moor_db.dart';
import 'package:edufy/events/edufy_event.dart';

class addSubject extends edufyEvent{
 
  Subject newSubject;

  addSubject( Subject subject){
    newSubject = subject;
  }
}