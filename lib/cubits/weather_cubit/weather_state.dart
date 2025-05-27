part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherLoaded extends WeatherState {
  final Weather weather;
  final List<Weather> forecast;

  WeatherLoaded(this.weather, this.forecast);

  @override
  List<Object> get props => [weather, forecast];
}
class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);

  @override
  List<Object> get props => [message];
}