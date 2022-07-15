import 'package:community_internal/ui/screens/other_community.dart';
import 'package:community_internal/ui/screens/same_community.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  _HomePState createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DONATION'),
      ),
      body: const Center(),
      floatingActionButton: SpeedDial(
          icon: Icons.share,
          backgroundColor: Colors.amber,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.face),
              label: 'ADD IN YOUR COMMUNITY',
              backgroundColor: Colors.amberAccent,
              onTap:
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SameCom()),
                  );
                },
            ),
            SpeedDialChild(
              child: const Icon(Icons.face),
              label: 'ADD IN OTHER COMMUNITY',
              backgroundColor: Colors.amberAccent,
              onTap:  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtherCom()),
                );
              },
            ),
          ]),
    );
  }
}