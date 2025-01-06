const String fetchEpisodesByPage = r'''
  query GetLocations($page: Int) {
    locations(page: $page) {
      info {
        next
      }
      results {
        id
        name
        dimension
        type
      }
    }
  }
''';

/// Busca episodios por nombre
const String fetchLocationByName = """
  query FilterLocation(\$name: String!) {
    locations(filter: { name: \$name }) {
      results {
        id
        name
        dimension
        type
      }
    }
  }
""";
