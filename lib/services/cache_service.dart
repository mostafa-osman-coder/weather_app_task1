import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/weather_model.dart';

class CacheService {
  static const String _key = 'weather_cache';

  Future<void> saveWeather(Weather weather) async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode({
      'city': weather.city,
      'temp': weather.temp,
      'description': weather.description,
      'wind': weather.wind,
      'tempMin': weather.tempMin,
      'tempMax': weather.tempMax,
    });
    await prefs.setString(_key, data);
  }

  Future<Weather?> getCachedWeather() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_key);
    if (jsonStr == null) return null;

    final json = jsonDecode(jsonStr);
    return Weather(
      city: json['city'],
      temp: json['temp'],
      description: json['description'],
      wind: json['wind'],
      tempMin: json['tempMin'],
      tempMax: json['tempMax'],
    );
  }
}
