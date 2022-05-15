import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/cupertino.dart';

const String API_KEY = "ebd8436f4131c2c7c42f5fb3063e5b6c";
const String openWeatherMapURL =
    "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  late Location _location;
  late NetworkHelper _networkHelper;

  WeatherModel() {
    _location = Location();
    _networkHelper = NetworkHelper(null);
  }

  Future<dynamic> getCityWeather(String cityName) async {
    _networkHelper.url =
        "$openWeatherMapURL?q=$cityName&appid=$API_KEY&units=metric";
    return await _networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    await _location.getCurrentLocation();

    _networkHelper.url =
        "$openWeatherMapURL?lat=${_location.latitude}&lon=${_location.longitude}&appid=$API_KEY&units=metric";

    return await _networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
