import 'package:dan_preschool_cam_viewer/core/api_service/api_service.dart';
import 'package:dan_preschool_cam_viewer/core/application/app_providers.dart';
import 'package:dan_preschool_cam_viewer/core/application/arguments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider =
    Provider<ApiService>((ref) => PreschoolApiService(configBaseUri));
