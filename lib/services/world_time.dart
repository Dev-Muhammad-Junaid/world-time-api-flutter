import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String? location; //location name for the UI
  String? time; //the time in that location
  String? flag; //url for the flag of the location
  String? url; //location url for api endpoint
  bool? isDaytime; //true or false if daytime or not

  WorldTime({this.flag, this.location, this.url});

  Future<void > getTime() async {

    try{

    Uri myapi = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
    Response response = await get(myapi);
    Map data = jsonDecode(response.body);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'];
    offset = offset.substring(1, 3);

    //create Datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    //setting the time variable property here
    isDaytime =  now.hour > 6 && now.hour < 20;
    time = DateFormat.jm().format(now);

    }
    catch (e) {
      print("Error $e");
      time='Could not get time data';
    }
  }


}