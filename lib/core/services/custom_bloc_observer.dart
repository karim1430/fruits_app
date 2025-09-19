import 'dart:developer';

import 'package:bloc/bloc.dart';

class CustomBlocObserver extends BlocObserver {
  // @override
  // void onEvent(Bloc bloc, Object? event) {
  //   super.onEvent(bloc, event);
  //   print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  // }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  // }

  // @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  //   print('onError -- bloc: ${bloc.runtimeType}, error: $error');
  //   super.onError(bloc, error, stackTrace);
  // }
}
