import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherRepository {
  final Dio _dio = Dio();
  final String _apiKey = 'YOUR_API_KEY'; // استبدله بمفتاحك

  Future<Weather> fetchWeather(String city) async {
    final response = await _dio.get(
      'https://api.openweathermap.org/data/2.5/weather',
      queryParameters: {
        'q': city,
        'appid': _apiKey,
        'units': 'metric',
      },
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(response.data);
    } else {
      throw Exception('فشل في جلب البيانات');
    }
  }
}
