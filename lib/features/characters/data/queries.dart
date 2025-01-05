///Queries to the Characters feature
library;

const String fetchCharactersByPage = """
  query GetCharacters(\$page: Int!) {
    characters(page: \$page) {
      results {
        id
        name
        status
        species
        gender
        image
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

const String fetchCharacterByName = """
  query FilterCharacter(\$name: String!) {
    characters(filter: { name: \$name }) {
      results {
        id
        name
        status
        species
        gender
        image
      }
    }
  }
""";

const String fetchCharacterDetails = """
  query GetCharacterDetails(\$id: ID!) {
    character(id: \$id) {
      id
      name
      status
      species
      gender
      origin {
        name
      }
      location {
        name,
        type,
        dimension
      }
      episode {
        id
        name
        air_date
      }
      image
    }
  }
""";
