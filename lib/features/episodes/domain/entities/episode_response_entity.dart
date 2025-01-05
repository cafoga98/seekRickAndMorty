import 'package:seek_rickandmorty/features/episodes/domain/entities/episode_entity.dart';

class EpisodeResponse {
  List<EpisodeEntity> episodeEntityList;
  int? next;

  EpisodeResponse({
    required this.episodeEntityList,
    required this.next,
  });

  factory EpisodeResponse.fromJson(Map<String, dynamic> json) {
    return EpisodeResponse(
      episodeEntityList: (json['results'] as List)
          .map((json) => EpisodeEntity.fromJson(json))
          .toList(),
      next: json['info']['next'],
    );
  }
}
