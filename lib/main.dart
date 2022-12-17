import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/pages/camera_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(App());
}
