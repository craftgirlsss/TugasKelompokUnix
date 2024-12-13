import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tugas_putra/src/components/global_variable.dart';
import 'package:tugas_putra/src/views/auth/introduction.dart';

// Main Function
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://zhfjjcaxzhmrexhkzest.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpoZmpqY2F4emhtcmV4aGt6ZXN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2Nzg4MDMsImV4cCI6MjAxMTI1NDgwM30.i1m1xAiYvDYOWLN8YuIMGTF2mu9CfsB_etdfwNd2DBE',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: GlobalVariable.primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const Introduction(),
    );
  }
}

