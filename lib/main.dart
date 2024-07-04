import 'package:flutter/material.dart';
import 'core/theme/theme_helper.dart';
import 'presentation/unboarding/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedicobApp',
      theme: theme,
      home:const SplashScreenPage(),
    );
  }
}

