## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for searching large legal contracts. Keyword searches rely on exact word matches, which means the system can only retrieve documents containing the same words used in the query. However, legal documents often contain complex language and different phrasing for the same concept. For example, a lawyer may ask, “What are the termination clauses?” while the contract might use phrases such as “conditions for contract cancellation” or “agreement termination terms.” A keyword search might miss these relevant sections because the exact words do not match.

A vector database solves this problem by using embeddings that capture the semantic meaning of text rather than relying only on keywords. In this system, the contract would first be broken into smaller sections or paragraphs. Each section would then be converted into a numerical embedding using a language model. These embeddings represent the meaning of the text in a high-dimensional vector space.

When a lawyer asks a question in plain English, the query is also converted into an embedding. The vector database then performs a similarity search to find the contract sections whose embeddings are most similar to the query embedding. This allows the system to retrieve semantically relevant information even when the wording is different.

Therefore, a vector database enables semantic search over large legal documents, making it possible for lawyers to quickly locate relevant clauses and information within lengthy contracts.
