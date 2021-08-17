import 'package:dan_preschool_cam_viewer/pages/camera_view/camera_view_model.dart';
import 'package:dan_preschool_cam_viewer/pages/camera_view/camera_view_page.dart';
import 'package:dan_preschool_cam_viewer/pages/error/error_page.dart';
import 'package:dan_preschool_cam_viewer/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// 首頁
      ///
      case HomePage.ROUTER_NAME:
        return MaterialPageRoute(builder: (context) => HomePage());

      /// 攝影機瀏覽頁面
      ///
      case CameraViewPage.ROUTER_NAME:
        {
          if (settings.arguments is! CameraViewParameter)
            return MaterialPageRoute(
                builder: (context) => ErrorPage('缺少攝影機資訊'));
          return MaterialPageRoute(
              builder: (context) =>
                  CameraViewPage(settings.arguments as CameraViewParameter));
        }

      /// 錯誤頁面
      ///
      case ErrorPage.ROUTER_NAME:
        {
          var message = (settings.arguments is String)
              ? settings.arguments as String
              : 'Unknown Error';
          return MaterialPageRoute(builder: (context) => ErrorPage(message));
        }

      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}
