import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  String? msg;

  ServerFailure({this.msg});

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class NoConnectionFailure extends Failure {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
