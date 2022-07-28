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
    data = data.isEmpty ? ModalRoute.of(context)?.settings.arguments as Map : data; //no set state is needed because we are building this first before building the widget
    print("Data : $data");
    //set background
    String backgroundimg = data['isDaytime'] ? 'dayty.jpg' : 'nighty.jpg';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/$backgroundimg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,25,0,0),
          child: SafeArea(
            child: Column(
              children: <Widget>[

                ElevatedButton.icon(onPressed: ()
                async{
                  dynamic result = await Navigator.pushNamed(context,'/location');
                  setState(() {
                    data={
                      'time':result['time'],
                      'location':result['location'],
                      'isDaytime':result['isDaytime'],
                      'flag':result['flag'],
                    };
                  });
                  },

                    icon: Icon(Icons.edit_location), label: Text("Edit Location"),style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade700)),
                ),
                SizedBox(height: 200.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],
                    style: TextStyle(fontSize: 30.0,letterSpacing: 2.0,color: Colors.white),)
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(data['time'],style: TextStyle(fontSize: 66.0,color: Colors.white),),

              ],
            )),
        ),
      ),
    );
  }
}
