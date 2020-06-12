import 'package:edufy/data/moor_db.dart';
import 'package:edufy/events/edufy_event.dart';

class setClass extends edufyEvent {
  List<Classe> classList;

  setClasses(List<Classe> classes) {
    classList.addAll(classes);
  }
}
