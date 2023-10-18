import 'package:flutter/material.dart';
import 'package:marketplace_app/src/application.dart';
import 'package:marketplace_app/src/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initialize();

  const Widget app = Application();
  runApp(app);
}
