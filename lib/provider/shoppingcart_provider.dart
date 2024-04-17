//Ruth Djusthine E. Tenifrancia
//U3L

//dart file that contains all the function that
//are to be done in the shopping cart

import 'package:flutter/material.dart';
import '/model/Item.dart';

class ShoppingCart with ChangeNotifier {
  final List<Item> _shoppingList = [];
  double cartTotal = 0;

  List<Item> get cart => _shoppingList;

  void addItem(Item item) {
    _shoppingList.add(item);
    cartTotal += item.price;
    notifyListeners();
  }

  void removeAll() {
    _shoppingList.clear();
    cartTotal = 0;
    notifyListeners();
  }

  void removeItem(String name) {
    for (int i = 0; i < _shoppingList.length; i++) {
      if (_shoppingList[i].name == name) {
        cartTotal -= _shoppingList[i].price;
        _shoppingList.remove(_shoppingList[i]);
        break;
      }
    }
    notifyListeners();
  }
}
