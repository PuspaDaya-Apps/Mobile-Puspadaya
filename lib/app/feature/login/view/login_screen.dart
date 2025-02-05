import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/screen_config/image_config.dart';
import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../route/route_name.dart';
import '../../../view/widget/textfield_password_login_widget.dart';
import '../../../view/widget/textfield_username_login_widget.dart';
import '../../lupaKataSandi/view/lupa_kata_sandi_screen.dart';
import '../bloc/loginBloc/login_bloc.dart';
import '../bloc/rememberMeCubit/remember_me_cubit.dart';
import '../model/login_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RememberMeCubit(),
        ),
      ],
      child: const LoginScreenView(),
    );
  }
}

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  final List<String> image = <String>[login1Vector, login2Vector];

  late TextEditingController usernameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  bool ingatSaya = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RememberMeCubit>(context).loadAccount();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      backgroundColor: bluePrimaryMain,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: SizeConfig.calHeightMultiplier(381),
                        child: CarouselSlider.builder(
                            itemCount: image.length,
                            disableGesture: true,
                            options: CarouselOptions(
                                viewportFraction: 1.0,
                                autoPlay: true,
                                pauseAutoPlayOnTouch: true,
                                autoPlayAnimationDuration:
                                    const Duration(seconds: 3),
                                autoPlayInterval: const Duration(seconds: 8),
                                autoPlayCurve: Curves.ease,
                                enableInfiniteScroll: true,
                                onScrolled: null,
                                onPageChanged: null),
                            itemBuilder: (context, index, realIndex) =>
                                Image.asset(
                                  image[index],
                                  width: SizeConfig.calWidthMultiplier(335),
                                  height: SizeConfig.calHeightMultiplier(250),
                                  fit: BoxFit.contain,
                                )),
                      ),
                      Expanded(
                        child: Container(
                          // height: MediaQuery.sizeOf(context).height,
                          padding: EdgeInsets.only(
                              top: SizeConfig.calHeightMultiplier(35),
                              bottom: SizeConfig.calHeightMultiplier(60),
                              right: SizeConfig.calWidthMultiplier(25),
                              left: SizeConfig.calWidthMultiplier(25)),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)
                            )
                          ),
                          child: BlocBuilder<RememberMeCubit, RememberMeState>(
                            builder: (context, accountState) {
                              if(accountState is LoadAccountProccessState) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: bluePrimaryMain,
                                  ),
                                );
                              }
                              if (accountState is LoadAccountSuccessState) {
                                usernameController = TextEditingController(text: accountState.loginModel.username);
                                passwordController = TextEditingController(text: accountState.loginModel.password);
                                ingatSaya = true; 
                              }
                              debugPrint("buat ulang");                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        TextFieldUsernameLoginWidget(
                                          key: const Key('Username'),
                                          title: 'Username',
                                          keyboard: TextInputType.number,
                                          hintText: 'Masukan Nomor Telepon',
                                          textController: usernameController,
                                          errortext: null,
                                        ),
                                        SizedBox(
                                          height: SizeConfig.calHeightMultiplier(15),
                                        ),
                                        TextFieldPasswordLoginWidget(
                                          key: const Key('password'),
                                          title: 'Kata Sandi',
                                          keyboard: TextInputType.visiblePassword,
                                          hintText: 'Masukan Kata Sandi',
                                          textController: passwordController,
                                          errortext: null,
                                        ),
                                        SizedBox(
                                          height:SizeConfig.calHeightMultiplier(8)
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                          // CheckboxLoginWidget(ingatSaya: ingatSaya),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Transform.scale(
                                                  scale: 1.3,
                                                  child: Checkbox(
                                                    value: ingatSaya,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5)
                                                    ),
                                                    side: const BorderSide(
                                                      width: 1,
                                                      color: stroke10
                                                    ),
                                                    activeColor: stroke10,
                                                    checkColor: Colors.white,
                                                    visualDensity: const VisualDensity(
                                                      horizontal: -4,
                                                      vertical: -4
                                                    ),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        ingatSaya = !ingatSaya;
                                                      });
                                                    }
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                Text('Ingat Saya',
                                                  style: TextStyle(
                                                    color: textPrimary10,
                                                    fontSize: SizeConfig.calMultiplierText(12),
                                                    fontWeight:FontWeight.w400
                                                  )
                                                )
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) => const Center(
                                                    child:LupaKataSandiScreen()
                                                  )
                                                );
                                              },
                                              child: Text(
                                                'Lupa Kata Sandi?',
                                                style: TextStyle(
                                                  color: textUrgent,
                                                  fontSize: SizeConfig.calMultiplierText(13),
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration.underline,
                                                  decorationColor: textUrgent,
                                                ),
                                              )
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: SizeConfig.calHeightMultiplier(40),
                                    margin: EdgeInsets.only(
                                        top:
                                            SizeConfig.calHeightMultiplier(20)),
                                    child: BlocConsumer<LoginBloc, LoginState>(
                                      listener: (context, state) {
                                        debugPrint(state.toString());
                                        //login
                                        if (state is LoginFailedState) {
                                          debugPrint(state.error);
                                        }
                                        if (state is LoginSuccessState) {
                                          loginBloc.add(GetCurrentUserEvent(
                                              state.accessToken));
                                        }
                                        if (state is NullErrorState) {
                                          debugPrint(state.error);
                                        }

                                        //getUser
                                        if (state is CurrentUserSuccesState) {
                                          Navigator.pushReplacementNamed(
                                              context, HOME);
                                        }
                                        if (state is CurrentUserFailedState) {
                                          debugPrint(state.error);
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state is LoginProcessState) {
                                          return ElevatedButton(
                                              onPressed: null,
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          SizeConfig.calWidthMultiplier(
                                                              10),
                                                      vertical:
                                                          SizeConfig.calHeightMultiplier(
                                                              10))),
                                              child: Center(
                                                  child: SizedBox(
                                                      height: SizeConfig
                                                          .calHeightMultiplier(20),
                                                      width: SizeConfig.calHeightMultiplier(20),
                                                      child: const CircularProgressIndicator())));
                                        }
                                        return ElevatedButton(
                                          onPressed: () {
                                            if (usernameController.text ==
                                                    "" ||
                                                passwordController.text ==
                                                    "") {
                                              loginBloc.add(NullErrorEvent());
                                            } else {
                                              loginBloc.add(SendLoginEvent(
                                                  rememberAccount: ingatSaya,
                                                  loginModel: LoginModel(
                                                    username: usernameController.text,
                                                    password:passwordController.text
                                                  )
                                                )
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: buttonPriamary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: SizeConfig.calWidthMultiplier(10),
                                              vertical: SizeConfig.calHeightMultiplier(10)
                                            )
                                          ),
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: SizeConfig.calMultiplierText(15),
                                              fontWeight: FontWeight.w500
                                            ),
                                          )
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ]
                  ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
