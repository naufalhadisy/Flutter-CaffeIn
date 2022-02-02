class Menu {
  String image;
  String? id;
  String name;
  String desc;
  String price;

  Menu({
    this.id,
    required this.image,
    required this.name,
    required this.desc,
    required this.price,
  });

  Menu.fromJson(Map<String, dynamic> json, this.id)
      : name = json['name'] as String,
        image = json['image'] as String,
        desc = json['desc'] as String,
        price = json['price'] as String;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "desc": desc,
      "image": image,
      "price": price
    };
  }
}
