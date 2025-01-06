import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:seek_rickandmorty/core/design/helpers/handle_text.dart';
import 'package:seek_rickandmorty/core/design/tokens/colors.dart';
import 'package:seek_rickandmorty/core/design/tokens/images.dart';
import 'package:seek_rickandmorty/features/episodes/domain/entities/episode_entity.dart';
import 'package:seek_rickandmorty/features/locations/domain/entities/location_entity.dart';
import 'package:seek_rickandmorty/generated/l10n.dart';

class LocationCover extends StatelessWidget {
  final LocationEntity location;

  const LocationCover({
    super.key,
    required this.location,
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
                  child: Image.asset(ImageRepository.dimensionLogo),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 25,
                    width: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: const BoxDecoration(color: Colors.black54),
                    child: Center(
                      child: Text(
                        location.type ?? S.current.notFound,
                        style: HandleTextStyle.body(context).copyWith(
                          fontWeight: FontWeight.bold,
                        ),
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
            color: MainColors.colorsCustom.toxicPurple.color,
          ),
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                location.name ?? S.current.notFound,
                style: HandleTextStyle.body(context)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                location.dimension ?? S.current.notFound,
                style: HandleTextStyle.body(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
