import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {
    Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Karachi');
    Response response = await get(url);
    Map data = jsonDecode(response.body);
    print(data);
    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'];
    offset= offset.substring(1,3);
    print("Datetime : "+datetime);
    print("offset : "+offset);

    //create Datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("Initiate Widget is Called");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
