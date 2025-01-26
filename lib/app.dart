import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/feature/authorization/bloc/blocAuthentication/authentication_bloc.dart';
import 'app/feature/authorization/bloc/blocAuthorization/authorization_bloc.dart';
import 'config/screen_config/size_config.dart';
import 'config/theme/theme.dart';
import 'route/route_name.dart';
import 'route/route_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AuthorizationBloc()),
      BlocProvider(create: (context) => AuthenticationBloc()),
    ], child: const BuildApp());
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
      // home: const AnakListScreen(),
    );
  }
}
