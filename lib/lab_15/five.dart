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
      title: 'Permission Handler Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const PermissionHandlerPage(),
    );
  }
}

class PermissionHandlerPage extends StatelessWidget {
  const PermissionHandlerPage({super.key});

  Future<void> requestAndHandlePermissions(BuildContext context) async {
    List<Permission> permissions = [
      Permission.camera,
      Permission.location,
      Permission.storage,
    ];

    for (Permission permission in permissions) {
      PermissionStatus status = await permission.request();

      if (status.isGranted) {
        print('${permission.toString()} is granted.');
      } else if (status.isDenied) {
        print('${permission.toString()} is denied.');
        _showDeniedDialog(context, permission);
      } else if (status.isPermanentlyDenied) {
        print('${permission.toString()} is permanently denied.');
        _showPermanentlyDeniedDialog(context);
      }
    }
  }

  void _showDeniedDialog(BuildContext context, Permission permission) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Denied'),
        content: Text('The ${permission.toString().split(".").last} permission was denied. You can allow it again.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  void _showPermanentlyDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Permanently Denied'),
        content: const Text(
            'Some permissions are permanently denied. Please open app settings to enable them.'),
        actions: [
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.pop(context);
            },
            child: const Text('Open Settings'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Permission Check")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => requestAndHandlePermissions(context),
          child: const Text('Request Permissions'),
        ),
      ),
    );
  }
}
