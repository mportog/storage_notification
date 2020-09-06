import 'package:flutter/material.dart';

class BuildEventsMarker extends StatelessWidget {
  const BuildEventsMarker(this.date, this.events, this.eventColor);
  final DateTime date;
  final List events;
  final Color eventColor;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(shape: BoxShape.circle, color: eventColor),
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
}
