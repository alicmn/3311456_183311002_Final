import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitide;
  String apiKey = '2e9714911e1deb0a2ee62104c0b5928b';
  late int status;

  /// async and await are used for time consuming tasks
  /// Get your current loatitude and longitude
  /// Location accuracy depends on the type of app high,low ,
  /// high accuracy also result in more power consumed
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitide = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  // /// get geographical coordinates from open weather API call
  // Future<void> getData() async {
  //   http.Response response = await http.get(Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitide&appid=$apiKey'));

  //   String data = response.body;
  //   var decode = jsonDecode(data);

  //   /// get the first item(value of 1st key) from a json array
  //   var id = decode['weather'][0]['id'];
  //   print(id);

  //   /// get an item in a json array contained in a alist
  //   var temp = decode['main']['temp'];
  //   print(temp);

  //   /// get an item in a json array contained in a alist
  //   var city = decode['name'];
  //   print(city);

  //   response.statusCode == 200
  //       ? print(response.body)
  //       : print(response.statusCode);
  // }
}


// class NetworkHelper {
//   NetworkHelper(this.url);
//   final String url;

//   Future getData() async {
//     /// Response body which is used when the entire http body is known in advance
//     /// get and Response come from http package
//     http.Response response = await http.get(Uri.parse(url));
//     String data = response.body;

//     response.statusCode == 200
//         ? print(jsonDecode(data))
//         : print(response.statusCode);
//   }
// }
