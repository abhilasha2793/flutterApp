import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final Color? foregroundColor;

  CustomAppBar(
      {super.key, this.title, this.backgroundColor, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
          child: Text(title!)
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
