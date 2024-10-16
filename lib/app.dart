import 'package:flutter/material.dart';

import 'config/screen_config/size_config.dart';
import 'config/theme/theme.dart';
import 'route/route_name.dart';
import 'route/route_page.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const BuildApp();
  }
}

class BuildApp extends StatelessWidget {
  const BuildApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
      title: 'Puspadaya',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      onGenerateRoute: MyRoute.generateRoute,
      initialRoute: SPLASHSCREEN,
    );
  }
}