part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}
class CounterChangeEvent extends CounterEvent{}


class CounterChangeEventWithArg extends CounterEvent{
  final int count;

 const CounterChangeEventWithArg({required this.count});
  
}