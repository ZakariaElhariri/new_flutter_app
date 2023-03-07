import 'package:flutter_application_2/models/product_model.dart';

class CartModel {
  final ProductModel product;
  final int numOfItem;

  CartModel({required this.product, required this.numOfItem});
}

List<CartModel> cartItems = [];