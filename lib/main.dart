
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/router/app_routes.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bazar App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboardingOne,
      routes: AppRouter.routes,
      
      /* Scaffold(
        appBar: AppBar(title: Text("Bazar App")),
        body: Center(child: Center(child: Text("Home Page"))),
      ),*/
    );
  }
}
