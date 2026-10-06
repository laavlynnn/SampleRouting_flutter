import 'package:flutter/material.dart';

import 'routes/app_routes.dart'; //tawgon si app_routes.dart para ma access ang mga routes nga gi define sa app_routes.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Routing Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, //useMaterial3 is a property of ThemeData that enables the use of Material Design 3 features in the app. It is set to true, which means that the app will use Material Design 3 components and styles.
        colorSchemeSeed: Colors.blue, //colorSchemeSeed is a property of ThemeData that defines the primary color of the app. It is set to Colors.blue, which means that the app will use blue as its primary color.
        brightness: Brightness.light, //brightness is a property of ThemeData that defines the overall brightness of the app. It is set to Brightness.light, which means that the app will use a light color scheme.
      ),
      initialRoute: AppRoutes.main, //initialRoute is a property of MaterialApp that defines the first route to be displayed when the app starts. It is set to AppRoutes.mainScreen, which means that the MainScreen widget will be displayed first.
      routes: AppRoutes.routes, //routes is a property of MaterialApp that defines the available routes in the app. It is set to AppRoutes.routes, which means that the routes defined in the AppRoutes class will be used in the app.
    );
  }
}

