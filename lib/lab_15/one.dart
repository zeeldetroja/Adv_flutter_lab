import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(CameraPermissionApp());
}

class CameraPermissionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Permission Demo',
      home: CameraPermissionScreen(),
    );
  }
}

class CameraPermissionScreen extends StatefulWidget {
  @override
  _CameraPermissionScreenState createState() => _CameraPermissionScreenState();
}

class _CameraPermissionScreenState extends State<CameraPermissionScreen> {
  String _permissionStatus = "Unknown";

  Future<void> _checkCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
      setState(() {
        _permissionStatus = "Permission Granted ✅";
      });
    } else if (status.isDenied) {
      // Request permission
      PermissionStatus newStatus = await Permission.camera.request();
      if (newStatus.isGranted) {
        setState(() {
          _permissionStatus = "Permission Granted ✅";
        });
      } else if (newStatus.isPermanentlyDenied) {
        openAppSettings(); // Directs user to app settings
        setState(() {
          _permissionStatus = "Permission Permanently Denied 🚫";
        });
      } else {
        setState(() {
          _permissionStatus = "Permission Denied ❌";
        });
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings(); // Direct to settings
      setState(() {
        _permissionStatus = "Permission Permanently Denied 🚫";
      });
    } else {
      setState(() {
        _permissionStatus = "Permission Status: $status";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Permission Handler'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _permissionStatus,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkCameraPermission,
                child: Text('Request Camera Permission'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
* import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

List<CameraDescription> _cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(CameraPermissionApp());
}

class CameraPermissionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Permission + Preview',
      home: CameraPermissionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CameraPermissionScreen extends StatefulWidget {
  @override
  _CameraPermissionScreenState createState() => _CameraPermissionScreenState();
}

class _CameraPermissionScreenState extends State<CameraPermissionScreen> {
  String _permissionStatus = "Unknown";

  Future<void> _checkCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
      setState(() {
        _permissionStatus = "Permission Granted ✅";
      });
      _openCameraScreen();
    } else if (status.isDenied) {
      PermissionStatus newStatus = await Permission.camera.request();
      if (newStatus.isGranted) {
        setState(() {
          _permissionStatus = "Permission Granted ✅";
        });
        _openCameraScreen();
      } else if (newStatus.isPermanentlyDenied) {
        openAppSettings();
        setState(() {
          _permissionStatus = "Permission Permanently Denied 🚫";
        });
      } else {
        setState(() {
          _permissionStatus = "Permission Denied ❌";
        });
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      setState(() {
        _permissionStatus = "Permission Permanently Denied 🚫";
      });
    }
  }

  void _openCameraScreen() {
    if (_cameras.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CameraPreviewScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No camera found")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Permission Handler'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _permissionStatus,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkCameraPermission,
                child: Text('Request & Open Camera'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CameraPreviewScreen extends StatefulWidget {
  @override
  _CameraPreviewScreenState createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  CameraController? _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _controller = CameraController(_cameras[0], ResolutionPreset.medium);
    await _controller!.initialize();
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Preview'),
      ),
      body: _isInitialized
          ? CameraPreview(_controller!)
          : Center(child: CircularProgressIndicator()),
    );
  }
}

* */