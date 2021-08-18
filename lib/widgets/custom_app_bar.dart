import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.brightness = Brightness.light,
  }) : super(key: key);

  final String? title;
  final List<Widget>? actions;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: title != null
          ? Text(title!,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: brightness == Brightness.light
                    ? Colors.black87
                    : Colors.white70,
              ))
          : null,
      actions: actions,
      backgroundColor:
          brightness == Brightness.light ? Colors.orange : Colors.black,
      iconTheme: IconThemeData(
          color:
              brightness == Brightness.light ? Colors.black87 : Colors.white70),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
