import 'package:edufy/data/moor_db.dart';
import 'package:edufy/events/edufy_event.dart';

class setLevels extends edufyEvent {
  List<Level> levelList;

  setLevels(List<Level> levels) {
    levelList.addAll(levels);
  }
}
