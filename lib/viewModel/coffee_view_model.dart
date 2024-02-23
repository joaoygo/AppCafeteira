import 'dart:convert';

class CoffeeViewModel {
  String? idItem;
  String name;
  int amount;
  String size;
  double price;
  String sugar;
  CoffeeViewModel({
    this.idItem,
    required this.name,
    required this.amount,
    required this.size,
    required this.price,
    required this.sugar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idItem': idItem,
      'name': name,
      'amount': amount,
      'size': size,
      'price': price,
      'sugar': sugar,
    };
  }

  factory CoffeeViewModel.fromMap(Map<String, dynamic> map) {
    return CoffeeViewModel(
      idItem: map['idItem'] as String,
      name: map['name'] as String,
      amount: map['amount'] as int,
      size: map['size'] as String,
      price: map['price'] as double,
      sugar: map['sugar'] as String,
    );
  }
  String toJson() => json.encode(toMap());

  factory CoffeeViewModel.fromJson(String source) =>
      CoffeeViewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CoffeeViewModel(name: $name, amount: $amount, size: $size, price: $price, sugar: $sugar)';
  }
}
