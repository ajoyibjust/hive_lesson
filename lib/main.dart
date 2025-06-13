import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_lesson/core/services/dependency_injection_instance.dart';
import 'package:hive_lesson/features/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("products");
  await serviceLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
