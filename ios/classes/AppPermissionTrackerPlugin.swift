
import Flutter
import UIKit
import AVFoundation
import CoreLocation
import Contacts
import EventKit
import CoreTelephony
import CoreMotion

public class AppPermissionTrackerPlugin: NSObject, FlutterPlugin {
    let locationManager = CLLocationManager()
    let motionManager = CMMotionActivityManager()

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "app_permission_tracker", binaryMessenger: registrar.messenger())
        let instance = AppPermissionTrackerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard call.method == "checkPermissionStatus",
              let args = call.arguments as? [String: Any],
              let type = args["permissionType"] as? String else {
            result(FlutterMethodNotImplemented)
            return
        }

        switch type {
        case "camera":
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            result(status == .authorized ? "granted" : "denied")
        case "microphone":
            let status = AVAudioSession.sharedInstance().recordPermission
            result(status == .granted ? "granted" : "denied")
        case "location":
            let status = CLLocationManager.authorizationStatus()
            result((status == .authorizedAlways || status == .authorizedWhenInUse) ? "granted" : "denied")
        case "contacts":
            let status = CNContactStore.authorizationStatus(for: .contacts)
            result(status == .authorized ? "granted" : "denied")
        case "calendar":
            let status = EKEventStore.authorizationStatus(for: .event)
            result(status == .authorized ? "granted" : "denied")
        case "reminders":
            let status = EKEventStore.authorizationStatus(for: .reminder)
            result(status == .authorized ? "granted" : "denied")
        case "motion":
            result(CMMotionActivityManager.isActivityAvailable() ? "granted" : "denied")
        default:
            result("unsupported")
        }
    }
}
