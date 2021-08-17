import 'package:dan_preschool_cam_viewer/core/application/app_providers.dart';
import 'package:dan_preschool_cam_viewer/core/router/app_router.dart';
import 'package:dan_preschool_cam_viewer/pages/error/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    if (watch(isAppInitialized)) {
      return MaterialApp(
        title: 'Dan\'s Camera Viewer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        onGenerateRoute: AppRouter.onGenerateRoute,
      );
    } else {
      return MaterialApp(
        title: 'Dan\'s Camera Viewer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        home: ErrorPage('缺少必要資訊，沒辦法啟動APP'),
      );
    }
  }
}
