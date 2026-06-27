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
  // Inisialisasi Firebase pakai konfigurasi native Android (google-services.json
  // di android/app/). JANGAN pakai DefaultFirebaseOptions.currentPlatform —
  // owner build via GitHub Actions tanpa flutterfire CLI.
  try {
    await Firebase.initializeApp();
  } catch (e, st) {
    // Jangan crash kalau Firebase gagal init; biar UI tetap jalan & error
    // kelihatan di log, bukan force-close di splash.
    debugPrint('Firebase.initializeApp() failed: $e\n$st');
  }
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
