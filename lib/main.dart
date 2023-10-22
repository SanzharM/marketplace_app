import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace_app/src/application.dart';
import 'package:marketplace_app/src/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initialize();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
  ));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  const Widget app = Application();
  runApp(app);
}
