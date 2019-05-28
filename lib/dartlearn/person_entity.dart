import 'dart:convert';

void main() {
  String str = "{\"name\": \"John Smith\",\"email\": \"john@example.com\"}";
  Map json = jsonDecode(str);
  PersonEntity personEntity = PersonEntity.fromJson(json);
  print(personEntity.name);
  print(personEntity.toJson());
}

class PersonEntity {
  String name;
  String email;

  PersonEntity({this.name, this.email});

  PersonEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
