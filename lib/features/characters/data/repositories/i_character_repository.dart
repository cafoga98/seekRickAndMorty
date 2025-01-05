import 'package:dartz/dartz.dart';
import 'package:seek_rickandmorty/core/config/error_handle/failures.dart';
import 'package:seek_rickandmorty/features/characters/domain/entities/character_entity.dart';

abstract class ICharacterRepository {
  /// Obtiene los personajes paginados como modelos
  Future<Either<Failure, List<CharacterEntity>>> getCharactersByPage(int page);

  /// Busca personajes por nombre como modelos
  Future<Either<Failure, List<CharacterEntity>>> getCharactersByName(String name);

  /// Obtiene los detalles de un personaje como modelo
  Future<Either<Failure, CharacterEntity>> getCharacterDetails(int id);
}
