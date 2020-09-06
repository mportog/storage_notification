import 'package:flutter/material.dart';
import 'package:storagenotification/screens/home/widgets/custom_list_tile.dart';

class BuildEventList extends StatelessWidget {
  const BuildEventList(this.eventList);
  final List eventList;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: eventList
          .map((event) => CustomListTile(
                Icons.check,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('$event'),
                    const Text('Minha casa'),
                  ],
                ),
                subtitle: const Text('inicio:12:20 - fim 14:15'),
                onTap: () => debugPrint('$event tapped!'),
              ))
          .toList(),
    );
  }
}
