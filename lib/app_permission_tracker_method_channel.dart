import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_permission_tracker_platform_interface.dart';

/// An implementation of [AppPermissionTrackerPlatform] that uses method channels.
class MethodChannelAppPermissionTracker extends AppPermissionTrackerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_permission_tracker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
