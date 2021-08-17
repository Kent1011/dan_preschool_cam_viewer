import 'dart:convert';

import 'package:dan_preschool_cam_viewer/core/application/arguments.dart';

class Camera {
  String? webType;
  String? ip;
  String? port;
  String? channel;

  Camera({
    this.webType,
    this.ip,
    this.port,
    this.channel,
  });

  Map<String, dynamic> toMap() {
    return {
      'webType': webType,
      'ip': ip,
      'port': port,
      'channel': channel,
    };
  }

  factory Camera.fromMap(Map<String, dynamic> map) {
    return Camera(
      webType: map['webType'],
      ip: map['ip'],
      port: map['port'],
      channel: map['channel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Camera.fromJson(String source) => Camera.fromMap(json.decode(source));

  String getStreamUrl() {
    if (webType == null || ip == null || port == null || channel == null)
      return '';
    else if (webType == 'h') {
      return 'rtsp://${this.ip}:${this.port}/MPEG4cif?username=$configCameraAccount&password=$configCameraPwd';
    } else if (webType == 'k') {
      return 'rtsp://${this.ip}:${this.port}/chID=${this.channel}&streamType=sub&linkType=udp';
    } else {
      return '';
    }
  }
}
