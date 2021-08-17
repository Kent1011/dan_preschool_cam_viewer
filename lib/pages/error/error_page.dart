import 'package:dan_preschool_cam_viewer/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static const ROUTER_NAME = '/error';

  const ErrorPage(this.message, {Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Error'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        alignment: Alignment.center,
        child: Text(message),
      ),
    );
  }
}
