class Pokemon {
  int? id;
  String? num;
  String? name;
  String? img;
  String? height;
  String? weight;
  Pokemon({
    required this.id,
    required this.num,
    required this.img,
    required this.name,
    required this.height,
    required this.weight,
  });
  factory Pokemon.fromjson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] ?? 0,
      num: json['num'] ?? "",
      img: json['img'] ?? "",
      name: json['name'] ?? "",
      height: json['height'] ?? "",
      weight: json['weight'] ?? "",
    );
  }
}
