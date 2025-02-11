import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';
import 'dart:async';
import 'package:puspadaya/utils/logger/logger.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../login/model/lupa_kata_sandi_model.dart';
import '../bloc/kode_otp_bloc.dart';
import '../model/kode_otp_model.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.nomorTelepon});

  final String nomorTelepon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KodeOtpBloc(),
      child: OtpScreenView(
        nomorTelepon: nomorTelepon,
      ),
    );
  }
}

class OtpScreenView extends StatefulWidget {
  const OtpScreenView({super.key, required this.nomorTelepon});
  final String nomorTelepon;

  @override
  State<OtpScreenView> createState() => _OtpScreenViewState();
}

class _OtpScreenViewState extends State<OtpScreenView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();

  late Timer _timer;
  int _remainingSeconds = 900;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer.cancel();
          showTopSnackBar(
              Overlay.of(context),
              animationDuration: const Duration(milliseconds: 600),
              displayDuration: const Duration(milliseconds: 2200),
              reverseAnimationDuration: const Duration(milliseconds: 300),
              TopSnackbarWidget()
                  .error("Waktu Pengisian Kode OTP Telah Berakhir "));
          Navigator.pushReplacementNamed(context, LOGIN);
        }
      });
    });
  }

  // void resetTimer() {
  //   setState(() {
  //     _timer.cancel();
  //     _remainingSeconds = 900;
  //     startTimer();
  //   });
  // }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get formattedTime {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final kodeOtpBloc = BlocProvider.of<KodeOtpBloc>(context);

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: AppBar(
        backgroundColor: backgroundWhite10,
        title: const Text(
          'OTP',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.calWidthMultiplier(20),
          vertical: SizeConfig.calHeightMultiplier(16),
        ),
        child: BlocConsumer<KodeOtpBloc, KodeOtpState>(
          listener: (context, state) {
            debugPrint(state.toString());
            if (state is SendOTPSuccessState) {
              Navigator.pop(context);
              Navigator.pushNamed(context, RESET_PASSWORD,
                  arguments: pinController.text);
            }
            if (state is SendOTPFailedState) {
              debugPrint(state.toString());
            }
          },
          builder: (context, state) {
            return ButtonPrimary(
              color: bluePrimaryMain,
              mainButton: () {
                if (formKey.currentState!.validate()) {
                  logger.d(pinController.text);
                  kodeOtpBloc.add(SendOTP(KodeOtpModel(kodeOtp: pinController.text)));
                }
              },
              mainButtonMessage: 'Verifikasi Kode OTP',
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.calWidthMultiplier(24)),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.calHeightMultiplier(50)),
                  Center(
                    child: Image(
                      height: SizeConfig.calHeightMultiplier(250),
                      image: AssetImage(
                        oTPCodeImage,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                  const Text(
                    'Masukan Kode OTP',
                    style: TextStyle(
                      color: bluePrimary30,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                  RichText(
                    text: TextSpan(
                      text: '5 digit kode OTP sudah kami kirimkan ke ',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: widget.nomorTelepon,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(25)),
                  // Pinput untuk OTP
                  Center(
                    child: Pinput(
                      controller: pinController,
                      length: 5,
                      separatorBuilder: (index) =>
                          SizedBox(width: SizeConfig.calWidthMultiplier(10)),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'PIN tidak boleh kosong';
                        }
                        if (value.length != 5) {
                          return 'PIN harus 5 digit';
                        }
                        if (!RegExp(r'^\d+$').hasMatch(value)) {
                          return 'PIN hanya boleh angka';
                        }
                        return null;
                      },
                      defaultPinTheme: PinTheme(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.width * 0.15,
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(30, 60, 87, 1),
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 2,
                            color: bluePrimaryMain,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(12)),
                  Row(
                    children: [
                      Text(
                        'Belum menerima kode? ',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BlocConsumer<KodeOtpBloc, KodeOtpState>(
                        listener: (context, state) {
                          debugPrint(state.toString());
                          if(state is GetOTPSuccessState) {
                            debugPrint('success get again');
                            setState(() {
                              _remainingSeconds = 900;
                            });
                          }
                          if(state is GetOTPFailedState) {
                            debugPrint(state.toString());
                          }
                        },
                        builder: (context, state) {
                          return GestureDetector(
                            child: Text(
                              'Kirim Ulang',
                              style: TextStyle(
                                color: bluePrimary30,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              kodeOtpBloc.add(GetOTP(
                                LupaKataSandiModel(noTelepon: widget.nomorTelepon)
                              ));
                            }
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(30)),
                  const Center(
                    child: Text(
                      'Sisa Waktu :',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  timerOtp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget timerOtp() {
    return Center(
      child: Text(
        formattedTime,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: redPrimaryMain,
        ),
      ),
    );
  }
}
