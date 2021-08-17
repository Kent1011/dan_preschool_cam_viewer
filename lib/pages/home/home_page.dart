import 'package:dan_preschool_cam_viewer/core/api_service/models/camera.dart';
import 'package:dan_preschool_cam_viewer/pages/camera_view/camera_view_model.dart';
import 'package:dan_preschool_cam_viewer/pages/camera_view/camera_view_page.dart';
import 'package:dan_preschool_cam_viewer/pages/home/home_providers.dart';
import 'package:dan_preschool_cam_viewer/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  static const ROUTER_NAME = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Dan\'s Camera Viewer'),
      body: _buildBody(),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody() => Consumer(
        builder: (context, watch, child) {
          return watch(cameraListProvider).when(
            data: (result) => (result.success)
                ? _buildList(result.body)
                : Text(result.message),
            loading: () => _loading,
            error: (err, stack) => Center(child: Text(err.toString())),
          );
        },
      );

  Widget get _loading => const Center(
      child: CircularProgressIndicator(color: Colors.orange, strokeWidth: 2));

  Widget _buildList(Map<String, Camera>? data) {
    if (data?.isEmpty ?? true) {
      return Center(child: Text('找不到攝影機'));
    }

    final keys = data!.keys.toList();

    return ListView.separated(
      itemCount: keys.length,
      itemBuilder: (context, index) {
        final key = keys[index];
        final camera = data[key]!;

        return ListTile(
          title: Text(
            key,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          leading: CircleAvatar(
            child: const Icon(Icons.camera_alt, color: Colors.black54),
          ),
          onTap: () => Navigator.pushNamed(context, CameraViewPage.ROUTER_NAME,
              arguments: CameraViewParameter(cameraName: key, camera: camera)),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 1);
      },
    );
  }
}
