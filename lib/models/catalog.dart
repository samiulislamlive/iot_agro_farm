import 'dart:convert';

class CatalogModel{
  static List<Item> items = [
    Item(
        id: 1,
        name: "Temperature",
        desc: "Temperature of the farm",
        image:
        "https://media.istockphoto.com/vectors/thermometer-illustration-vector-in-flat-design-vector-id1184482788?k=6&m=1184482788&s=612x612&w=0&h=RGn9UlYCeRBqLVqAjVGyuSgUd4ZRdMUJk4AT9ZJhUX8="
    )

  ];
}



class Item{
  final int id;
  final String name;
  final String desc;
  final String image;

  Item({required this.id,required this.name, required this.desc, required this.image});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      image: map["image"],
    );
  }

  toMap() => {
    "id" : id,
    "name" : name,
    "desc" : desc,
    "image" : image,
  };


}

