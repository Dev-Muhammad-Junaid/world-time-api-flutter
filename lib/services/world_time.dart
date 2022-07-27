import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String? location; //location name for the UI
  String? time; //the time in that location
  String? flag; //url for the flag of the location
  String? url; //location url for api endpoint

  WorldTime({this.flag,this.location,this.url})
  {


  void getData() async {
    Uri myapi = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
    Response response = await get(myapi);
    Map data = jsonDecode(response.body);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'];
    offset= offset.substring(1,3);

    //create Datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    //setting the time variable property here
    time = now.toString();
  }
  WorldTime obj = WorldTime(flag: "pakistam.png",location: "Karachi",url: "dnee");
}

