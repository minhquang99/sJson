class Champ {
  String? id;
  String? name;
  String? bundle;
  List<String>? origins;
  int? cost;
  String? avatar;
  List<int>? health;
  int? dps;

  Champ(
      {required this.id,
      required this.name,
      required this.bundle,
      required this.origins,
      required this.cost,
      required this.avatar,
      required this.health,
      required this.dps});

  Champ.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bundle = json['bundle'];
    origins = json['origins'].cast<String>();
    cost = json['cost'];
    avatar = json['avatar'];
    health = json['health'].cast<int>();
    dps = json['dps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bundle'] = this.bundle;
    data['origins'] = this.origins;
    data['cost'] = this.cost;
    data['avatar'] = this.avatar;
    data['health'] = this.health;
    data['dps'] = this.dps;
    return data;
  }
}
//class Champ {
//   int? userId;
//   int? id;
//   String? title;
//   String? body;

//   Champ(
//       {required this.userId,
//       required this.id,
//       required this.title,
//       required this.body});

//   Champ.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     id = json['id'];
//     title = json['title'];
//     body = json['body'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['body'] = this.body;
//     return data;
//   }
// }
