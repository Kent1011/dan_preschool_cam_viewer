import 'package:dan_preschool_cam_viewer/core/api_service/api_service_provider.dart';
import 'package:dan_preschool_cam_viewer/core/api_service/models/api_response.dart';
import 'package:dan_preschool_cam_viewer/core/api_service/models/camera.dart';
import 'package:dan_preschool_cam_viewer/core/application/arguments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraListProvider =
    FutureProvider.autoDispose<ApiResponse<Map<String, Camera>>>((ref) async {
  var api = ref.read(apiProvider);
  return await api.getCameras(configUserAccount, configUserPwd);
});
