import 'package:first_flutter_app/utils/lifecycle_watcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(new MaterialApp(
    title: "My Flutter app",
    theme: ThemeData(primaryColor: Colors.red),
    home: MyFlutterApp()));

class MyFlutterApp extends LifecycleWatcher {}
