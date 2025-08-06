import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_permission_tracker_method_channel.dart';

abstract class AppPermissionTrackerPlatform extends PlatformInterface {
  /// Constructs a AppPermissionTrackerPlatform.
  AppPermissionTrackerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppPermissionTrackerPlatform _instance =
      MethodChannelAppPermissionTracker();

  /// The default instance of [AppPermissionTrackerPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppPermissionTracker].
  static AppPermissionTrackerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppPermissionTrackerPlatform] when
  /// they register themselves.
  static set instance(AppPermissionTrackerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
