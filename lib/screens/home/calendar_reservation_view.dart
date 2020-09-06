import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:storagenotification/controllers/calendar_store.dart';
import 'package:storagenotification/screens/commons/drawer/end_drawer_base.dart';
import 'package:storagenotification/screens/home/widgets/calendar/calendar_table_builder.dart';
import 'package:storagenotification/screens/home/widgets/calendar/event_list.dart';
import 'package:storagenotification/screens/home/widgets/new/new_options.dart';

class CalendarHomePage extends StatefulWidget {
  @override
  _CalendarHomePageState createState() => _CalendarHomePageState();
}

class _CalendarHomePageState extends State<CalendarHomePage>
    with TickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservas'),
        centerTitle: true,
        bottom: TabBar(controller: _controller, tabs: [
          Tab(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(Icons.today),
              const Text('Minhas'),
            ],
          )),
          Tab(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Stack(alignment: Alignment.center, children: <Widget>[
                Icon(Icons.calendar_today),
                Positioned(bottom: 2, child: Icon(Icons.add, size: 14))
              ]),
              const Text('Nova'),
            ],
          )),
        ]),
      ),
      drawer: EndDrawerBase(),
      body: Observer(
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Card(child: BuildTableCalendarWithBuilders()),
            const SizedBox(height: 8.0),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  BuildEventList(
                      Provider.of<CalendarStore>(context, listen: true)
                          .selectedEvents),
                  BuildOptionReservation(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
