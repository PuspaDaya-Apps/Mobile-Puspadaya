import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:puspadaya/config/validator/form_error_provider.dart';
import 'package:puspadaya/config/validator/form_field_data.dart';
import 'package:puspadaya/config/validator/validation_scroll.dart';
import 'package:puspadaya/utils/logger/logger.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/screen_config/image_config.dart';
import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../route/route_name.dart';
import '../../../view/widget/textfield_password_login_widget.dart';
import '../../../view/widget/textfield_username_login_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../authorization/bloc/blocAuthorization/authorization_bloc.dart';
import 'lupa_kata_sandi_screen.dart';
import '../bloc/loginBloc/login_bloc.dart';
import '../bloc/rememberMeCubit/remember_me_cubit.dart';
import '../model/login_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

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
  final _formKey = GlobalKey<FormState>();
  final List<String> image = <String>[login1Vector, login2Vector];

  late TextEditingController usernameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  late FocusNode usernameFocusNode = FocusNode();
  late FocusNode passwordFocusNode = FocusNode();

  final GlobalKey<FormFieldState> usernameKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

  bool ingatSaya = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RememberMeCubit>(context).loadAccount();
  }

  // ! function ini akan secara otomatis tertrigger ketika ada error dari client validator maupun server validator
  void _submitForm(LoginBloc loginBloc) {
    // Langkah 1: Jalankan validasi form
    if (_formKey.currentState!.validate()) {
      // ! form valid save to local
      if (usernameController.text == "" || passwordController.text == "") {
        loginBloc.add(NullErrorEvent());
      } else {
        loginBloc.add(SendLoginEvent(
            rememberAccount: ingatSaya,
            loginModel: LoginModel(
                username: usernameController.text,
                password: passwordController.text)));
      }
    } else {
      // JIKA FORM TIDAK VALID
      print('Form tidak valid. Mencari error pertama...');

      // Buat daftar field Anda secara berurutan sesuai tampilan di UI
      // Ini PENTING agar scroll menuju ke error PALING ATAS
      final Map<GlobalKey<FormFieldState>, FocusNode> fieldMap = {
        usernameKey: usernameFocusNode,
        passwordKey: passwordFocusNode,
      };
      // logger.d(fieldMap);
      ValidationScroll.validationScrollFirstClient(fieldMap);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    usernameKey.currentState?.dispose();
    passwordKey.currentState?.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final authorizationBloc = BlocProvider.of<AuthorizationBloc>(context);

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
                                  topRight: Radius.circular(20))),
                          child: BlocConsumer<RememberMeCubit, RememberMeState>(
                            listener: (context, accountState) {
                              if (accountState is LoadAccountSuccessState) {
                                debugPrint("buat ulang");
                                usernameController = TextEditingController(
                                    text: accountState.loginModel.username);
                                passwordController = TextEditingController(
                                    text: accountState.loginModel.password);
                                ingatSaya = true;
                              }
                            },
                            builder: (context, accountState) {
                              debugPrint(accountState.toString());
                              if (accountState is LoadAccountProccessState) {
                                return SizedBox(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: MediaQuery.sizeOf(context).height,
                                  child: Center(
                                    child: SpinKitThreeBounce(
                                      color: bluePrimaryMain,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: BlocBuilder<LoginBloc, LoginState>(
                                    // buildWhen: (_, state) => state is LoginFailedFormState || state is LoginSuccessState,
                                    builder: (context, state) {
                                      logger.d('state saat ini $state');
                                      Map<String, List<String>>? errors;
                                      if (state is LoginFailedFormState) {
                                        errors = state.error; 
                                        final fieldMap =
                                            <String, FormFieldData>{
                                          'username': FormFieldData(
                                              key: usernameKey,
                                              focusNode:
                                                  usernameFocusNode), //username dan password harus sama dengan error validate server
                                          'password': FormFieldData(
                                              key: passwordKey,
                                              focusNode: passwordFocusNode),
                                        
                                        };
                                        usernameKey.currentState?.validate();
                                        passwordKey.currentState?.validate();
                                        ValidationScroll
                                            .validationScrollFirstServer(
                                                context,
                                                errors ?? {},
                                                fieldMap);
                                      }
                                      return Form(
                                        key: _formKey,
                                        child: FormErrorProvider(
                                          errors: errors,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              TextFieldUsernameLoginWidget(
                                                onTap: () {
                                                  context
                                                      .read<LoginBloc>()
                                                      .add(ResetFormEvent());
                                                },
                                                fieldName: "username",
                                                clientValidators: [
                                                  FormBuilderValidators.required(
                                                      errorText:
                                                          "Isi Terlebih Dahulu"),
                                                  FormBuilderValidators.numeric(
                                                      errorText: 'Harus angka'),
                                                ],
                                                focusNode: usernameFocusNode,
                                                formFieldKey: usernameKey,
                                                title: 'Username',
                                                keyboard: TextInputType.number,
                                                hintText:
                                                    'Masukan Nomor Telepon',
                                                textController:
                                                    usernameController,
                                              ),
                                              SizedBox(
                                                height: SizeConfig
                                                    .calHeightMultiplier(15),
                                              ),
                                              TextFieldPasswordLoginWidget(
                                                onTap: () {
                                                  context
                                                      .read<LoginBloc>()
                                                      .add(ResetFormEvent());
                                                },
                                                fieldName: "password",
                                                clientValidators: [
                                                  FormBuilderValidators
                                                      .required(
                                                    errorText:
                                                        "password wajib diisini",
                                                  ),
                                                ],
                                                focusNode: passwordFocusNode,
                                                formFieldKey: passwordKey,
                                                title: 'Kata Sandi',
                                                keyboard: TextInputType
                                                    .visiblePassword,
                                                hintText: 'Masukan Kata Sandi',
                                                textController:
                                                    passwordController,
                                              ),
                                              SizedBox(
                                                  height: SizeConfig
                                                      .calHeightMultiplier(8)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  // CheckboxLoginWidget(ingatSaya: ingatSaya),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Transform.scale(
                                                        scale: 1.3,
                                                        child: Checkbox(
                                                            value: ingatSaya,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            side: const BorderSide(
                                                                width: 1,
                                                                color:
                                                                    stroke10),
                                                            activeColor:
                                                                stroke10,
                                                            checkColor:
                                                                Colors.white,
                                                            visualDensity:
                                                                const VisualDensity(
                                                                    horizontal:
                                                                        -4,
                                                                    vertical:
                                                                        -4),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                ingatSaya =
                                                                    !ingatSaya;
                                                              });
                                                            }),
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text('Ingat Saya',
                                                          style: TextStyle(
                                                              color:
                                                                  textPrimary10,
                                                              fontSize: SizeConfig
                                                                  .calMultiplierText(
                                                                      12),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400))
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                      onTap: () async {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                const Center(
                                                                    child:
                                                                        LupaKataSandiView()));
                                                      },
                                                      child: Text(
                                                        'Lupa Kata Sandi?',
                                                        style: TextStyle(
                                                          color: textUrgent,
                                                          fontSize: SizeConfig
                                                              .calMultiplierText(
                                                                  13),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationColor:
                                                              textUrgent,
                                                        ),
                                                      ))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )),
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
                                          showTopSnackBar(
                                              Overlay.of(context),
                                              animationDuration: const Duration(
                                                  milliseconds: 600),
                                              displayDuration: const Duration(
                                                  milliseconds: 2200),
                                              reverseAnimationDuration:
                                                  const Duration(
                                                      milliseconds: 300),
                                              TopSnackbarWidget()
                                                  .error(state.error));
                                        }
                                        if (state is LoginSuccessState) {
                                          loginBloc.add(GetCurrentUserEvent(
                                              state.accessToken));
                                        }
                                        if (state is NullErrorState) {
                                          showTopSnackBar(
                                              Overlay.of(context),
                                              animationDuration: const Duration(
                                                  milliseconds: 60),
                                              displayDuration: const Duration(
                                                  milliseconds: 2200),
                                              reverseAnimationDuration:
                                                  const Duration(
                                                      milliseconds: 300),
                                              TopSnackbarWidget()
                                                  .warning(state.error));
                                        }
                                        //getUser
                                        if (state is CurrentUserSuccesState) {
                                          authorizationBloc
                                              .add(AuthorizationTrueEvent());
                                          Navigator.pushReplacementNamed(
                                              context, HOME);
                                        }
                                        if (state is CurrentUserFailedState) {
                                          showTopSnackBar(
                                              Overlay.of(context),
                                              animationDuration: const Duration(
                                                  milliseconds: 600),
                                              displayDuration: const Duration(
                                                  milliseconds: 2200),
                                              reverseAnimationDuration:
                                                  const Duration(
                                                      milliseconds: 300),
                                              TopSnackbarWidget()
                                                  .error(state.error));
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state is LoginProcessState ||
                                            state is LoginSuccessState ||
                                            state is CurrentUserProccesState ||
                                            state is CurrentUserSuccesState) {
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
                                              _submitForm(loginBloc);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: buttonPriamary,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: SizeConfig
                                                        .calWidthMultiplier(10),
                                                    vertical: SizeConfig
                                                        .calHeightMultiplier(
                                                            10))),
                                            child: Text(
                                              'Login',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: SizeConfig
                                                      .calMultiplierText(15),
                                                  fontWeight: FontWeight.w500),
                                            ));
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
