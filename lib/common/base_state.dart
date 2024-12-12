import 'package:news_app/result.dart';

sealed class BaseState<T>{}

class SuccessState<T> extends BaseState<T>{
  T date;
  SuccessState({required this.date});
}

class LoadingState<T> extends BaseState<T>{
  String? loadingMessage;
  LoadingState({this.loadingMessage});
}

class ErrorState<T> extends BaseState<T>{
  ServerError? serverError;
  Error? error;
  ErrorState({this.serverError, this.error});
}