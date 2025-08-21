import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(StoragePermissionApp());
}

class StoragePermissionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storage Permission Demo',
      home: StorageScreen(),
    );
  }
}

class StorageScreen extends StatefulWidget {
  @override
  _StorageScreenState createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  String _fileContent = "No content yet.";

  Future<void> _requestPermissionAndWriteFile() async {
    var status = await Permission.storage.status;

    if (status.isGranted) {
      _writeToFile();
    } else if (status.isDenied) {
      var newStatus = await Permission.storage.request();
      if (newStatus.isGranted) {
        _writeToFile();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Permission denied")),
        );
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> _writeToFile() async {
    final dir = await getExternalStorageDirectory(); // safer for Android
    final file = File('${dir!.path}/demo.txt');
    await file.writeAsString('Hello World from Flutter!');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("File written: demo.txt")),
    );
  }

  Future<void> _readFromFile() async {
    final dir = await getExternalStorageDirectory();
    final file = File('${dir!.path}/demo.txt');

    if (await file.exists()) {
      String contents = await file.readAsString();
      setState(() {
        _fileContent = contents;
      });
    } else {
      setState(() {
        _fileContent = "File not found.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Permission'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _requestPermissionAndWriteFile,
              child: Text('Request Storage Permission & Write File'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _readFromFile,
              child: Text('Read File'),
            ),
            SizedBox(height: 20),
            Text(
              'File Content:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(_fileContent),
          ],
        ),
      ),
    );
  }
}
