import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async {
    try {
      Geolocator geolocator = Geolocator();
      GeolocationStatus geolocatorPerm =
          await geolocator.checkGeolocationPermissionStatus();
      print(geolocatorPerm);
      Position position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print('This is my location:');
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (error) {
      print(error);
    }
  }
}
