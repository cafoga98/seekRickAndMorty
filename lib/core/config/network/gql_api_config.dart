import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:seek_rickandmorty/core/config/error_handle/exceptions.dart';
import 'package:seek_rickandmorty/core/config/network/connectivity_checker.dart';
import 'package:seek_rickandmorty/generated/l10n.dart';

/// GraphQLApiConfig Class
///
/// Manages the configuration and handling of GraphQL queries and mutations.
/// It handles network connectivity, timeouts, and error management.
///
/// Example usage:
///
/// ```dart
/// final graphqlConfig = GraphQLApiConfig(
///   connectivityChecker: ConnectivityChecker(),
///   client: GraphQLClientConfig.getClient(baseUrl: "https://api.example.com"),
/// );
///
/// final data = await graphqlConfig.runQuery(query, variables);
/// ```
class GraphQLApiConfig {
  final ConnectivityChecker connectivityChecker;
  final GraphQLClient client;

  GraphQLApiConfig({
    required this.connectivityChecker,
    required this.client,
  });

  /// Executes a GraphQL query.
  ///
  /// [query] is the GraphQL query string.
  /// [variables] is an optional map of variables to pass to the query.
  ///
  /// Throws exceptions for network issues, timeouts, or errors in the response.
  Future<Map<String, dynamic>> runQuery(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      // Check for internet connectivity
      if (await connectivityChecker.checkingConnection() == false) {
        throw NoConnectionException(S.current.connectionError);
      }

      final options = QueryOptions(
        document: gql(query),
        variables: variables ?? {},
      );

      final result = await client.query(options).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          throw TimeOutException(S.current.connectionTimeout);
        },
      );

      // Handle GraphQL response errors
      if (result.hasException) {
        throw HandleOperationException(result.exception);
      }

      return result.data ?? {};
    } catch (e) {
      rethrow;
    }
  }

  /// Executes a GraphQL mutation.
  ///
  /// [mutation] is the GraphQL mutation string.
  /// [variables] is an optional map of variables to pass to the mutation.
  ///
  /// Throws exceptions for network issues, timeouts, or errors in the response.
  Future<Map<String, dynamic>> runMutation(
    String mutation, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      // Check for internet connectivity
      if (await connectivityChecker.checkingConnection() == false) {
        throw NoConnectionException(S.current.connectionError);
      }

      final options = MutationOptions(
        document: gql(mutation),
        variables: variables ?? {},
      );

      final result = await client.mutate(options).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          throw TimeOutException(S.current.connectionTimeout);
        },
      );

      // Handle GraphQL response errors
      if (result.hasException) {
        throw HandleOperationException(result.exception);
      }

      return result.data ?? {};
    } catch (e) {
      rethrow;
    }
  }
}
