
import 'package:advance_ui_assignment/Q61_advance_ui/model/food_model.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Food> _cart = [];
  List<Food> get cart => _cart;

   
  void addToCart(Food food) {
    _cart.add(food);
    notifyListeners();
  }
}
