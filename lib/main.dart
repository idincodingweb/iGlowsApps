import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/theme/app_theme.dart';
import 'features/splash/splash_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Langsung panggil ini aja, otomatis ngebaca google-services.json di Android
  await Firebase.initializeApp();
  
  runApp(const IGlowsApp());
}

class IGlowsApp extends StatelessWidget {
  const IGlowsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iGlows',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/onboarding': (_) => const OnboardingScreen(),
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}
