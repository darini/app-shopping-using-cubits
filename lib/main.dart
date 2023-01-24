import 'package:flutter/material.dart';

import 'di/di.dart';
import 'ui/app/pages/app.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}
