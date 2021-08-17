import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.actions,
  }) : super(key: key);

  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    if (title?.isEmpty ?? true) {
      return AppBar(elevation: 0, actions: actions);
    } else {
      return AppBar(elevation: 0, title: Text(title!), actions: actions);
    }
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
