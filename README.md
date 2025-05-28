# 🌦️ Weather App (Task 1)

A Flutter application that displays the current weather and a 5-day forecast using the OpenWeatherMap API. It supports offline mode by caching data using SharedPreferences, allowing users to view previously fetched data without an internet connection

---


## 🧰 Features


- 🔍 Search for any city to view its weather.
- 🌡️ Display current temperature, weather condition, and wind speed.
- 🖼️ Clean and responsive UI.
- 📲 Supports Android and iOS.
- Offline support: shows cached data when offline
- Loading, error, and fallback UI handling
- View a 5-day weather forecast

---
## 🚀 Getting Started

### ✅ Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- API Key from [OpenWeatherMap](https://openweathermap.org/api)

### 📦 Dependencies

```yaml
dependencies:
  bloc: ^9.0.0
  cupertino_icons: ^1.0.8
  dio: ^5.8.0+1
  equatable: ^2.0.7
  flutter:
    sdk: flutter
  flutter_bloc: ^9.1.1
  intl: ^0.20.2
  shared_preferences: ^2.5.3

---

🛠️ Setup

Clone the repository:

git clone https://github.com/mostafa-osman-coder/weather_app_task1.git
cd weather_app_task1

Create a .env file in the root directory and add your API key:

OPENWEATHERMAP_API_KEY=your_api_key_here

Install dependencies and run the app:

flutter pub get
flutter run
---

📂 Project Structure

lib/
├── models/                # Data models
├── repositories/          # API logic
├── cubits/                # Bloc-based state management
├── screens/               # UI screens
│   └── weather_screen.dart
└── main.dart


























## ⚙️ Getting Started
1. **Clone the repository:**
```bash
git clone https://github.com/mostafa-osman-coder/weather_app_task1.git

cd weather_app_task1

2. Install dependencies: 

. flutter pub get

3. Run the app:

. flutter run

📦 Packages Used
. dio: For making HTTP requests

. shared_preferences: For local data caching

. flutter_bloc and equatable: For state management using Cubit

🧠 Project Structure

. models/weather_model.dart: Weather data model

. repositories/weather_repository.dart: Handles API calls

. services/cache_service.dart: Caches weather data locally

. cubit/weather_cubit.dart: Manages app state using Cubit








