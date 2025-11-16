import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseOptions {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  static bool get isConfigured {
    return supabaseUrl.isNotEmpty &&
        supabaseUrl.contains("supabase.co") &&
        supabaseAnonKey.isNotEmpty;
  }
}
