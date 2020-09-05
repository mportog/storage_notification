import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(this.iconData, this.title,
      {this.subtitle, this.trailing});
  final IconData iconData;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Icon(iconData, color: const Color.fromARGB(216, 0, 116, 1)),
          title: title,
          subtitle: subtitle,
          trailing: trailing ?? Container(height: 0, width: 0)),
    );
  }
}
