import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:storagenotification/controllers/calendar_store.dart';
import 'package:storagenotification/screens/commons/drawer/end_drawer_base.dart';
import 'package:storagenotification/screens/home/widgets/custom_list_tile.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarHomePage extends StatefulWidget {
  @override
  _CalendarHomePageState createState() => _CalendarHomePageState();
}

class _CalendarHomePageState extends State<CalendarHomePage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;
  TabController _controller;
  CalendarStore _calendarStore;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    _calendarStore = Provider.of<CalendarStore>(context);
    _calendarStore.shouwEvents();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservador'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.restore),
            tooltip: 'Hoje',
            onPressed: () {
              final DateTime dateTime = DateTime.now();
              _calendarController.setSelectedDay(
                DateTime(dateTime.year, dateTime.month, dateTime.day),
                runCallback: true,
              );
            },
          )
        ],
        bottom: TabBar(controller: _controller, tabs: [
          Tab(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.today),
              const Text('Minhas'),
            ],
          )),
          Tab(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.calendar_today),
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
            _buildTableCalendarWithBuilders(),
            const SizedBox(height: 8.0),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  _buildEventList(),
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      CustomListTile(
                          Icons.event_available, const Text('Inserir'),
                          subtitle: const Text('Data')),
                      CustomListTile(
                          Icons.event_available, const Text('Inserir'),
                          subtitle: const Text('Data')),
                      CustomListTile(
                          Icons.event_available, const Text('Inserir'),
                          subtitle: const Text('Data')),
                      CustomListTile(
                          Icons.event_available, const Text('Inserir'),
                          subtitle: const Text('Data')),
                      CustomListTile(
                          Icons.event_available, const Text('Inserir'),
                          subtitle: const Text('Data')),
                      CustomListTile(
                          Icons.event_available, const Text('Inserir'),
                          subtitle: const Text('Data')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pt_BR',
      calendarController: _calendarController,
      events: _calendarStore.events,
      // holidays: _calendarStore.holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: const TextStyle().copyWith(color: Colors.red[800]),
        holidayStyle: const TextStyle().copyWith(color: Colors.red[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: const TextStyle().copyWith(color: Colors.red[600]),
      ),
      headerStyle: const HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(216, 0, 116, 1),
                  borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle(color: Colors.white).copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green[100],
            ),
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: const TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events) {
        _calendarStore.onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _calendarStore.onVisibleDaysChanged,
      onCalendarCreated: _calendarStore.onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _calendarController.isSelected(date)
            ? Colors.grey[600]
            : _calendarController.isToday(date)
                ? Colors.blue
                : const Color.fromRGBO(216, 0, 116, 1),
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: const TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildEventList() {
    return ListView(
      shrinkWrap: true,
      children: _calendarStore.selectedEvents
          .map((event) => Card(
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('${event.toString()}       Minha casa'),
                  subtitle: const Text('inicio:12:20 - fim 14:15'),
                  onTap: () => debugPrint('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
