abstract class ILocationService {
  /// Obtiene los personajes paginados
  Future<Map<String, dynamic>> fetchLocationByPage(int page);

  /// Busca personajes por nombre
  Future<Map<String, dynamic>> fetchLocationByName(String name);
}
