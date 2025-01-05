import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:seek_rickandmorty/core/design/helpers/handle_text.dart';
import 'package:seek_rickandmorty/core/design/tokens/colors.dart';
import 'package:seek_rickandmorty/features/episodes/domain/entities/episode_entity.dart';
import 'package:seek_rickandmorty/generated/l10n.dart';

class EpisodeCover extends StatelessWidget {
  final String topLeftImageUrl;
  final String bottomRightImageUrl;
  final EpisodeEntity episode;

  const EpisodeCover({
    super.key,
    required this.topLeftImageUrl,
    required this.bottomRightImageUrl,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureFlipCard(
      enableController: true,
      animationDuration: const Duration(milliseconds: 300),
      axis: FlipAxis.horizontal,
      controller: GestureFlipCardController(),
      frontWidget: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 100,
            height: 150,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    bottomRightImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          MainColors.colorsCustom.accentPink.color,
                          Colors.transparent,
                        ],
                        stops: const [0.5, 0.6],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.network(
                      topLeftImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 25,
                    width: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: const BoxDecoration(color: Colors.black54),
                    child: Text(
                      episode.episode ?? S.current.notFound,
                      style: HandleTextStyle.body(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backWidget: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            color: MainColors.colorsCustom.accentPink.color,
          ),
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                episode.name ?? S.current.notFound,
                style: HandleTextStyle.body(context)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                episode.airDate?.split(',').first ?? S.current.notFound,
                style: HandleTextStyle.body(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
