import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String? time = 'loading';

  void setupWorldTime()
  async {
    WorldTime obj = WorldTime(flag: "pakistan.png",location: "Karachi",url: "Asia/Karachi");
    await obj.getTime();
    setState(() {
      time=obj.time;
    });
    print("Time : "+obj.time.toString());
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
        padding: const EdgeInsets.all(50.0),
        child: Text(time!),
      ),
    );
  }
}
