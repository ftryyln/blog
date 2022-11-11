import 'package:blog/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}
