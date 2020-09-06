// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReservationStore on _ReservationStoreBase, Store {
  final _$assetNameAtom = Atom(name: '_ReservationStoreBase.assetName');

  @override
  String get assetName {
    _$assetNameAtom.reportRead();
    return super.assetName;
  }

  @override
  set assetName(String value) {
    _$assetNameAtom.reportWrite(value, super.assetName, () {
      super.assetName = value;
    });
  }

  final _$dateAtom = Atom(name: '_ReservationStoreBase.date');

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$_ReservationStoreBaseActionController =
      ActionController(name: '_ReservationStoreBase');

  @override
  String formatedDate() {
    final _$actionInfo = _$_ReservationStoreBaseActionController.startAction(
        name: '_ReservationStoreBase.formatedDate');
    try {
      return super.formatedDate();
    } finally {
      _$_ReservationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
assetName: ${assetName},
date: ${date}
    ''';
  }
}
