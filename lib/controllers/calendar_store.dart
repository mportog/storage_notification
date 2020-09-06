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

// final Map<DateTime, List> _holidays = {
//   DateTime(2019, 1, 1): ["New Year's Day"],
//   DateTime(2019, 1, 6): ['Epiphany'],
//   DateTime(2019, 2, 14): ["Valentine's Day"],
//   DateTime(2019, 4, 21): ['Easter Sunday'],
//   DateTime(2019, 4, 22): ['Easter Monday'],
//};

  void shouwEvents() => events = ObservableMap.of({
        selectedDay.subtract(const Duration(days: 30)): [
          'Event A0',
          'Event B0',
          'Event C0'
        ]
      });
//   _selectedDay.subtract(const Duration(days: 27)): ['Event A1'],
//   _selectedDay.subtract(const Duration(days: 20)): [
//     'Event A2',
//     'Event B2',
//     'Event C2',
//     'Event D2'
//   ],
//   _selectedDay.subtract(const Duration(days: 16)): ['Event A3', 'Event B3'],
//   _selectedDay.subtract(const Duration(days: 10)): [
//     'Event A4',
//     'Event B4',
//     'Event C4'
//   ],
//   _selectedDay.subtract(const Duration(days: 4)): [
//     'Event A5',
//     'Event B5',
//     'Event C5'
//   ],
//   _selectedDay.subtract(const Duration(days: 2)): ['Event A6', 'Event B6'],
//   _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
//   _selectedDay.add(const Duration(days: 1)): [
//     'Event A8',
//     'Event B8',
//     'Event C8',
//     'Event D8'
//   ],
//   _selectedDay.add(const Duration(days: 7)): [
//     'Event A10',
//     'Event B10',
//     'Event C10'
//   ],
//   _selectedDay.add(const Duration(days: 11)): ['Event A11', 'Event B11'],
//   _selectedDay.add(const Duration(days: 17)): [
//     'Event A12',
//     'Event B12',
//     'Event C12',
//     'Event D12'
//   ],
//   _selectedDay.add(const Duration(days: 22)): ['Event A13', 'Event B13'],
//   _selectedDay.add(const Duration(days: 26)): [
//     'Event A14',
//     'Event B14',
//     'Event C14'
//   ],
// };
}
