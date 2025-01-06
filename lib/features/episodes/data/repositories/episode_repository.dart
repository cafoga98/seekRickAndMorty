import 'package:dartz/dartz.dart';
import 'package:seek_rickandmorty/core/config/error_handle/failures.dart';
import 'package:seek_rickandmorty/core/config/error_handle/handle_failures.dart';
import 'package:seek_rickandmorty/features/episodes/data/repositories/i_episode_repository.dart';
import 'package:seek_rickandmorty/features/episodes/domain/entities/episode_entity.dart';
import 'package:seek_rickandmorty/features/episodes/domain/entities/episode_response_entity.dart';

import '../services/i_episode_service.dart';

class EpisodeRepository implements IEpisodeRepository {
  final IEpisodeService episodeService;

  EpisodeRepository({required this.episodeService});

  @override
  Future<Either<Failure, EpisodeResponse>> getEpisodeEntityByPage(
      int page) async {
    return await handleFailures(
      () async {
        final data = await episodeService.fetchEpisodeByPage(page);
        final response = EpisodeResponse.fromJson(data['episodes']);
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodeEntityByName(
      String name) async {
    return await handleFailures(
      () async {
        final data = await episodeService.fetchEpisodeByName(name);
        final episode = (data['episodes']['results'] as List)
            .map((json) => EpisodeEntity.fromJson(json))
            .toList();
        return episode;
      },
    );
  }
}
