import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_task/cubits/cubit/weather_cubit.dart';


class HomeScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تطبيق الطقس')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              onSubmitted: (value) {
                context.read<WeatherCubit>().getWeather(value);
              },
              decoration: const InputDecoration(
                labelText: 'أدخل اسم المدينة',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
  final weather = state.weather;
  final forecast = state.forecast;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('المدينة: ${weather.city}'),
      Text('الحرارة: ${weather.temp}°C'),
      Text('الوصف: ${weather.description}'),
      const SizedBox(height: 16),
      const Text('توقعات الأيام القادمة:'),
      const SizedBox(height: 8),
      SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: forecast.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final day = forecast[index];
            return Container(
              width: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${day.temp}°C', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(day.description),
                ],
              ),
            );
          },
        ),
      )
    ],
  );
} else if (state is WeatherError) {
                  return Text(state.message, style: const TextStyle(color: Colors.red));
                }
                return const Text('أدخل المدينة أولاً');
              },
            ),
          ],
        ),
      ),
    );
  }
}
