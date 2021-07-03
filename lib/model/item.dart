class Item {
  String id;
  String name;
  String des;
  String img;

  Item(
      {required this.id,
      required this.name,
      required this.des,
      required this.img});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json['id'], name: json['name'], des: json['des'], img: json['img']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['des'] = this.des;
    data['img'] = this.img;
    return data;
  }
}
