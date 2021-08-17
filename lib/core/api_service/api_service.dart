import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dan_preschool_cam_viewer/core/api_service/models/api_response.dart';
import 'package:dan_preschool_cam_viewer/core/api_service/models/camera.dart';

abstract class ApiService {
  Future<ApiResponse<Map<String, Camera>>> getCameras(
      String account, String password);
}

class PreschoolApiService implements ApiService {
  PreschoolApiService(this.baseUrl);

  final String baseUrl;

  @override
  Future<ApiResponse<Map<String, Camera>>> getCameras(
      String account, String password) async {
    final url = '$baseUrl/auth/CkidsAuth';
    final hashedPwd = md5.convert(utf8.encode(password)).toString();

    try {
      var result = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'id': account,
          'key': hashedPwd,
        },
        encoding: Encoding.getByName('utf-8'),
      );

      if (result.statusCode == 200 && result.body.isNotEmpty) {
        Map response = jsonDecode(result.body);

        if (!response.keys.contains('webcams')) {
          return ApiResponse.error('無法取得攝影機清單');
        }

        Map<String, Camera> cameras = {};
        response['webcams'].forEach((key, value) {
          try {
            String camName = key;
            switch (key) {
              case 'Koala':
                camName = '教室';
                break;
              case 'Basement':
                camName = '球池';
                break;
              case 'PLAYAREA':
                camName = '大廳';
                break;
            }

            cameras[camName] = Camera.fromMap(value);
          } catch (err) {
            debugPrint('轉換資料發生錯誤: $err');
          }
        });

        return ApiResponse.success(cameras);
      } else {
        return ApiResponse.error('無法取得攝影機清單');
      }
    } catch (err) {
      return ApiResponse.error(err.toString());
    }
  }
}
