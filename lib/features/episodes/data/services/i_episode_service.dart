abstract class IEpisodeService {
  /// Obtiene los personajes paginados
  Future<Map<String, dynamic>> fetchEpisodeByPage(int page);

  /// Busca personajes por nombre
  Future<Map<String, dynamic>> fetchEpisodeByName(String name);
}
