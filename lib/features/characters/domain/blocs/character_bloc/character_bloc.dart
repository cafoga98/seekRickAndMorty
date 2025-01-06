import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seek_rickandmorty/features/characters/data/repositories/i_character_repository.dart';
import 'package:seek_rickandmorty/features/characters/domain/entities/character_entity.dart';

part 'character_event.dart';

part 'character_state.dart';

part 'character_bloc.freezed.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final ICharacterRepository characterRepository;

  CharacterBloc({
    required this.characterRepository,
  }) : super(const CharacterState.initial()) {
    on<FetchCharacters>(_fetchCharacter);
    on<SearchCharacters>(_searchCharacter);
  }

  void _fetchCharacter(
      FetchCharacters event, Emitter<CharacterState> emit) async {
    try {
      if (state is _Loaded) {
        final currentState = state as _Loaded;
        final currentCharacters = currentState.characters;
        final nextPage = currentState.currentPage + 1;

        emit(const CharacterState.loading());

        await characterRepository.getCharactersByPage(nextPage).then(
          (response) {
            response.fold(
              (failure) => emit(
                CharacterState.error(failure.message!),
              ),
              (characters) => emit(
                CharacterState.loaded(
                  characters: currentCharacters + characters,
                  currentPage: nextPage,
                ),
              ),
            );
          },
        );
      } else {
        emit(const CharacterState.loading());
        await characterRepository.getCharactersByPage(1).then(
          (response) {
            response.fold(
              (failure) => emit(
                CharacterState.error(failure.message!),
              ),
              (characters) => emit(
                CharacterState.loaded(characters: characters, currentPage: 1),
              ),
            );
          },
        );
      }
    } catch (e) {
      emit(CharacterState.error(e.toString()));
    }
  }

  void _searchCharacter(
      SearchCharacters event, Emitter<CharacterState> emit) async {
    emit(const CharacterState.loading());
    await characterRepository.getCharactersByName(event.value).then(
      (response) {
        response.fold(
          (failure) => emit(
            CharacterState.error(failure.message!),
          ),
          (characters) => emit(
            CharacterState.loadedSearch(characters: characters, currentPage: 1),
          ),
        );
      },
    );
  }
}
