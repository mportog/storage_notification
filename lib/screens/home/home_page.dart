import 'package:flutter/material.dart';
import 'package:storagenotification/screens/commons/drawer/end_drawer_base.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        centerTitle: true,
      ),
      endDrawer: EndDrawerBase(),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: const Text('Agendar HOJE daqui 30 segundos'),
          )
        ],
      ),
    );
  }
}
