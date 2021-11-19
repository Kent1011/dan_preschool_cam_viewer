import 'package:dan_preschool_cam_viewer/pages/camera_view/camera_view_model.dart';
import 'package:dan_preschool_cam_viewer/widgets/custom_app_bar.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

class CameraViewPage extends StatefulWidget {
  static const ROUTER_NAME = '/camera-view';

  CameraViewPage(this.parameters, {Key? key}) : super(key: key);

  final CameraViewParameter parameters;

  @override
  _CameraViewPageState createState() => _CameraViewPageState();
}

class _CameraViewPageState extends State<CameraViewPage> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    player.setDataSource(
      widget.parameters.camera.getStreamUrl(),
      autoPlay: true,
    );
    player.setOption(FijkOption.formatCategory, 'rtsp_transport', 'tcp');
    player.setOption(FijkOption.playerCategory, 'packet-buffering', '0');
  }

  @override
  void dispose() {
    player.release();
    Wakelock.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.parameters.cameraName,
        brightness: Brightness.dark,
      ),
      body: Center(
        child: FijkView(
          player: player,
          color: Colors.black87,
          fsFit: FijkFit.fitWidth,
        ),
      ),
    );
  }
}
