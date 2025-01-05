import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_rickandmorty/core/design/tokens/colors.dart';
import 'package:seek_rickandmorty/core/design/tokens/images.dart';
import 'package:seek_rickandmorty/core/design/widgets/dialog_message.dart';
import 'package:seek_rickandmorty/features/episodes/domain/bloc/episode_bloc/episode_bloc.dart';
import 'package:seek_rickandmorty/features/episodes/domain/entities/episode_entity.dart';
import 'package:seek_rickandmorty/features/episodes/presentation/widgets/episode_cover_widget.dart';

class EpisodePage extends StatefulWidget {
  const EpisodePage({super.key});

  @override
  State<EpisodePage> createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<EpisodeBloc, EpisodeState>(
      listenWhen: (context, state) => state.maybeWhen(
        orElse: () => false,
        loaded: (episodes, next) => true,
      ),
      listener: (context, state) => state.maybeWhen(
        orElse: () {
          return null;
        },
        loaded: (episodes, next) {
          if (next == null) {
            return DialogMessage.show(
              context: context,
              title: 'Opss ...',
              content: Text('No hay mas episodios para cargar'),
              defaultActionText: 'Entiendo',
            );
          }
        },
      ),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: FloatingActionButton(
          mini: false,
          backgroundColor: MainColors.colorsCustom.accentPink.color,
          onPressed: () {
            context.read<EpisodeBloc>().add(const FetchEpisodes());
          },
          child: const Icon(
            Icons.queue_play_next_outlined,
            color: Colors.white,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
          ),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        ImageRepository.episodeTitle,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: BlocBuilder<EpisodeBloc, EpisodeState>(
                  buildWhen: (context, state) => state.maybeWhen(
                    orElse: () => true,
                    noMoreEpisodes: () => false,
                  ),
                  builder: (context, state) => state.maybeWhen(
                    orElse: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    error: (e) {
                      return Center(
                        child: Text(e),
                      );
                    },
                    loadedSearch: (episodes) {
                      return buildCoverList(
                        episodes: episodes,
                        context: context,
                      );
                    },
                    loaded: (episodes, nextPage) {
                      return buildCoverList(
                        episodes: episodes,
                        context: context,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<EpisodeBloc>().add(const FetchEpisodes());
  }

  Widget buildCoverList(
      {required Map<String, List<EpisodeEntity>> episodes,
      required BuildContext context}) {
    return ListView.builder(
      reverse: false,
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        final year = episodes.keys.elementAt(index);
        final episodesInYear = episodes[year]!;
        return _buildSectionHeader(year: year, episodesInYear: episodesInYear);
      },
    );
  }

  Widget _buildSectionHeader(
      {required String year, required List<EpisodeEntity> episodesInYear}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Text(
            'Lanzamientos del $year',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 150, // Altura de la lista horizontal
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: episodesInYear.length, // Número de elementos en la lista
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: EpisodeCover(
                  episode: episodesInYear[index],
                  topLeftImageUrl: episodesInYear[index]
                          .characters?[episodesInYear.length != 1
                              ? Random().nextInt(episodesInYear.length - 1)
                              : 0]
                          .image ??
                      '',
                  bottomRightImageUrl: episodesInYear[index]
                          .characters?[episodesInYear.length != 1
                              ? Random().nextInt(episodesInYear.length - 1)
                              : 0]
                          .image ??
                      '',
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
