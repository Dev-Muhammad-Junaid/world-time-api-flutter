import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map<dynamic,dynamic> data= { };


  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map; //no setstate is needed because we are building this first before building the widget
    print("Data : $data");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ElevatedButton.icon(onPressed: ()
            {
              Navigator.pushNamed(context,'/location');
            },
                icon: Icon(Icons.edit_location), label: Text("Edit Location"))
          ],
        )),
    );
  }
}
