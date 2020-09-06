import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storagenotification/controllers/calendar_store.dart';
import 'package:storagenotification/controllers/reservation_store.dart';
import 'package:storagenotification/screens/home/widgets/calendar/event_marker_builder.dart';
import 'package:table_calendar/table_calendar.dart';

class BuildTableCalendarWithBuilders extends StatefulWidget {
  @override
  _BuildTableCalendarWithBuildersState createState() =>
      _BuildTableCalendarWithBuildersState();
}

class _BuildTableCalendarWithBuildersState
    extends State<BuildTableCalendarWithBuilders>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;
  CalendarStore _calendarStore;
  ReservationStore _reservationStore;
  @override
  void didChangeDependencies() {
    _calendarController = CalendarController();
    _calendarStore = Provider.of<CalendarStore>(context);
    _reservationStore = Provider.of<ReservationStore>(context);
    _calendarStore.shouwEvents();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'pt_BR',
      calendarController: _calendarController,
      events: _calendarStore.events,
      enabledDayPredicate: (day) =>
          day.isAfter(DateTime.tryParse(_reservationStore.formatedDate())),
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: 'mês',
        CalendarFormat.week: 'semana',
      },
      calendarStyle: CalendarStyle(
        unavailableStyle: const TextStyle().copyWith(color: Colors.grey[300]),
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
          formatButtonShowsNext: false),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[300],
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
                child: BuildEventsMarker(
                  date,
                  events,
                  _calendarController.isSelected(date)
                      ? _calendarController.isToday(date)
                          ? Colors.green[400]
                          : Colors.grey[600]
                      : _calendarController.isToday(date)
                          ? Colors.blue
                          : Colors.yellow[900],
                ),
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
}
