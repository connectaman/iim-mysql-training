# Database Design Consideration for Application

1. **Data Modelling** : Create an Entity-Relationship Diagram (ERD) to represent the data entities, their attributes, and relationships. This helps in visualizing the database structure.

2. **Normalization** : Apply normalization rules to eliminate data redundancy and ensure data integrity. (Tips: Databases are normalized to the Third normal form 3NF).

3. **Data Type** : Choose appropriate data type for columns to optimize storage and performance.

4. **Indexes** : Use indexes to speed up query performance. Identify the frequently used in WHERE clause and JOIN operations

5. **Foreign Keys** : Implement foreign keys to maintain referential integrity between tables.

6. **Scalibity** : Plan for future growth. 

# Data Security and Compliance

1. **Data Encryption** : Encypt sensitive data at your database level.

2. **Access Control** : Implement fine-grained access control

3. **Audit Logs** : Enable and maintain Audit logs to track database activities.

4. **Compliance Standards** : Understand and comply with relevant regulations such as GDPR, HIPPA, PCI, FDA.

5. **Backup and Recovery** : Regularly backup your database and test recovery.

# Performance Metrics and Tuning 

1. **Query Optimization** : Analyze and optimize slow queries using EXPLAIN and performance schema, indentify and rewrite inefficient queries.

2. **Indexing** : Ensure proper indexes are in place to speed up data retrival.

3. **Server Configuration** : Tune / Adjust MYSQL Server parameters for optimal performance.

4. **Monitoring Tools** : Use monitoring tools like MYSQL Enterprice Monitoring, Percona Monitoring, Grafana.

5. **Caching** : Implement Caching strategies to reduce load on the database. Use tools like memcache, redis to cache frequently used data.