import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_weatherapp/WeatherModel.dart';

class WeatherRepo{
  Future<WeatherModel> getWeather(String city) async{
    final result = await http.Client().get("http://api.openweathermap.org/data/2.5/weather?q=$city&appid=3fe93b76185553fd42615fef4410c6d6");

    if(result.statusCode != 200)
      throw Exception();

    return parsedJson(result.body);
  }
   WeatherModel parsedJson(final response){
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);
   }
}