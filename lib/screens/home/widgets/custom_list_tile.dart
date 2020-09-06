import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(this.iconData, this.title,
      {this.subtitle, this.trailing, this.onTap});
  final IconData iconData;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(iconData),
        title: title,
        subtitle: subtitle,
        trailing: trailing ?? Container(height: 0, width: 0),
        onTap: onTap,
      ),
    );
  }
}
