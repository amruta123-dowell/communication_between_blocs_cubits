import 'package:bloc/bloc.dart';

class AppObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print("bloc The event is --> ${bloc.runtimeType}, $event");
    // TODO: implement onEvent
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(
        "Bloc bloc: ${bloc.runtimeType} error: $error stackTrace: $stackTrace");
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print("Bloc changed bloc: ${bloc.runtimeType} change : $change");
    super.onChange(bloc, change);
    // TODO: implement onChange
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // TODO: implement onChange
    print("Bloc changed bloc: ${bloc.runtimeType} change : $transition");
  }
}
