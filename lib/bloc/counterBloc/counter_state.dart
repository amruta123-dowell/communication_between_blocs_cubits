part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int incrementCount;
  const CounterState({required this.incrementCount});

  @override
  List<Object> get props => [incrementCount];
  factory CounterState.initial() {
    return const CounterState(incrementCount: 1);
  }

  @override
  String toString() {
    return "count is $incrementCount";
  }

  CounterState copyWith({int? count}) {
    return CounterState(incrementCount: count ?? incrementCount);
  }
}
