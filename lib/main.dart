import 'package:flutter/material.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'utils/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'model/request.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool isLogged = await UserSecureStorage.isLogged();
  Supabase.initialize(
      url: 'https://kxtdxvacfxwlclotempe.supabase.in',
      anonKey:
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt4dGR4dmFjZnh3bGNsb3RlbXBlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDQ2MDM2NzEsImV4cCI6MTk2MDE3OTY3MX0.Ors95vM4yCAvhbmcQ_q84Ki9cW7J-97eEAf4TZeanDI');
  runApp(
    MyApp(isLogged: isLogged),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogged});

  final bool isLogged;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CommonMethod().themeData,
      initialRoute: isLogged ? '/home' : '/',
      routes: {
        '/': (context) => OnBoardingPage(),
        '/home': (context) => MyHomePage(
          title: '',
        ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const OnBoardingPage();
  }
}