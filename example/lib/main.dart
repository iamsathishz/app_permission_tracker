
import 'package:flutter/material.dart';
import 'package:app_permission_tracker/app_permission_tracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _permissionStatus = 'Unknown';
  final _permissions = [
    'camera',
    'location',
    'microphone',
    'contacts',
    'calendar',
    'sms',
    'storage',
    'phone',
    'bodySensors',
    'reminders',
    'motion',
  ];

  Future<void> _check(String permission) async {
    final status = await AppPermissionTracker.checkPermissionStatus(permission);
    setState(() {
      _permissionStatus = '$permission: $status';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Permission Tracker')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (var perm in _permissions)
              ElevatedButton(
                onPressed: () => _check(perm),
                child: Text('Check $perm'),
              ),
            const SizedBox(height: 20),
            Text(_permissionStatus, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
