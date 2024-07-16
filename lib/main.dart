import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/network/firebase_provider.dart';
import 'package:newmedicob/firebase_options.dart';
import 'package:newmedicob/presentation/Authentication/provider/authentication_provider.dart';
import 'package:newmedicob/presentation/diagnosis/provider/diagnosisprovider.dart';
import 'core/theme/theme_helper.dart';
import 'presentation/unboarding/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => DiagnosisProvider()),
        ChangeNotifierProvider(create: (context) => FirestoreProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MedicobApp',
        theme: theme,
        home: const SplashScreenPage(),
      ),
    );
  }
}
