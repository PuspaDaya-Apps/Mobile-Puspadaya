import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:puspadaya/utils/logger/logger.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? _subscription;
  Timer? _offlineTimer;
  bool isDisconnected = false;
  final connectionChecker = InternetConnectionChecker.instance;
  InternetBloc() : super(InternetInitial()) {
    on<InternetObserve>(_observe);
    on<InternetNotify>(_notifyStatus);
    on<CheckInternet>(_checkInternetStatus);
  }
  void _checkInternetStatus(
      CheckInternet event, Emitter<InternetState> emit) async {
    emit(InternetLoading());
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;
    if (isConnected) {
      emit(InternetConnected(showPopup: true, fromChecked: true));
    } else {
      emit(InternetDisconnected(showPopup: true, fromChecked: true));
    }
  }

  void _observe(InternetObserve event, Emitter<InternetState> emit) {
    _subscription = checkInternetEvery5Seconds().listen((
      InternetConnectionStatus status,
    ) {
      logger.d('Connection Status: $status');
      add(
        InternetNotify(
          isConnected: status == InternetConnectionStatus.connected,
        ),
      );
    });
  }

  Future<void> _notifyStatus(
      InternetNotify event, Emitter<InternetState> emit) async {
    if (event.isConnected) {
      isDisconnected = false;
      _offlineTimer?.cancel();
      emit(InternetConnected(showPopup: false, fromChecked: false));
    } else if (!isDisconnected) {
      isDisconnected = true;
      emit(InternetDisconnected(showPopup: false, fromChecked: false));

      // Tunggu 5 detik sebelum menampilkan popup
      await Future.delayed(const Duration(seconds: 5));

      if (isDisconnected) {
        // Verifikasi status masih disconnected
        final currentStatus = await connectionChecker.connectionStatus;
        if (currentStatus == InternetConnectionStatus.disconnected) {
          emit(InternetDisconnected(showPopup: false, fromChecked: false));
        }
      }
    }
  }

  Stream<InternetConnectionStatus> checkInternetEvery5Seconds() {
    return Stream.periodic(const Duration(seconds: 5), (_) {
      // logger.d("connection internet is ${connectionChecker.hasConnection}");
      return connectionChecker.hasConnection;
    }).asyncMap((_) async {
      return await connectionChecker.connectionStatus;
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _offlineTimer?.cancel();
    return super.close();
  }
}
