import 'package:seek_rickandmorty/core/config/network/gql_api_config.dart';
import 'package:seek_rickandmorty/features/characters/data/queries.dart'
    as query;
import 'package:seek_rickandmorty/features/characters/data/services/i_character_service.dart';

class CharacterService implements ICharacterService {
  final GraphQLApiConfig apiConfig;

  CharacterService({required this.apiConfig});

  @override
  Future<Map<String, dynamic>> fetchCharactersByPage(int page) async {
    final variables = {"page": page};
    return await apiConfig.runQuery(
      query.fetchCharactersByPage,
      variables: variables,
    );
  }

  @override
  Future<Map<String, dynamic>> fetchCharactersByName(String name) async {
    final variables = {"name": name};
    return await apiConfig.runQuery(
      query.fetchCharacterByName,
      variables: variables,
    );
  }

  @override
  Future<Map<String, dynamic>> fetchCharacterDetails(int id) async {
    final variables = {"id": id};
    return await apiConfig.runQuery(
      query.fetchCharacterDetails,
      variables: variables,
    );
  }
}
