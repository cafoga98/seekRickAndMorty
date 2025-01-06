import 'package:dartz/dartz.dart';
import 'package:seek_rickandmorty/core/config/error_handle/failures.dart';
import 'package:seek_rickandmorty/core/config/error_handle/handle_failures.dart';
import 'package:seek_rickandmorty/features/characters/data/repositories/i_character_repository.dart';
import 'package:seek_rickandmorty/features/characters/domain/entities/character_entity.dart';

import '../services/i_character_service.dart';

class CharacterRepository implements ICharacterRepository {
  final ICharacterService characterService;

  CharacterRepository({required this.characterService});

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharactersByPage(
      int page) async {
    return await handleFailures(() async {
      final data = await characterService.fetchCharactersByPage(page);
      final characters = (data['characters']['results'] as List)
          .map((json) => CharacterEntity.fromJson(json))
          .toList();
      return characters;
    });
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharactersByName(
      String name) async {
    return await handleFailures(() async {
      final data = await characterService.fetchCharactersByName(name);
      final characters = (data['characters']['results'] as List)
          .map((json) => CharacterEntity.fromJson(json))
          .toList();
      return characters;
    });
  }

  @override
  Future<Either<Failure, CharacterEntity>> getCharacterDetails(
      int id) async {
    return await handleFailures(() async {
      final data = await characterService.fetchCharacterDetails(id);
      final character = CharacterEntity.fromJsonDetail(data['character']);
      return character;
    });
  }
}
