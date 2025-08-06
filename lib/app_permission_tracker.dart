// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

import 'app_permission_tracker_platform_interface.dart';
import 'package:flutter/services.dart';

class AppPermissionTracker {
  static const MethodChannel _channel = MethodChannel('app_permission_tracker');

  Future<String?> getPlatformVersion() {
    return AppPermissionTrackerPlatform.instance.getPlatformVersion();
  }

  /// Check permission status: 'camera', 'location'
  static Future<String> checkPermissionStatus(String permissionType) async {
    final result = await _channel.invokeMethod<String>(
      'checkPermissionStatus',
      {'permissionType': permissionType},
    );
    return result ?? 'unknown';
  }
}
