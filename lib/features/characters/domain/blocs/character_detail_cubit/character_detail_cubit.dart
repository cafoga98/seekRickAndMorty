import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seek_rickandmorty/core/config/error_handle/failures.dart';
import 'package:seek_rickandmorty/features/characters/data/repositories/i_character_repository.dart';
import 'package:seek_rickandmorty/features/characters/domain/entities/character_entity.dart';

part 'character_detail_state.dart';

part 'character_detail_cubit.freezed.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  final ICharacterRepository repository;

  CharacterDetailCubit(this.repository)
      : super(const CharacterDetailState.initial());

  /// Obtiene los detalles de un personaje dado su [id]
  Future<void> fetchCharacterDetails(int id) async {
    emit(const CharacterDetailState.loading());

    final result = await repository.getCharacterDetails(id);

    result.fold(
      (failure) => emit(
        CharacterDetailState.error(
          failure: failure,
        ),
      ),
      (character) => emit(
        CharacterDetailState.loadedCharacterDetail(
          character: character,
        ),
      ),
    );
  }
}
