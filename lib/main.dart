import 'package:fixly/fixly_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://upjwyddbftenlgqkbfiu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVwand5ZGRiZnRlbmxncWtiZml1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI5MzY4NDgsImV4cCI6MjA2ODUxMjg0OH0.PJsCBPQ4OWjwFu_suWbFNe1pZGwqg9j6fPBiXO2ikZg',
  );
  await ScreenUtil.ensureScreenSize();
  runApp(const FixlyApp());
}
