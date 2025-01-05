import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_rickandmorty/features/characters/domain/blocs/character_bloc/character_bloc.dart';
import 'package:seek_rickandmorty/features/characters/presentation/pages/character_page.dart';
import 'package:seek_rickandmorty/features/episodes/domain/bloc/episode_bloc/episode_bloc.dart';
import 'package:seek_rickandmorty/features/episodes/presentation/pages/episode_page.dart';
import 'package:seek_rickandmorty/features/home/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.height / 90,
          ),
          child: CustomAppBar(
            currentPageIndex: currentPageIndex,
            onPressedEpisodes: () {
              setState(() {
                currentPageIndex = 0;
              });
            },
            onPressedCharacter: () {
              setState(() {
                currentPageIndex = 1;
              });
            },
            onPressedLocation: () {
              setState(() {
                currentPageIndex = 2;
              });
            },
            onChanged: (val) {
              switch (currentPageIndex) {
                case 0:
                  print('Episodios: $val');
                  if (val.length > 3){
                    context.read<EpisodeBloc>().add(SearchEpisode(value: val));
                  }
                case 1:
                  print('Personajes: $val');
                  if (val.length > 3) {
                    context
                        .read<CharacterBloc>()
                        .add(SearchCharacters(value: val));
                  }
                case 2:
                  print('Locaciones: $val');
                default:
                  print('Default: $val');
              }
            },
          ),
        ),
      ),
      body: <Widget>[
        const EpisodePage(),
        const CharacterPage(),
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Home page',
                style: ThemeData().textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
