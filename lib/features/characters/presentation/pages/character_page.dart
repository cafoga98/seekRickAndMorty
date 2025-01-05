import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_rickandmorty/core/design/tokens/images.dart';
import 'package:seek_rickandmorty/core/design/widgets/information_card_widget.dart';
import 'package:seek_rickandmorty/features/characters/domain/blocs/character_bloc/character_bloc.dart';

@RoutePage()
class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
          context.read<CharacterBloc>().add(const FetchCharacters());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      ImageRepository.characterTitle,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: BlocBuilder<CharacterBloc, CharacterState>(
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
                  loadedSearch: (characters, page) {
                    return LayoutBuilder(
                      builder: (context, constrain) {
                        return GridView.count(
                          childAspectRatio: 2,
                          controller: _scrollController,
                          crossAxisCount: (constrain.maxWidth < 600)
                              ? 1
                              : (constrain.maxWidth < 800)
                              ? 2
                              : 3,
                          children: characters
                              .map(
                                (item) => InformationCardWidget(
                              characterEntity: item,
                              width: width,
                              height: height,
                            ),
                          )
                              .toList(),
                        );
                      },
                    );
                  },
                  loaded: (characters, page) {
                    return LayoutBuilder(
                      builder: (context, constrain) {
                        print('> constrain.maxWidth: ${constrain.maxWidth}');
                        print(
                            '> constrain.maxHeight: ${constrain.maxHeight}');
                        return GridView.count(
                          childAspectRatio: 2,
                          controller: _scrollController,
                          crossAxisCount: (constrain.maxWidth < 600)
                              ? 1
                              : (constrain.maxWidth < 800)
                              ? 2
                              : 3,
                          children: characters
                              .map(
                                (item) => InformationCardWidget(
                              characterEntity: item,
                              width: width,
                              height: height,
                            ),
                          )
                              .toList(),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
