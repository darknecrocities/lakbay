import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:lakbay/screens/splash_screen.dart';
import 'services/supabase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Load .env file
  await dotenv.load(fileName: ".env");

  /// Fullscreen mode
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [],
  );

  /// Initialize Supabase
  if (!SupabaseOptions.isConfigured) {
    throw Exception("Supabase credentials are not configured properly!");
  }

  await Supabase.initialize(
    url: SupabaseOptions.supabaseUrl,
    anonKey: SupabaseOptions.supabaseAnonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lakbay App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
