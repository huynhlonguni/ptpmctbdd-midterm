import 'coffee.dart';

class Order {
  final Coffee coffee;
  final int quantity;
  final String shot;
  final String temperature;
  final String size;
  final String ice;
  final double price;
  final String address;
  final DateTime time;
  final bool isCompleted;

  Order({
    required this.coffee,
    required this.quantity,
    required this.shot,
    required this.temperature,
    required this.size,
    required this.ice,
    required this.price,
    required this.address,
    required this.time,
    required this.isCompleted,
  });

  Order copyWith({
    Coffee? coffee,
    int? quantity,
    String? shot,
    String? temperature,
    String? size,
    String? ice,
    double? price,
    String? address,
    DateTime? time,
    bool? isCompleted,
  }) {
    return Order(
      coffee: coffee ?? this.coffee,
      quantity: quantity ?? this.quantity,
      shot: shot ?? this.shot,
      temperature: temperature ?? this.temperature,
      size: size ?? this.size,
      ice: ice ?? this.ice,
      price: price ?? this.price,
      address: address ?? this.address,
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
