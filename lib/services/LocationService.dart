import 'package:location/location.dart';

// enum PermissionStatus {
//   /// The permission to use location services has been granted.
//   granted,
//   // The permission to use location services has been denied by the user. May have been denied forever on iOS.
//   denied,
//   // The permission to use location services has been denied forever by the user. No dialog will be displayed on permission request.
//   deniedForever
// }

class LocationService {
  static Location location = new Location();
  static Future<bool> serviceAvailable() async {
    int levelPermission = await LocationService.hasPermission();
    print('levelPermission:' + levelPermission.toString());
    if (levelPermission != 0) {
      return false;
    }
    bool isEnable = await LocationService.isEnable();

    if (!isEnable) return false;
    return true;
  }

  static Future<int> hasPermission() async {
    PermissionStatus permissionState;

    permissionState = await location.hasPermission();

    if (permissionState.index != 0) {
      permissionState = await location.requestPermission();
    }
    return permissionState.index;
  }

  static Future<bool> isEnable() async {
    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return false;
      }
    }
    return true;
  }
}
