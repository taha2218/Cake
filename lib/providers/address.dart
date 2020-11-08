import 'package:flutter/material.dart';

class AddressProvider with ChangeNotifier {

  String _addressLine1 = "House No, Block No, Street Name";
  String _addressLine2 = "Road Name, Landmark";
  String _addressLine3 = "District, City";

  String get addressLine1 {
    return _addressLine1;
  }

  String get addressLine2 {
    return _addressLine2;
  }

  String get addressLine3 {
    return _addressLine3;
  }

  set addressLine1 (String address) {
    this._addressLine1 = address;
    notifyListeners();
  }

  set addressLine2 (String address) {
    this._addressLine2 = address;
    notifyListeners();
  }

  set addressLine3 (String address) {
    this._addressLine3 = address;
    notifyListeners();
  }

}