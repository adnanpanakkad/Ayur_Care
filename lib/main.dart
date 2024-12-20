import 'package:ayur_care/controller/api_controller.dart';
import 'package:ayur_care/controller/login_controller.dart';
import 'package:ayur_care/controller/register_controller.dart';
import 'package:ayur_care/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => RegisterController()),
        ChangeNotifierProvider(create: (context) => ApiController()),
      ],
      child: MaterialApp(
        title: 'Ayur Care',
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
