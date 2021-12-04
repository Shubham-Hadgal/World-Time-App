import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  void setupWorldTime() async
  {
    WorldTime ins = WorldTime(location: ('Berlin'), flag: 'Germany.png', url: 'Europe/Berlin');
    await ins.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': ins.location,
      'flag': ins.flag,
      'time': ins.time,
      'isDayTime': ins.isDayTime,
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }
}
