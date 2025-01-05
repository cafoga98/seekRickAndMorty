import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_rickandmorty/features/characters/data/repositories/i_character_repository.dart';
import 'package:seek_rickandmorty/features/characters/domain/blocs/character_detail_cubit/character_detail_cubit.dart';
import 'package:seek_rickandmorty/generated/l10n.dart';

class CharacterDetailPage extends StatelessWidget {
  final int characterId;

  const CharacterDetailPage({
    super.key,
    required this.characterId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterDetailCubit(
        context.read<ICharacterRepository>(),
      )..fetchCharacterDetails(characterId),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.router.maybePop();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: BlocBuilder<CharacterDetailCubit,
                          CharacterDetailState>(
                        builder: (context, state) => state.maybeWhen(
                          orElse: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          loadedCharacterDetail: (characterEntity) {
                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.green,
                                  child: CircleAvatar(
                                    radius: 66,
                                    backgroundImage:
                                        NetworkImage(characterEntity.image!),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    characterEntity.status!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  characterEntity.name!,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const SectionTitle(title: 'PROPERTIES'),
                                const SizedBox(height: 10),
                                PropertiesRow(
                                  label: 'GENDER',
                                  value: characterEntity.gender!,
                                ),
                                PropertiesRow(
                                  label: 'SPECIES',
                                  value: characterEntity.species!,
                                ),
                                const SizedBox(height: 20),
                                const SectionTitle(title: 'WHEREABOUTS'),
                                const SizedBox(height: 10),
                                PropertiesRow(
                                  label: 'ORIGIN',
                                  value: characterEntity.originName ??
                                      S.current.notFound,
                                ),
                                PropertiesRow(
                                  label: 'LOCATION',
                                  value: characterEntity.location?.name ??
                                      S.current.notFound,
                                ),
                                const SizedBox(height: 20),
                                const SectionTitle(title: 'FEATURED CHAPTERS'),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: characterEntity.episodes != null
                                      ? characterEntity.episodes!
                                          .map(
                                            (episode) => ChapterItem(
                                              title:
                                                  '${episode.id} - ${episode.name}',
                                            ),
                                          )
                                          .toList()
                                      : [],
                                ),
                              ],
                            );
                          },
                          error: (failure) => Center(
                            child: Text(
                              'Error: ${failure.message}',
                            ),
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
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class PropertiesRow extends StatelessWidget {
  final String label;
  final String value;

  const PropertiesRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF0EAD6), // Fondo beige claro
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF0EAD6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChapterItem extends StatelessWidget {
  final String title;

  const ChapterItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }
}
