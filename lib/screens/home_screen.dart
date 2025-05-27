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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('المدينة: ${weather.city}'),
                      Text('الحرارة: ${weather.temp}°C'),
                      Text('الوصف: ${weather.description}'),
                      Text('الرياح: ${weather.wind} م/ث'),
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
