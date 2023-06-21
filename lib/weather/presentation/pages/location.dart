import 'package:flutter/material.dart';
import 'package:sneakers_app/weather/application/services/weather_model.dart';
import 'package:sneakers_app/weather/application/theme/style.dart';

class Locations extends StatefulWidget {
  Locations({this.locationWeather});
  final locationWeather;
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  late int temperature;
  late int condition;
  late String cityName;
  late String weatherIcon;
  late String tempIcon;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weather) {
    setState(() {
      if (weather == null) {
        temperature = 0;
        weatherIcon = 'Error';
        tempIcon = 'Unable to get weather data';
        cityName = '';
        return;
      }
      var condition = weather['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      double temp = weather['main']['temp'];
      temperature = temp.toInt();
      tempIcon = weatherModel.getMessage(temperature);

      cityName = weather['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hava Bugün Nasıl?'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$temperature°  ',
                    style: kTempTextStyle,
                  ),
                  Text(
                    '$weatherIcon $tempIcon in $cityName',
                    style: kConditionTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
