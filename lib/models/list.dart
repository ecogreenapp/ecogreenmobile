import 'package:flutter/material.dart';

import 'waste.dart';

class ListWaste extends ChangeNotifier {
  // list of waste for sale
  final List<Waste> wasteBank = [
    // bottle plastic
    Waste(
      nama: 'Botol Bekas',
      jenis: 'Anorganik',
      imagePath: 'lib/images/water-bottle',
    ),
    Waste(
      nama: 'Botol Bekas',
      jenis: 'Anorganik',
      imagePath: 'lib/images/water-bottle',
    ),
    Waste(
      nama: 'Botol Bekas',
      jenis: 'Anorganik',
      imagePath: 'lib/images/water-bottle',
    ),
  ];

  // list of waste in user list
  List<Waste> userCart = [];

  // get waste for sale
  List<Waste> getWasteList() {
    return wasteBank;
  }

  // get cart
  List<Waste> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Waste waste) {
    userCart.add(waste);
  }

  // remove waste from cart
  void removeFromCart(Waste waste) {
    userCart.remove(waste);
  }
}
