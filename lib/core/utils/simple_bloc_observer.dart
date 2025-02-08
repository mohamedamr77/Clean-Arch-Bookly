import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());

  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('onClose - ${bloc.runtimeType}');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('onCreate - ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError - ${bloc.runtimeType}: $error');
    debugPrint(stackTrace.toString());
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('onEvent - ${bloc.runtimeType}: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('onTransition - ${bloc.runtimeType}: $transition');
  }
}