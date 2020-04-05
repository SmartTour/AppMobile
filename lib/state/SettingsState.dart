import 'package:flutter/cupertino.dart';
import 'package:smart_tour_mobile/services/LocationService.dart';

class SettingsState extends ChangeNotifier {
  bool darkMode = false;
  bool bluetoothIsEnable = false;
  bool locationIsEnable = false;
  int locationPermission = 0;

  void changeDarkMode(bool value) {
    if (darkMode != value) {
      darkMode = value;
      notifyListeners();
    }
  }

  void updateBluetoothIsEnable() {
    bool value = false;
    if (bluetoothIsEnable != value) {
      bluetoothIsEnable = value;
      notifyListeners();
    }
  }

  Future<void> updateLocationService() async {
    await updateLocationPermission();
    if (this.locationPermission == 0) {
      await updateLocationIsEnable();
    }
  }

  Future<void> updateLocationIsEnable() async {
    bool value = await LocationService.isEnable();
    if (locationIsEnable != value) {
      locationIsEnable = value;
      notifyListeners();
    }
  }

  Future<void> updateLocationPermission() async {
    int value = await LocationService.hasPermission();
    if (locationPermission != value) {
      locationPermission = value;
      notifyListeners();
    }
  }
}
