import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherRepository {
  final Dio _dio = Dio();
  final String _apiKey = '515efa1006d0ed6fec3cbc6769e92b27'; 

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
  Future<List<Weather>> fetchFiveDayForecast(String city) async {
  final response = await _dio.get(
    'https://api.openweathermap.org/data/2.5/forecast',
    queryParameters: {
      'q': city,
      'appid': _apiKey,
      'units': 'metric',
    },
  );

  if (response.statusCode == 200) {
    final List list = response.data['list'];
    return list.where((e) => list.indexOf(e) % 8 == 0).map((json) {
      return Weather.fromJson(json..['name'] = city);
    }).toList();
  } else {
    throw Exception('فشل في جلب التوقعات');
  }
}
}
