import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_rickandmorty/core/design/helpers/handle_text.dart';
import 'package:seek_rickandmorty/core/design/tokens/colors.dart';
import 'package:seek_rickandmorty/features/characters/domain/blocs/character_detail_cubit/character_detail_cubit.dart';
import 'package:seek_rickandmorty/features/characters/domain/entities/character_entity.dart';
import 'package:seek_rickandmorty/features/characters/presentation/pages/character_details_page.dart';

class InformationCardWidget extends StatelessWidget {
  final CharacterEntity characterEntity;
  final double width;
  final double height;

  const InformationCardWidget({
    super.key,
    required this.characterEntity,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return CharacterDetailPage(
              characterId: int.parse(characterEntity.id),
            );
          },
        );
      },
      child: Container(
        width: width,
        height: width / 5,
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: MainColors.colorsCustom.portalDarkGreen.color,
          border: Border.all(
            color: Colors.white54,
            width: 4.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: ClipOval(
                child: Image.network(
                  characterEntity.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    characterEntity.name,
                    maxLines: 2,
                    textAlign: TextAlign.right,
                    style: HandleTextStyle.title(context),
                  ),
                  Text(
                    characterEntity.gender,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    style: HandleTextStyle.body(context),
                  ),
                  Text(
                    'I am ${characterEntity.status}',
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    style: HandleTextStyle.body(context),
                  ),
                  Text(
                    characterEntity.species,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.right,
                    style: HandleTextStyle.body(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
