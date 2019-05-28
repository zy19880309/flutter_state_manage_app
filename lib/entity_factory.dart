
import 'package:state_manage_app/dartlearn/person_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "PersonEntity") {
      return PersonEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}