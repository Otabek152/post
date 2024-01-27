import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://qutb.uz/api")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/ads")
  Future postAds(@Body() Map<String, dynamic> data);
  @POST("/auth/register")
  Future postRegister(@Body() Map<String, dynamic> data);
}
