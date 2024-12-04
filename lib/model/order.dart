// model/order.dart
import 'coffee.dart';

class Order {
  final Coffee coffee;
  final int quantity;
  final String shot;
  final String temperature;
  final String size;
  final String ice;
  final double price;

  Order({
    required this.coffee,
    required this.quantity,
    required this.shot,
    required this.temperature,
    required this.size,
    required this.ice,
    required this.price,
  });
}
