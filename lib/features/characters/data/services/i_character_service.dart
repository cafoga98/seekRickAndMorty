abstract class ICharacterService {
  /// Obtiene los personajes paginados
  Future<Map<String, dynamic>> fetchCharactersByPage(int page);

  /// Busca personajes por nombre
  Future<Map<String, dynamic>> fetchCharactersByName(String name);

  /// Obtiene detalles de un personaje por ID
  Future<Map<String, dynamic>> fetchCharacterDetails(int id);
}
