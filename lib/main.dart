import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'routes/AppRoutes/approutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        initialRoute: AppRoutes.splashscreen,
        onGenerateRoute: AppRoutes.generateRoute,
        title: 'Sover Eats',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const Spl(),
      ),
    );
  }
}
