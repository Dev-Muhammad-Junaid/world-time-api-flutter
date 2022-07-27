import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime()
  async {
    WorldTime obj = WorldTime(flag: "pakistan.png",location: "Karachi",url: "Asia/Karachi");
    await obj.getTime();
    print("Time : "+obj.time.toString());
    Navigator.pushReplacementNamed(context, '/home',arguments:
    {
      'location':obj.location,
      'flag':obj.flag,
      'time':obj.time,
    }
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    print("Initiate Widget is Called");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Text("Loading",style: TextStyle(fontSize: 30.0,backgroundColor: Colors.deepPurple,color: Colors.amber),),
      ),
    );
  }
}
