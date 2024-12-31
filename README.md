# Real-Time Change Data Capture (CDC) System  

A real-time Change Data Capture (CDC) system designed to track and stream database changes as they happen. This project highlights the power of CDC in creating seamless, real-time data synchronization across platforms, enabling up-to-date analytics and insights.  

## 🛠️ Technologies Used  
- **PostgreSQL**: Source database to track changes (inserts, updates, deletes).  
- **Confluent Kafka**: Message broker for real-time streaming of database changes.  
- **Kafka Connect**: To capture changes from PostgreSQL and stream them to downstream systems.  
- **ClickHouse**: Analytical database for fast and efficient processing of the latest data.  
- **Docker**: To containerize all components for easy deployment and scalability.  

## 📚 Project Overview  
In today’s data-driven world, keeping systems synchronized in real-time is crucial. With this in mind, I built a CDC system to:  
- **Capture Changes**: Track every insert, update, and delete operation happening in a PostgreSQL database.  
- **Stream Data in Real-Time**: Use Kafka and Kafka Connect to stream these changes instantly to other systems.  
- **Analyze Fresh Data**: Push these changes to ClickHouse for lightning-fast analytics, ensuring insights are always up-to-date.  

The system provides a live feed of database updates, making it perfect for use cases like monitoring, real-time analytics, or powering event-driven architectures.  

## 🚀 Features  
- **Real-Time Change Tracking**:  
  - Captures database changes (inserts, updates, deletes) as they occur.  

- **Seamless Data Streaming**:  
  - Kafka ensures reliable and scalable streaming of data from PostgreSQL to ClickHouse.  

- **Fast and Efficient Analytics**:  
  - ClickHouse processes the incoming changes, enabling real-time analysis on the freshest data.  

- **Containerized Architecture**:  
  - All components are containerized with Docker, ensuring portability, scalability, and smooth deployment across environments.  

## 🌟 Why This Matters  
This project demonstrates the value of Change Data Capture in modern data engineering. By creating a real-time data synchronization pipeline, it bridges the gap between operational databases and analytical systems, paving the way for fast and accurate insights.  

## 📷 Screenshots  
*(Add any visuals or diagrams showcasing the architecture or the pipeline here.)*  

## 🔧 How to Run  
1. **Clone the Repository**:  
   ```bash  
   git clone https://github.com/rajsalvi744/simple-cdc.git
   cd simple-cdc  
2. Set Up Docker:
Make sure Docker is installed, and then start the services:
   ```bash
   docker-compose up  
3. Configure Kafka Connect: Access the Kafka Connect dashboard at http://localhost:9021 (replace <port> with the configured port).
Add connectors for PostgreSQL and ClickHouse as per the provided configuration files.
4. Test the Pipeline:
Perform insert, update, and delete operations on the PostgreSQL database.
Verify that changes are streamed to ClickHouse in real-time.
5. Run Queries in ClickHouse:
Use ClickHouse to run analytical queries on the most recent data.
