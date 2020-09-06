// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalendarStore on _CalendarStoreBase, Store {
  final _$eventsAtom = Atom(name: '_CalendarStoreBase.events');

  @override
  ObservableMap<DateTime, List<dynamic>> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(ObservableMap<DateTime, List<dynamic>> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  final _$selectedEventsAtom = Atom(name: '_CalendarStoreBase.selectedEvents');

  @override
  ObservableList<dynamic> get selectedEvents {
    _$selectedEventsAtom.reportRead();
    return super.selectedEvents;
  }

  @override
  set selectedEvents(ObservableList<dynamic> value) {
    _$selectedEventsAtom.reportWrite(value, super.selectedEvents, () {
      super.selectedEvents = value;
    });
  }

  final _$selectedDayAtom = Atom(name: '_CalendarStoreBase.selectedDay');

  @override
  DateTime get selectedDay {
    _$selectedDayAtom.reportRead();
    return super.selectedDay;
  }

  @override
  set selectedDay(DateTime value) {
    _$selectedDayAtom.reportWrite(value, super.selectedDay, () {
      super.selectedDay = value;
    });
  }

  final _$_CalendarStoreBaseActionController =
      ActionController(name: '_CalendarStoreBase');

  @override
  void onDaySelected(DateTime day, List<dynamic> events) {
    final _$actionInfo = _$_CalendarStoreBaseActionController.startAction(
        name: '_CalendarStoreBase.onDaySelected');
    try {
      return super.onDaySelected(day, events);
    } finally {
      _$_CalendarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
events: ${events},
selectedEvents: ${selectedEvents},
selectedDay: ${selectedDay}
    ''';
  }
}
