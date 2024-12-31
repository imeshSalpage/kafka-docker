# Kafka Docker Setup and Introduction

## Prerequisites

- **Docker**: Ensure Docker is installed on your system. You can download it from [Docker's official website](https://www.docker.com/get-started).
- **Docker Compose**: This tool is necessary for managing multi-container Docker applications. Install it by following the instructions in the [Docker Compose installation guide](https://docs.docker.com/compose/install/).

## Clone the Repository

Clone the repository to your local machine using the following command:

```bash
git clone https://github.com/imeshSalpage/kafka-docker.git
```

Navigate to the cloned directory:

```bash
cd kafka-docker
```

## Configuration

- **Environment Variables**: The `docker-compose.yml` file in the repository is pre-configured with essential environment variables. Review and modify them if necessary to suit your setup. Key variables include:
  - `KAFKA_ADVERTISED_HOST_NAME`: Set this to your Docker host's IP address. Avoid using `localhost` or `127.0.0.1` if you plan to run multiple brokers.
  - `KAFKA_ZOOKEEPER_CONNECT`: Specifies the Zookeeper connection string.

- **Custom Kafka Parameters**: To customize Kafka settings, add the desired parameters as environment variables in the `docker-compose.yml` file. For example, to increase the maximum message size, add:

  ```yaml
  environment:
    KAFKA_MESSAGE_MAX_BYTES: 2000000
  ```

- **Log4j Configuration**: Customize Kafka's logging by adding environment variables prefixed with `LOG4J_`. For instance, to set the authorizer logger to DEBUG level:

  ```yaml
  environment:
    LOG4J_LOGGER_KAFKA_AUTHORIZER_LOGGER: DEBUG, authorizerAppender
  ```

## Starting the Kafka Environment

Use Docker Compose to start the Kafka environment:

```bash
docker-compose up -d
```

This command initializes the services defined in the `docker-compose.yml` file.

## Scaling the Kafka Cluster

To add more brokers to your Kafka cluster, use the following command:

```bash
docker-compose scale kafka=3
```

This command scales the number of Kafka broker instances to three.

## Stopping the Kafka Environment

To stop the running Kafka environment, execute:

```bash
docker-compose stop
```

## Creating Kafka Topics Automatically

To have Kafka automatically create topics during startup, add the `KAFKA_CREATE_TOPICS` environment variable in the `docker-compose.yml` file. For example:

```yaml
environment:
  KAFKA_CREATE_TOPICS: "Topic1:1:3,Topic2:1:1:compact"
```

In this configuration:

- `Topic1` is created with 1 partition and 3 replicas.
- `Topic2` is created with 1 partition, 1 replica, and a cleanup policy set to `compact`.

## Additional Resources

For more detailed information and advanced configurations, refer to the original repository from which this setup is derived: [wurstmeister/kafka-docker](https://github.com/wurstmeister/kafka-docker).

By following these steps, you can set up a Kafka environment using Docker, facilitating efficient development and testing workflows.

