# 📱 app_permission_tracker

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

### 📦 Installation

```bash
dependencies:
  app_permission_tracker: ^0.0.1
```

### 📄 iOS Setup

Add these keys to your Info.plist for proper permission access:

```bash
<key>NSCameraUsageDescription</key>
<string>Camera access is needed to take photos</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>Location is needed for this feature</string>
<key>NSMicrophoneUsageDescription</key>
<string>Microphone access is needed for recording</string>
<key>NSContactsUsageDescription</key>
<string>We use contacts for...</string>
<key>NSCalendarsUsageDescription</key>
<string>Access calendar for...</string>
<key>NSRemindersUsageDescription</key>
<string>Access reminders for...</string>
```

---

## ✅ `LICENSE` (MIT License)

```text
MIT License

Copyright (c) 2025 [Your Name]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included  
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS  
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER  
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN  
THE SOFTWARE.

