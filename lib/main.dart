import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/network/firebase_provider.dart';
import 'package:newmedicob/firebase_options.dart';
import 'package:newmedicob/presentation/Authentication/provider/authentication_provider.dart';
import 'package:newmedicob/presentation/Homepage/provider/healthdata_fetch.dart';
import 'package:newmedicob/presentation/diagnosis/provider/diagnosisprovider.dart';
import 'package:newmedicob/presentation/profile/provider/darktheme_provider.dart';
import 'package:newmedicob/presentation/profile/widget/thtme_styles.dart';
import 'package:newmedicob/presentation/vital%20Check/temperature_check/provider/vital_check_provider.dart';
import 'core/theme/theme_helper.dart';
import 'presentation/unboarding/splashscreen.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  cameras = await availableCameras();
  runApp(
       MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => DiagnosisProvider()),
        ChangeNotifierProvider(create: (context) => FirebaseProvider()),
        ChangeNotifierProvider(create: (context) => VitalCheckProvider()),
        ChangeNotifierProvider(create: (context) => FetchHealthTipProvider()),
        
      
      ],
      child: const MyApp(), // Ensure MyApp is wrapped by MultiProvider
    ),
   );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    DarkThemeProvider themeChangeProvider =  DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => themeChangeProvider,
      child: Consumer<DarkThemeProvider>(
        builder: (context,vaue,child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MedicobApp',
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: const SplashScreenPage(),
            
          );
        }
      ),
    );
  }
}
