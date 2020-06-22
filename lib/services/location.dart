import 'package:geolocator/geolocator.dart';

void getLocation() async {
  try {
    Geolocator geolocator = Geolocator();
    GeolocationStatus geolocatorPerm =
        await geolocator.checkGeolocationPermissionStatus();
    print(geolocatorPerm);
    Position position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('This is my location:');
    print(position);
  } catch (error) {
    print(error);
  }
}
