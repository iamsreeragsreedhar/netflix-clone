abstract class Failure {
  final String message;

  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('Something went wrong. Please check your internet connection.');
}

class ServerFailure extends Failure {
  ServerFailure() : super('Server error. Please try again later.');
}

class UnknownFailure extends Failure {
  UnknownFailure() : super('Something went wrong. Please try again.');
}
