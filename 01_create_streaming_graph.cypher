// =============================================================================
// PROJETO: Modelagem de Dados em Grafos - Serviço de Streaming
// BOOTCAMP: Neo4j - Análise de Dados com Grafos (DIO)
// AUTOR: Hbini (Hernane Bini)
// DATA: 2026
// =============================================================================
// DESCRIÇÃO: Este arquivo contém o schema completo para criação do grafo de
// um serviço de streaming, incluindo nós (Person, Movies, Series, Category)
// e relacionamentos (ACTED_IN, WATCHED, CLASSIFIES, DIRECTED_BY, PREFERS)
// =============================================================================

// LIMPEZA DO BANCO (opcional - use com cautela)
// MATCH (n) DETACH DELETE n;

// =============================================================================
// 1. STRUCTURE TEMPLATE - Modelo vazio para referência
// =============================================================================

CREATE
// ATORES
(Actor:Person {
  actorId: "",
  name: "",
  birthYear: "",
  bio: "",
  nationality: ""
})-[:ACTED_IN {
  character: "",
  role: ""
}]->
// SÉRIES
(Serie:Series {
  serieId: "",
  title: "",
  releaseYear: "",
  description: "",
  seasons: "",
  episodes: "",
  rating: "",
  ageRating: ""
})
// RELACIONAMENTO WATCHED (User assistiu Serie)
<-[:WATCHED {
  rating: "",
  watchedOn: "",
  isFavorite: ""
}]-
// USUÁRIO
(User:Person {
  userId: "",
  name: "",
  email: "",
  birthYear: "",
  country: "",
  createdAt: ""
})
// RELACIONAMENTO WATCHED (User assistiu Movie)
-[:WATCHED {
  rating: "",
  watchedOn: "",
  isFavorite: ""
}]->
// FILMES
(Movie:Movies {
  movieId: "",
  title: "",
  releaseYear: "",
  description: "",
  rating: "",
  ageRating: "",
  language: ""
})
// CLASSIFICAÇÃO DE FILME POR GÊNERO
-[:CLASSIFIES]->
// GÊNEROS
(Genre:Category {
  genreId: "",
  name: ""
})
// CLASSIFICAÇÃO DA SÉRIE PELO MESMO GÊNERO
<-[:CLASSIFIES]-(Serie)
// DIRETOR
<-[:DIRECTED_BY]-(Director:Person {
  directorId: "",
  name: "",
  birthYear: "",
  nationality: "",
  bio: ""
}),
// PREFERÊNCIAS DO USUÁRIO
(User)-[:PREFERS]->(Genre),
// ATOR TAMBÉM ATUOU NO FILME
(Actor)-[:ACTED_IN]->(Movie)
// DIRETOR TAMBÉM DIRIGIU O FILME
<-[:DIRECTED_BY]-(Director);

