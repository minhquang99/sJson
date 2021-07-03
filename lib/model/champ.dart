class Champ {
  String id;
  String name;
  String skill;
  List<String> origins;
  int cost;
  String wallpaper;
  String avatar;
  String des1;
  String des2;
  String des3;
  String item1;
  String item2;
  String item3;

  Champ(
      {required this.id,
      required this.name,
      required this.skill,
      required this.origins,
      required this.cost,
      required this.wallpaper,
      required this.avatar,
      required this.des1,
      required this.des2,
      required this.des3,
      required this.item1,
      required this.item2,
      required this.item3});

  factory Champ.fromJson(Map<String, dynamic> json) => Champ(
      id: json['id'],
      name: json['name'],
      skill: json['skill'],
      origins: json['origins'].cast<String>(),
      cost: json['cost'],
      wallpaper: json['wallpaper'],
      avatar: json['avatar'],
      des1: json['des1'],
      des2: json['des2'],
      des3: json['des3'],
      item1: json['item1'],
      item2: json['item2'],
      item3: json['item3']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['skill'] = this.skill;
    data['origins'] = this.origins;
    data['cost'] = this.cost;
    data['wallpaper'] = this.wallpaper;
    data['avatar'] = this.avatar;
    data['des1'] = this.des1;
    data['des2'] = this.des2;
    data['des3'] = this.des3;
    data['item1'] = this.item1;
    data['item2'] = this.item2;
    data['item3'] = this.item3;
    return data;
  }
}
