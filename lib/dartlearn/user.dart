class User {
  String name;
  String email;

  User({this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {    
    this.name = json['name'];
    this.email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }

}
