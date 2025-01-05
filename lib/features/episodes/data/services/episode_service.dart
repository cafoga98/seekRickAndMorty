import 'package:seek_rickandmorty/core/config/network/gql_api_config.dart';
import 'package:seek_rickandmorty/features/episodes/data/episode_queries.dart' as query;
import 'package:seek_rickandmorty/features/episodes/data/services/i_episode_service.dart';

class EpisodeService implements IEpisodeService {
  final GraphQLApiConfig apiConfig;

  EpisodeService({required this.apiConfig});

  @override
  Future<Map<String, dynamic>> fetchEpisodeByPage(int page) async {
    final variables = {"page": page};
    return await apiConfig.runQuery(
      query.fetchEpisodesByPage,
      variables: variables,
    );
  }

  @override
  Future<Map<String, dynamic>> fetchEpisodeByName(String name) async {
    final variables = {"name": name};
    return await apiConfig.runQuery(
      query.fetchEpisodesByName,
      variables: variables,
    );
  }
}
