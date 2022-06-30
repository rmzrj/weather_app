import 'package:dartz/dartz.dart' show Either, Left, Right;

import '../../main.dart' show logger;
import '../data/models/errors/failures.dart';

typedef RemoteExecutable<T> = Future<T> Function();

Future<Either<Failure, T>> repoExecute<T>(RemoteExecutable<T> func) async {
  try {
    final T result = await func();
    return Right(result);
  } on TypeError catch (exception) {
    logger.error(exception);
    return const Left(Failure.network(message: 'Failed to process data.'));
  } catch (exception) {
    logger.error(exception);
    return const Left(Failure.unhandled(message: 'Unexpected Failure'));
  }
}
