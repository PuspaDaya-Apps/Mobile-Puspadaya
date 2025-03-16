part of 'select_chart_cubit.dart';

sealed class SelectChartState extends Equatable {
  const SelectChartState();

  @override
  List<Object> get props => [];
}

final class SelectChartInitial extends SelectChartState {}
final class SelectChartLoading extends SelectChartState {}
final class SelectChartSuccess extends SelectChartState {
  final List<ChartDataModel> data;

  const SelectChartSuccess(this.data);

  @override
  List<Object> get props => [data];
}
final class SelectChartFailed extends SelectChartState {
  final String message;

  const SelectChartFailed(this.message);

  @override
  List<Object> get props => [message];
}
final class TokenExpiredState extends SelectChartState {}