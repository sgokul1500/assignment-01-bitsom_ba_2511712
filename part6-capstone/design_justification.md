## Storage Systems
To support the four goals of the hospital AI system, different storage systems are used based on the type of data and workload.

For predicting patient readmission risk, historical patient treatment data is required. This data is stored in a data warehouse (such as Snowflake or BigQuery). The data warehouse collects data from operational systems through ETL pipelines and stores structured historical data optimized for analytical queries and machine learning model training.

To allow doctors to query patient history using natural language, a vector database (such as Pinecone or Weaviate) is used. Patient records are converted into embeddings using an embedding model and stored in the vector database. This enables semantic search, allowing the system to retrieve relevant medical history even if the wording of the doctor’s question differs from the stored records.

For generating monthly reports for hospital management, such as bed occupancy and department-wise costs, the system uses a data warehouse connected to business intelligence tools. The warehouse supports complex analytical queries and aggregations required for reporting and decision-making.

To store and process real-time ICU vitals, such as heart rate, oxygen saturation, and blood pressure, a time-series database (such as InfluxDB or TimescaleDB) is used. Time-series databases are optimized for handling high-frequency streaming data and allow efficient querying of measurements over time.

Additionally, a PostgreSQL transactional database stores operational hospital data such as patient records, treatments, and billing information. This ensures reliable and consistent storage for day-to-day hospital operations.

## OLTP vs OLAP Boundary
In this architecture, the OLTP (Online Transaction Processing) layer consists of the operational databases used for day-to-day hospital activities. These include the PostgreSQL database, which stores patient records and hospital transactions, and the time-series database that captures real-time ICU monitoring data. These systems prioritize fast inserts, updates, and strong consistency because they support real-time hospital operations.

The OLAP (Online Analytical Processing) layer begins when data from the OLTP systems is extracted through ETL pipelines and transferred to the data warehouse and data lake. In this analytical layer, the data is transformed, aggregated, and optimized for analysis. The data warehouse is then used for generating management reports, running analytical queries, and training machine learning models to predict patient readmission risk.

By separating OLTP and OLAP systems, the hospital ensures that analytical workloads such as reporting and machine learning do not affect the performance of operational systems used by doctors and hospital staff.

## Trade-offs
One significant trade-off in this architecture is the increased system complexity caused by using multiple specialized databases. The system includes a relational database for transactions, a time-series database for streaming data, a vector database for semantic search, and a data warehouse for analytics. While each database is optimized for its specific workload, managing multiple storage systems increases operational complexity, infrastructure cost, and maintenance effort.

To mitigate this issue, the hospital can use a centralized data pipeline and orchestration system, such as Apache Airflow or a managed cloud data integration service, to automate data movement between systems. Containerization and cloud-managed database services can also reduce maintenance overhead. Proper monitoring and data governance practices ensure reliability and maintain consistency across all systems.