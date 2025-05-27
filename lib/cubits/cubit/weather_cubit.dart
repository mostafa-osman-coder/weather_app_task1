import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_task/models/weather_model.dart';
import 'package:weather_app_task/repositories/weather_repository.dart';


part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;

  WeatherCubit(this.repository) : super(WeatherInitial());

  Future<void> getWeather(String city) async {
    try {
      emit(WeatherLoading());
      final weather = await repository.fetchWeather(city);
      emit(WeatherLoaded(weather));
    } catch (_) {
      emit(WeatherError('حدث خطأ أثناء جلب البيانات'));
    }
  }
}