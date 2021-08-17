import 'package:dan_preschool_cam_viewer/core/application/arguments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAppInitialized = Provider<bool>((ref) =>
    configCameraAccount.isNotEmpty &&
    configCameraPwd.isNotEmpty &&
    configBaseUri.isNotEmpty &&
    configUserAccount.isNotEmpty &&
    configUserPwd.isNotEmpty);
