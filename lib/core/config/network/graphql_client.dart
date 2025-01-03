import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientConfig {
  static GraphQLClient getClient(String baseUrl) {
    final HttpLink httpLink = HttpLink(baseUrl);

    return GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
  }
}
