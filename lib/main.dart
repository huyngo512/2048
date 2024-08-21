import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_2048/main_module.dart';
import 'package:flutter_2048/main_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/board_adapter.dart';

void main() async {
  //Allow only portrait mode on Android & iOS
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  //Make sure Hive is initialized first and only after register the adapter.
  await Hive.initFlutter();
  Hive.registerAdapter(BoardAdapter());
  runApp(ModularApp(module: MainModule(), child: const MainWidget()));
}
