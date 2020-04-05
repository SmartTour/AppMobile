import 'dart:math';

class BeaconHelper {
  static int getDistance(int rssi, int measuredPower) {
    int environmentalFactor = 2; //range 2-4
    return pow(10, (measuredPower - rssi) / 10 * environmentalFactor);
  }
}
