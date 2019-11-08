class Video {
  int id;
  String image;
  String url;
  int duration;

  String title;
  bool favoriteStatus;

  Video(
      {this.id,
      this.image,
      this.url,
      this.duration,
      this.title,
      this.favoriteStatus});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    url = json['url'];
    duration = json['duration'];
    title = json['title'];
    favoriteStatus = json['favorite_status'];
  }

  Video.fromSql(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    url = json['url'];
    duration = json['duration'];
    title = json['title'];
    favoriteStatus = json['favorite_status'] == 'true';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['url'] = this.url;
    data['duration'] = this.duration;
    data['title'] = this.title;
    data['favorite_status'] = this.favoriteStatus;
    return data;
  }
}

class Note {
  int _pointID;
  String _image;
  int _contractId;
  int _publicationId;
  double _pointLng;
  double _pointLat;

  Note(this._pointID, this._image, this._contractId, this._publicationId,
      this._pointLng, this._pointLat);

  int get pointID => _pointID;

  String get image => _image;

  int get contractId => _contractId;

  int get publicationId => _publicationId;

  double get pointLng => _pointLng;

  double get pointLat => _pointLat;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['pointid'] = _pointID;
    map['image'] = _image;
    map['contractId'] = _contractId;
    map['publicationId'] = _publicationId;
    map['pointLng'] = _pointLng;
    map['pointLat'] = _pointLat;
    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    this._publicationId = map['publicationId'];
    this._pointID = map['pointid'];
    this._image = map['image'];
    this._contractId = map['contractId'];
    this._pointLng = map['pointLng'];
    this._pointLat = map['pointLat'];
  }

  Note.fromSql(Map<String, dynamic> map) {
    this._publicationId = map['publicationId'];
    this._pointID = map['pointid'];
    this._image = map['image'];
    this._contractId = map['contractId'];
    this._pointLng = map['pointLng'];
    this._pointLat = map['pointLat'];
  }
}
