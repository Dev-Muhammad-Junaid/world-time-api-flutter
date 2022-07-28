import 'package:flutter/material.dart';

import '../services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'pakistan.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime obj = locations[index];
    await obj.getTime();
    //navigate to home screen
    Navigator.pop(context,
        {
          'location':obj.location,
          'flag':obj.flag,
          'time':obj.time,
          'isDaytime' : obj.isDaytime,
        });

  }

  void getData () async
  {
    String username = await Future.delayed(Duration(seconds: 3),(){ return "Junaid";});
    String id = await Future.delayed(Duration(seconds: 0),(){ return "12345";});
    print('$username-$id');
    print("Non Blocking");
  }


  int counter = 0;

  @override
  void initState() {
    super.initState();
    getData();
    print("Init State Function Called");
  }


  @override
  Widget build(BuildContext context) {
    print("Init State Function Ran");
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
        elevation: 0,
        backgroundColor: Colors.blue.shade700,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index)
        {
          return Card(
            child: ListTile(
              onTap: (){
                print(locations[index].location.toString());
                updateTime(index);
              },
              subtitle: Text(locations[index].url.toString()),
              title: Text(locations[index].location.toString()),
              style: ListTileStyle.list,
              leading: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/'+locations[index].flag.toString()),
              ),
            ),
          );
        }
      )
    );
  }
}
