import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';

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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
