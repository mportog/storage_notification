import 'package:flutter/material.dart';

class CustomDrawerListTile extends StatelessWidget {
  const CustomDrawerListTile(
      {this.visible,
      this.icon,
      this.title,
      this.subtitle,
      this.onTap,
      this.trailing});
  final VoidCallback onTap;
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget trailing;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(3),
          leading: Icon(icon),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }
}
