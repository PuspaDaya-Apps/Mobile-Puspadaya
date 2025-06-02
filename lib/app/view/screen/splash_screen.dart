import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../config/screen_config/image_config.dart';
import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';
import '../../../route/route_name.dart';
import '../../feature/authorization/bloc/blocAuthentication/authentication_bloc.dart';
import '../../feature/authorization/bloc/blocAuthorization/authorization_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      BlocProvider.of<AuthenticationBloc>(context).add(AppStartEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        debugPrint(state.toString());
        if (state is AuthenticationFirstTime) {
          BlocProvider.of<AuthorizationBloc>(context)
              .add(AuthorizationFalseEvent());
          Navigator.pushReplacementNamed(context, ONBOARDING);
        }
        if (state is AuthenticationTrue) {
          BlocProvider.of<AuthorizationBloc>(context)
              .add(AuthorizationTrueEvent());
          Navigator.pushReplacementNamed(context, HOME);
        }
        if (state is AuthenticationFalse) {
          BlocProvider.of<AuthorizationBloc>(context)
              .add(AuthorizationFalseEvent());
          Navigator.pushReplacementNamed(context, LOGIN);
        }
      },
      child: Scaffold(
        backgroundColor: bluePrimaryMain,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: SizeConfig.calWidthMultiplier(97.5),
                child: Image.asset(
                  logoBig,
                  width: SizeConfig.calMultiplierImage(125),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.calHeightMultiplier(25)),
                child: Text(
                  "V. 2.0.2",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.calMultiplierText(18),
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
