
import 'package:post_project/domen/map/app_lat_long.dart';

abstract class AppLocation {
 Future<AppLatLong> getCurrentLocation();

 Future<bool> requestPermission();

 Future<bool> checkPermission();
}