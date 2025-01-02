
# Kafka Docker Setup

This repository provides a Docker-based setup for Apache Kafka, enabling streamlined deployment and management of Kafka services.

## Prerequisites

- **Docker**: Ensure that [Docker](https://docs.docker.com/get-docker/) is installed on your system.
- **Docker Compose**: Install [Docker Compose](https://docs.docker.com/compose/install/) to manage multi-container Docker applications.

## Setup Instructions

1. **Clone the Repository**:

   Begin by cloning this repository to your local machine:

   ```bash
   git clone https://github.com/imeshSalpage/kafka-docker.git
   cd kafka-docker
   ```

2. **Configure Environment Variables**:

   Duplicate the sample environment variable file to create an active configuration file:

   ```bash
   cp tmp.env .env
   ```

   Modify the `.env` file as necessary to suit your environment and preferences.

3. **Manage the Docker Environment**:

   The provided `Makefile` includes commands to manage the Docker environment:

   - **Start the Services**:

     To build and start the services in detached mode:

     ```bash
     make up
     ```

     This command runs `docker compose up --build --remove-orphans -d`, which builds the images and starts the containers in the background.

   - **Start the Services in Foreground**:

     To build and start the services in the foreground:

     ```bash
     make up-f
     ```

     This command runs `docker compose up --build --remove-orphans`, which builds the images and starts the containers in the foreground, displaying logs in real-time.

   - **Stop the Services**:

     To stop and remove the running services:

     ```bash
     make down
     ```

     This command runs `docker compose down --remove-orphans`, which stops and removes the containers, along with any orphaned containers not defined in the `docker-compose.yml` file.

## Accessing Kafka

Once the services are up, Kafka will be accessible at the address and port specified in your `.env` configuration. Ensure that the `KAFKA_ADVERTISED_HOST_NAME` and other relevant environment variables are correctly set to allow proper connectivity.

## Customization

- **Environment Variables**:

  The `.env` file allows you to customize settings such as Kafka broker configurations, Zookeeper connection strings, and other parameters. Ensure these variables are correctly set up before starting the services.

- **Docker Compose Configuration**:

  The `docker-compose.yml` file defines the services, networks, and volumes. Modify this file if you need to change the default setup, such as adding more brokers or altering service configurations.

## Troubleshooting

- **Logs**:

  To view the logs for the running services, use:

  ```bash
  docker compose logs
  ```

- **Shell Access**:

  To access the shell inside the Kafka container:

  ```bash
  docker exec -it kafka-docker_kafka_1 bash
  ```

  Replace `kafka-docker_kafka_1` with the actual container name if it differs.

## Contributing

Contributions are welcome! Please fork this repository, make your changes, and submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

For more information on using Kafka with Docker, refer to the [official Kafka Docker image documentation](https://hub.docker.com/r/bitnami/kafka/).
