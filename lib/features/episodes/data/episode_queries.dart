/// Queries para el feature Episodes

/// Obtiene los episodios paginados (paginación)
const String fetchEpisodesByPage = """
  query GetEpisodes(\$page: Int!) {
    episodes(page: \$page) {
      results {
        id
        name
        air_date
        episode
        characters {
          id
          image
        }
      }
      info {
        count
        pages
        next
        prev
      }
    }
  }
""";

/// Busca episodios por nombre
const String fetchEpisodesByName = """
  query FilterEpisode(\$name: String!) {
    episodes(filter: { name: \$name }) {
      results {
        id
        name
        air_date
        episode
        characters {
          id
          image
        }
      }
    }
  }
""";
