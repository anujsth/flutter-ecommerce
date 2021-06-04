import 'package:flutter/foundation.dart';

class CatalogModel {
  static List<Item> item;

  static Item getById(int id) =>
      item.firstWhere((element) => element.id == id, orElse: null);

  static Item getByPos(int pos) => item[pos];
}

class Item {
  final int id;
  final String image;
  final String desc;
  final String name;
  final num price;
  final String color;

  Item({this.id, this.image, this.desc, this.name, this.price, this.color});
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      image: map['image'],
      desc: map['desc'],
      name: map['name'],
      price: map['price'],
      color: map['color'],
    );
  }

  toMap() => {
        'id': id,
        'name': name,
        'desc': desc,
        'price': price,
        'color': color,
        'image': image
      };
}
