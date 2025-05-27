class Weather {
  final String city;
  final double temp;
  final String description;
  final double wind;
  final double tempMin;
  final double tempMax;

  Weather({
    required this.city,
    required this.temp,
    required this.description,
    required this.wind,
    required this.tempMin,
    required this.tempMax,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      temp: json['main']['temp'],
      description: json['weather'][0]['description'],
      wind: json['wind']['speed'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
    );
  }
}
