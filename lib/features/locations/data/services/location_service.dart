import 'package:seek_rickandmorty/core/config/network/gql_api_config.dart';
import 'package:seek_rickandmorty/features/locations/data/location_queries.dart' as query;
import 'package:seek_rickandmorty/features/locations/data/services/i_location_service.dart';

class LocationService implements ILocationService {
  final GraphQLApiConfig apiConfig;

  LocationService({required this.apiConfig});

  @override
  Future<Map<String, dynamic>> fetchLocationByPage(int page) async {
    final variables = {"page": page};
    return await apiConfig.runQuery(
      query.fetchEpisodesByPage,
      variables: variables,
    );
  }

  @override
  Future<Map<String, dynamic>> fetchLocationByName(String name) async {
    final variables = {"name": name};
    return await apiConfig.runQuery(
      query.fetchLocationByName,
      variables: variables,
    );
  }
}
