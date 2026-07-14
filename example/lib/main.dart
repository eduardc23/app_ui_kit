import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppIntl.initialize();
  runApp(const ShowcaseApp());
}
