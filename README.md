# 📱 app_permission_tracker

[![pub package](https://img.shields.io/pub/v/app_permission_tracker.svg)](https://pub.dev/packages/app_permission_tracker)

A Flutter plugin to **check the status of runtime permissions** on Android and iOS platforms.

This plugin allows developers to easily verify whether specific permissions (camera, location, microphone, etc.) are **granted**, **denied**, or **unsupported** on the device.

---

## 🚀 Features

- Works on **Android** and **iOS**
- Supports common permissions across platforms
- Simple Dart API: no need to write native code
- Clean and lightweight implementation

---

## 📲 Supported Permissions

| Permission     | Android | iOS |
|----------------|:-------:|:---:|
| Camera         | ✅       | ✅   |
| Location       | ✅       | ✅   |
| Microphone     | ✅       | ✅   |
| Contacts       | ✅       | ✅   |
| Calendar       | ✅       | ✅   |
| SMS            | ✅       | ❌   |
| Storage        | ✅       | ❌   |
| Phone          | ✅       | ❌   |
| Body Sensors   | ✅       | ❌   |
| Reminders      | ❌       | ✅   |
| Motion Activity| ❌       | ✅   |

> Permissions that are not available on a specific platform will return `"unsupported"`.

---

## 🔧 Usage

### ✅ Import the package

```dart
import 'package:app_permission_tracker/app_permission_tracker.dart';
```

### ✅ Check permission status

```dart
String status = await AppPermissionTracker.checkPermissionStatus('camera');
print('Camera permission: $status'); // granted / denied / unsupported
```

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  app_permission_tracker: ^0.0.1
```

Then run:

```bash
flutter pub get
```

---

## 📱 Android Setup

### 1. Add permissions in `AndroidManifest.xml`

Open:
```
android/app/src/main/AndroidManifest.xml
```

Add the following inside the `<manifest>` tag:

```xml
<!-- Camera -->
<uses-permission android:name="android.permission.CAMERA" />
<!-- Location -->
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<!-- Microphone -->
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<!-- Contacts -->
<uses-permission android:name="android.permission.READ_CONTACTS" />
<!-- Calendar -->
<uses-permission android:name="android.permission.READ_CALENDAR" />
<!-- SMS -->
<uses-permission android:name="android.permission.READ_SMS" />
<!-- Storage -->
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<!-- Phone -->
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<!-- Body Sensors -->
<uses-permission android:name="android.permission.BODY_SENSORS" />
<!-- Android 13+ Notification -->
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
<!-- Android 13+ Media -->
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />
<uses-permission android:name="android.permission.READ_MEDIA_VIDEO" />
<uses-permission android:name="android.permission.READ_MEDIA_AUDIO" />
```

> ⚠️ This plugin only **checks** permission status. If you want to **request** permissions, use a plugin like [`permission_handler`](https://pub.dev/packages/permission_handler) or implement custom logic.

---

## 📄 iOS Setup

Add these permission descriptions in:
```
ios/Runner/Info.plist
```

```xml
<key>NSCameraUsageDescription</key>
<string>Camera access is needed to take photos</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>Location is needed for this feature</string>
<key>NSMicrophoneUsageDescription</key>
<string>Microphone access is needed for recording</string>
<key>NSContactsUsageDescription</key>
<string>We use contacts for contact-based features</string>
<key>NSCalendarsUsageDescription</key>
<string>Calendar access is needed</string>
<key>NSRemindersUsageDescription</key>
<string>We need reminders access</string>
```

---

## 🧪 Example

Try the included example app to test permission checks:

```bash
cd example
flutter run
```

---

## ✅ LICENSE

```text
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
```
