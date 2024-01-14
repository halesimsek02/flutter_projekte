import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String itemName;
  final int quantity;

  CartItem({required this.itemName, required this.quantity});
}

class CartModel extends ChangeNotifier {
  int buchungDruck = 0;
  int schulungDruck = 0;
  int buchungScan = 0;
  int schulungScan = 0;
  int schulungTextil = 0;
  int buchungTextil = 0;
  int schulungLaser = 0;
  int buchungLaser = 0;
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItem {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearAllItems() {
    _items.clear();
    notifyListeners();
  }

//3D Druck
  void addBuchungDruck(int quantity) {
    buchungDruck += quantity;
    notifyListeners();
  }

  void removeBuchungDruck() {
    if (buchungDruck > 0) {
      buchungDruck--;
      notifyListeners();
    }
  }

  void clearBuchungDruck() {
    buchungDruck = 0;
    notifyListeners();
  }

  void clearSchulungDruck() {
    schulungDruck = 0;
    notifyListeners();
  }

  void addSchulungDruck(int quantity) {
    schulungDruck += quantity;
    notifyListeners();
  }

  void addDruckSchulung() {
    schulungDruck++;
    notifyListeners();
  }

  void addDruckBuchung() {
    buchungDruck++;
    notifyListeners();
  }

  void removeSchulungDruck() {
    if (schulungDruck > 0) {
      schulungDruck--;
      notifyListeners();
    }
  }

  //Scan
  void addBuchungScan(int quantity) {
    buchungScan += quantity;
    notifyListeners();
  }

  void removeBuchungScan() {
    if (buchungScan > 0) {
      buchungScan--;
      notifyListeners();
    }
  }

  void clearBuchungScan() {
    buchungScan = 0;
    notifyListeners();
  }

  void clearSchulungScan() {
    schulungScan = 0;
    notifyListeners();
  }

  void addSchulungScan(int quantity) {
    schulungScan += quantity;
    notifyListeners();
  }

  void addScanSchulung() {
    schulungScan++;
    notifyListeners();
  }

  void addScanBuchung() {
    buchungScan++;
    notifyListeners();
  }

  void removeSchulungScan() {
    if (schulungScan > 0) {
      schulungScan--;
      notifyListeners();
    }
  }

  //Textil
  void addBuchungTextil(int quantity) {
    buchungTextil += quantity;
    notifyListeners();
  }

  void removeBuchungTextil() {
    if (buchungTextil > 0) {
      buchungTextil--;
      notifyListeners();
    }
  }

  void clearBuchungTextil() {
    buchungTextil = 0;
    notifyListeners();
  }

  void clearSchulungTextil() {
    schulungTextil = 0;
    notifyListeners();
  }

  void addSchulungTextil(int quantity) {
    schulungTextil += quantity;
    notifyListeners();
  }

  void addTextilSchulung() {
    schulungTextil++;
    notifyListeners();
  }

  void addTextilBuchung() {
    buchungTextil++;
    notifyListeners();
  }

  void removeSchulungTextil() {
    if (schulungTextil > 0) {
      schulungTextil--;
      notifyListeners();
    }
  }

//Laser
  void addBuchungLaser(int quantity) {
    buchungLaser += quantity;
    notifyListeners();
  }

  void removeBuchungLaser() {
    if (buchungLaser > 0) {
      buchungLaser--;
      notifyListeners();
    }
  }

  void clearBuchungLaser() {
    buchungLaser = 0;
    notifyListeners();
  }

  void clearSchulungLaser() {
    schulungLaser = 0;
    notifyListeners();
  }

  void addSchulungLaser(int quantity) {
    schulungLaser += quantity;
    notifyListeners();
  }

  void addLaserSchulung() {
    schulungLaser++;
    notifyListeners();
  }

  void addLaserBuchung() {
    buchungLaser++;
    notifyListeners();
  }

  void removeSchulungLaser() {
    if (schulungLaser > 0) {
      schulungLaser--;
      notifyListeners();
    }
  }

//all
  void clearAll() {
    schulungDruck = 0;
    buchungDruck = 0;
    schulungScan = 0;
    buchungScan = 0;
    schulungTextil = 0;
    buchungTextil = 0;
    schulungLaser = 0;
    buchungLaser = 0;
    notifyListeners();
  }

  int get totalItems =>
      buchungDruck +
      schulungDruck +
      buchungScan +
      schulungScan +
      buchungTextil +
      schulungTextil +
      buchungLaser +
      schulungLaser;
}
