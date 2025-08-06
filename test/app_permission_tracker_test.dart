import 'package:flutter_test/flutter_test.dart';
import 'package:app_permission_tracker/app_permission_tracker.dart';
import 'package:app_permission_tracker/app_permission_tracker_platform_interface.dart';
import 'package:app_permission_tracker/app_permission_tracker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppPermissionTrackerPlatform
    with MockPlatformInterfaceMixin
    implements AppPermissionTrackerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppPermissionTrackerPlatform initialPlatform = AppPermissionTrackerPlatform.instance;

  test('$MethodChannelAppPermissionTracker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppPermissionTracker>());
  });

  test('getPlatformVersion', () async {
    AppPermissionTracker appPermissionTrackerPlugin = AppPermissionTracker();
    MockAppPermissionTrackerPlatform fakePlatform = MockAppPermissionTrackerPlatform();
    AppPermissionTrackerPlatform.instance = fakePlatform;

    expect(await appPermissionTrackerPlugin.getPlatformVersion(), '42');
  });
}
