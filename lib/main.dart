import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/presentation/Authentication/provider/authentication_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
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
