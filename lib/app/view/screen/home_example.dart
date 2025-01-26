import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../route/route_name.dart';
import '../../feature/authorization/bloc/blocAuthentication/authentication_bloc.dart';
import '../../feature/authorization/bloc/blocAuthorization/authorization_bloc.dart';

class HomeExample extends StatefulWidget {
  const HomeExample({super.key});

  @override
  State<HomeExample> createState() => _HomeExampleState();
}

class _HomeExampleState extends State<HomeExample> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthorizationBloc, AuthorizationState>(listener:(context, stateAuthorization) {
          if(stateAuthorization is AuthorizationFalse) {
            debugPrint("step 4");
            Navigator.pushNamed(context, LOGIN);
            debugPrint("step 5");
          }
        }),
        BlocListener<AuthenticationBloc, AuthenticationState>(listener:(context, stateAuthentication) {
          if (stateAuthentication is LogoutSuccess) {
            debugPrint("step 1");
            BlocProvider.of<AuthorizationBloc>(context).add(AuthorizationFalseEvent());
            debugPrint("step 2");
          }
          if (stateAuthentication is LogoutFailed) {
            debugPrint(stateAuthentication.error);
          }
          if (stateAuthentication is AuthenticationFalse) {
            debugPrint("step 1");
            BlocProvider.of<AuthorizationBloc>(context).add(AuthorizationFalseEvent());
            debugPrint("step 2");
          }
        }),
      ],
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LogoutEvent());
            }, 
            child: const Text(
              "Logout"
            )
          ),
        )
      ),
    );
  }
}