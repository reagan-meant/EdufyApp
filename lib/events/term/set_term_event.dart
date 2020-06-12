import 'package:edufy/data/moor_db.dart';
import 'package:edufy/events/edufy_event.dart';

class setTerms extends edufyEvent {
  List<Term> termList;

  setTerms(List<Term> terms) {
    termList.addAll(terms);
  }
}
