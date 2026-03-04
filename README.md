# dio-neo4j-streaming-graph
Projeto de Modelagem de Dados em Grafos para Serviço de Streaming - Bootcamp Neo4j DIO

## Sobre o Projeto

Este projeto foi desenvolvido como parte do **Bootcamp Neo4j - Análise de Dados com Grafos** da plataforma **DIO (Digital Innovation One)**.

O objetivo é modelar e implementar um banco de dados orientado a grafos para um serviço de streaming, similar a Netflix, Spotify ou Amazon Prime, utilizando a linguagem de consulta **Cypher** do Neo4j.

## 📋 Estrutura do Projeto

```
dio-neo4j-streaming-graph/
├── 01_create_streaming_graph.cypher  # Schema e estrutura do grafo
├── 02_insert_data.cypher             # Inserção de dados de exemplo
├── 03_queries.cypher                 # Consultas e análises
├── README.md                         # Esta documentação
└── results/                          # Resultados das consultas (opcional)
```

## 🎯 Modelagem de Dados

### Nós (Nodes)

| Rótulo | Descrição | Atributos Principais |
|--------|-----------|---------------------|
| `Person` | Representa atores, diretores e usuários | id, name, birthYear, nationality, bio |
| `Movies` | Filmes disponíveis na plataforma | movieId, title, releaseYear, rating, language |
| `Series` | Séries de TV | serieId, title, seasons, episodes, rating |
| `Category` | Gêneros/categorias de conteúdo | genreId, name |

### Relacionamentos (Relationships)

| Tipo | Origem → Destino | Propriedades |
|------|------------------|--------------|
| `ACTED_IN` | Person (Actor) → Movies/Series | character, role |
| `DIRECTED_BY` | Movies/Series → Person (Director) | - |
| `WATCHED` | Person (User) → Movies/Series | rating, watchedOn, isFavorite |
| `CLASSIFIES` | Movies/Series → Category | - |
| `PREFERS` | Person (User) → Category | - |

## 🚀 Como Usar

### 1. Neo4j Aura (Cloud)

1. Acesse [Neo4j Aura](https://neo4j.com/cloud/aura/)
2. Crie uma instância gratuita
3. Obtenha as credenciais de conexão
4. Execute os scripts Cypher na ordem numérica

### 2. Neo4j Desktop (Local)

1. Baixe e instale o [Neo4j Desktop](https://neo4j.com/download/)
2. Crie um novo DBMS
3. Abra o Neo4j Browser
4. Execute os scripts Cypher

### 3. Neo4j Sandbox

1. Acesse [Neo4j Sandbox](https://sandbox.neo4j.com/)
2. Crie um sandbox vazio
3. Execute os comandos

## 📝 Scripts Cypher

### Criando o Schema

O arquivo `01_create_streaming_graph.cypher` contém a estrutura base para criação dos nós e relacionamentos.

### Inserindo Dados

O arquivo `02_insert_data.cypher` contém dados de exemplo para popular o banco.

### Executando Consultas

O arquivo `03_queries.cypher` contém consultas para:
- Top filmes/séries mais bem avaliados
- Conteúdo mais assistido
- Diretores com melhores ratings
- Gêneros favoritos dos usuários
- Recomendações baseadas em preferências

## 🔍 Consultas Exemplo

```cypher
// Top 5 filmes mais bem avaliados
MATCH (u:Person)-[w:WATCHED]->(m:Movies)
RETURN m.title AS Filme, AVG(w.rating) AS MediaAvaliacao
ORDER BY MediaAvaliacao DESC
LIMIT 5;

// Recomendar filmes por gênero preferido
MATCH (u:Person {userId: 'U1'})-[:PREFERS]->(g:Category)<-[:CLASSIFIES]-(m:Movies)
WHERE NOT EXISTS((u)-[:WATCHED]->(m))
RETURN m.title AS Recomendacao, g.name AS Genero;
```

## 📊 Insights e Análises Possíveis

1. **Sistema de Recomendação**: Baseado em gêneros preferidos e histórico
2. **Análise de Popularidade**: Conteúdo mais assistido e bem avaliado
3. **Rede de Colaboração**: Atores e diretores que trabalharam juntos
4. **Padrões de Visualização**: Comportamento dos usuários por país/idade
5. **Detecção de Comunidades**: Grupos de usuários com preferências similares

## 🛠 Tecnologias Utilizadas

- **Neo4j**: Banco de dados orientado a grafos
- **Cypher**: Linguagem de consulta
- **Neo4j Aura**: Plataforma cloud
- **Git/GitHub**: Versionamento

## 📚 Referências

- [Documentação Neo4j](https://neo4j.com/docs/)
- [Cypher Query Language](https://neo4j.com/docs/cypher-manual/current/)
- [DIO - Digital Innovation One](https://www.dio.me/)
- [Neo4j Graph Data Science](https://neo4j.com/product/graph-data-science-library/)

## 👨‍💻 Autor

**Hernane Bini (Hbini)**
- GitHub: [@Hbini](https://github.com/Hbini)
- Educador e Desenvolvedor

## 📄 License

Este projeto é de código aberto e pode ser usado para fins educacionais.

---

**Bootcamp Neo4j - DIO © 2026**
