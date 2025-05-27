import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_task/models/weather_model.dart';
import 'package:weather_app_task/repositories/weather_repository.dart';
import 'package:weather_app_task/services/cache_service.dart';


part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;
  final _cache = CacheService();

  WeatherCubit(this.repository) : super(WeatherInitial());

Future<void> getWeather(String city) async {
  try {
    emit(WeatherLoading());
    final weather = await repository.fetchWeather(city);
    final forecast = await repository.fetchFiveDayForecast(city);
    await _cache.saveWeather(weather);
    emit(WeatherLoaded(weather, forecast));
  } catch (_) {
    final cached = await _cache.getCachedWeather();
    if (cached != null) {
      emit(WeatherLoaded(cached, [])); 
    } else {
      emit(WeatherError('فشل الاتصال ولا يوجد بيانات محفوظة.'));
    }
  }
}
}