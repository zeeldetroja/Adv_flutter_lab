import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(LocationPermissionApp());
}

class LocationPermissionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Permission Demo',
      home: LocationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _location = "Unknown";

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;

    if (status.isGranted) {
      _getCurrentLocation();
    } else if (status.isDenied) {
      var newStatus = await Permission.location.request();
      if (newStatus.isGranted) {
        _getCurrentLocation();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Location permission denied")),
        );
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enable location services")),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Location permission denied again")),
        );
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _location =
      "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get User Location'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _location,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _requestLocationPermission,
                child: Text('Request & Get Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
