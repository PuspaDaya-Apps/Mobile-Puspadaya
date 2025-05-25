part of 'internet_bloc.dart';

sealed class InternetState extends Equatable {
  bool get isDisconnected;
  bool get fromChecked;

  @override
  List<Object> get props => [isDisconnected, fromChecked];
}
final class InternetLoading extends InternetState {
  @override
  bool get isDisconnected => false;
  @override
  bool get fromChecked => false;
}

final class InternetInitial extends InternetState {
  @override
  bool get isDisconnected => false;
  @override
  bool get fromChecked => false;
}

class InternetConnected extends InternetState {
  final bool showPopup; // Added for consistency and control
  @override
  final bool fromChecked;
  InternetConnected({required this.showPopup, required this.fromChecked});

  @override
  bool get isDisconnected => false;
  

  @override
  List<Object> get props =>
      [isDisconnected, showPopup, fromChecked]; // Add showPopup
}

class InternetDisconnected extends InternetState {
  final bool showPopup;
  @override
  final bool fromChecked;
  InternetDisconnected({required this.showPopup, required this.fromChecked});
  @override
  bool get isDisconnected => true;
  @override
  List<Object> get props =>
      [isDisconnected, showPopup, fromChecked]; // Add showPopup
}
