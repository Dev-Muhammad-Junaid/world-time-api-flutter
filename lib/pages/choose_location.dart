import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

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
        backgroundColor: Colors.deepPurple,
      ),
      body: ElevatedButton(
        onPressed: (){ setState( () {counter+=1;} ); },
        child: Text("Counter is $counter"),
      ),
    );
  }
}
