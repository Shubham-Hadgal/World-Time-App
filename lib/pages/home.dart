import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDayTime'] ? 'day.jpg': 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blueGrey: Colors.indigo;
    Color? textBgColor = data['isDayTime'] ? Colors.black87: Colors.grey[300];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 140.0, 0.0, 0.0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.location_on,
                    color: textBgColor,
                    size: 20.0,
                  ),
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      color: textBgColor,
                      fontSize: 15.0
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: textBgColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),

                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: textBgColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
