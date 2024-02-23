import 'dart:convert';

class CoffeeModel {
  String id;
  String name;
  double basePrice;
  CoffeeModel({
    required this.id,
    required this.name,
    required this.basePrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'basePrice': basePrice,
    };
  }

  factory CoffeeModel.fromMap(Map<String, dynamic> map) {
    return CoffeeModel(
      id: map['id'] as String,
      name: map['name'] as String,
      basePrice: map['basePrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoffeeModel.fromJson(String source) =>
      CoffeeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
