import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';
part 'calendar_store.g.dart';

class CalendarStore = _CalendarStoreBase with _$CalendarStore;

abstract class _CalendarStoreBase with Store {
  @observable
  ObservableMap<DateTime, List> events = ObservableMap<DateTime, List>();
  @observable
  ObservableList<dynamic> selectedEvents = ObservableList<dynamic>();
  @observable
  DateTime selectedDay = DateTime.now();

  @action
  void onDaySelected(DateTime day, List<dynamic> events) {
    selectedEvents = ObservableList.of(events);
  }

  void onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {}

  void onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {}

  void shouwEvents() => events = ObservableMap.of({
        selectedDay.add(const Duration(days: 1)): [
          'Event A1',
          'Event B1',
          'Event C1'
        ],
        selectedDay: ['Event A0', 'Event B0', 'Event C0'],
      });
}
