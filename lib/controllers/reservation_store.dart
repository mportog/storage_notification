import 'package:mobx/mobx.dart';
part 'reservation_store.g.dart';

class ReservationStore = _ReservationStoreBase with _$ReservationStore;

abstract class _ReservationStoreBase with Store {
  @observable
  String assetName = '';
  @observable
  DateTime date = DateTime.now();

  @action
  String formatedDate() {
    final String day =
        date.day.toString().length == 2 ? date.day.toString() : '0${date.day}';
    final String year = date.year.toString();
    final String month = date.month.toString().length == 2
        ? date.month.toString()
        : '0${date.month}';
    return '$year-$month-$day';
  }
}
