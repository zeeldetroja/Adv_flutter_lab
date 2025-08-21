import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiple Permissions Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PermissionPage(),
    );
  }
}

class PermissionPage extends StatelessWidget {
  const PermissionPage({super.key});

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.locationWhenInUse,
      Permission.storage,
    ].request();

    statuses.forEach((permission, status) {
      if (status.isGranted) {
        print('${permission.toString()} granted');
      } else if (status.isDenied) {
        print('${permission.toString()} denied');
      } else if (status.isPermanentlyDenied) {
        print('${permission.toString()} permanently denied');
        openAppSettings(); // opens settings for manual permission change
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Request Multiple Permissions')),
      body: Center(
        child: ElevatedButton(
          onPressed: requestPermissions,
          child: const Text('Request Permissions'),
        ),
      ),
    );
  }
}
