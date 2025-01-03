import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as gql;
import 'package:seek_rickandmorty/core/config/error_handle/exceptions.dart';
import 'package:seek_rickandmorty/core/config/error_handle/failures.dart';
import 'package:seek_rickandmorty/generated/l10n.dart';

Future<Either<Failure, T>> handleFailures<T>(
    Future<T> Function() action) async {
  try {
    final response = await action();
    return right(response);
  } on NoConnectionException catch (e) {
    return left(Failure.noConnection(message: e.message));
  } on NoDataException catch (e) {
    return left(Failure.noData(message: e.message));
  } on UnauthorisedException catch (e) {
    return left(Failure.unauthorised(message: e.message));
  } on BadRequestException catch (e) {
    return left(Failure.badRequest(message: e.message));
  } on ServerException catch (e) {
    return left(Failure.serverFailure(message: e.message));
  } on gql.OperationException catch (e) {
    final message = e.graphqlErrors.isNotEmpty
        ? e.graphqlErrors.map((err) => err.message).join(", ")
        : e.linkException?.toString() ?? S.current.unknownError;

    if (e.linkException is gql.NetworkException) {
      return left(Failure.noConnection(message: message));
    } else if (e.linkException is gql.HttpLinkServerException) {
      return left(
        Failure.serverFailure(
          message:
              "${S.current.serverResponseCode} ${(e.linkException as gql.HttpLinkServerException).response.statusCode}: $message",
        ),
      );
    } else {
      return left(
        Failure.unknown(message: message),
      );
    }
  } catch (e) {
    return left(
      Failure.noData(
        message: e.toString(),
      ),
    );
  }
}
