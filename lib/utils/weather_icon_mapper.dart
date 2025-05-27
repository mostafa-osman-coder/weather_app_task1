import 'package:flutter/material.dart';

IconData getWeatherIcon(String description) {
  description = description.toLowerCase();

  if (description.contains('cloud')) return Icons.cloud;
  if (description.contains('rain')) return Icons.water_drop;
  if (description.contains('clear')) return Icons.wb_sunny;
  if (description.contains('storm') || description.contains('thunder')) return Icons.flash_on;
  if (description.contains('snow')) return Icons.ac_unit;
  if (description.contains('mist') || description.contains('fog')) return Icons.blur_on;

  return Icons.wb_cloudy; // fallback
}
