import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

class WeatherModel {
  String api = "20d9b1b93c0c4b73b474a31e9352f790";

  Future<dynamic> getLocationbycity(String city) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api&units=metric';

    NetworkingHelper networkinghelper = NetworkingHelper(url);
    return await networkinghelper.getData();
  }

  Future<dynamic> getlocationdata() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api&units=metric';

    NetworkingHelper networkinghelper = NetworkingHelper(url);
    var locationdata = await networkinghelper.getData();
    return locationdata;
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
    if (temp > 25 && temp < 100) {
      return 'It\'s 🍦 time';
    } else if (temp > 20 && temp <= 25) {
      return 'Time for shorts and 👕';
    } else if (temp > 10 && temp <= 20) {
      return 'You\'ll need 🧣 and 🧤';
    } else if (temp == 101) {
      return 'Something went wrong';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
