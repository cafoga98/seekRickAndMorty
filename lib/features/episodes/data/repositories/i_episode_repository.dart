import 'package:dartz/dartz.dart';
import 'package:seek_rickandmorty/core/config/error_handle/failures.dart';
import 'package:seek_rickandmorty/features/episodes/domain/entities/episode_entity.dart';
import 'package:seek_rickandmorty/features/episodes/domain/entities/episode_response_entity.dart';

abstract class IEpisodeRepository {
  /// Obtiene los personajes paginados como modelos
  Future<Either<Failure, EpisodeResponse>> getEpisodeEntityByPage(int page);

  /// Busca personajes por nombre como modelos
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodeEntityByName(String name);

}
