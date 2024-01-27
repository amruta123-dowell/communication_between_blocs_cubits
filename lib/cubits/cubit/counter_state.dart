part of 'counter_cubit.dart';

@immutable
class CounterState extends Equatable {
  final int incrementCount;

  const CounterState({required this.incrementCount});

  @override
  List<Object?> get props => [incrementCount];

  factory CounterState.initial() {
    return const CounterState(incrementCount: 0);
  }

  CounterState copyWith({int? count}) {
    return CounterState(incrementCount: count ?? incrementCount);
  }
}
