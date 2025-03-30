# Portfolio AI Backend

A Spring Boot backend for the Portfolio AI project, providing RESTful APIs for the Todo application and other features.

## Tech Stack

- **Spring Boot 3.2**: Modern Java framework for building robust applications
- **Java 17**: Latest LTS version with enhanced features
- **MySQL 8.0**: Relational database for data persistence
- **Spring Data JPA/Hibernate**: ORM framework for database operations
- **Lombok**: Reduces boilerplate code with annotations
- **Maven**: Dependency management and build tool

## Features

- **RESTful API**: Modern API design following REST principles
- **CRUD Operations**: Complete Create, Read, Update, Delete functionality
- **Database Integration**: Persistent storage with MySQL
- **Cross-Origin Support**: Configured for frontend integration across domains
- **Error Handling**: Robust exception handling and error responses
- **Production Ready**: Configured for easy deployment

## Getting Started

### Prerequisites

- Java 17+
- Maven
- MySQL 8.0

### Installation

1. Clone the repository:
```bash
git clone https://github.com/scottfabini/portfolio-ai-backend.git
cd portfolio-ai-backend
```

2. Configure the database:
Edit `src/main/resources/application.properties` to match your database settings:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/portfolio?createDatabaseIfNotExist=true
spring.datasource.username=your_username
spring.datasource.password=your_password
```

3. Build the application:
```bash
mvn clean install
```

4. Run the application:
```bash
mvn spring-boot:run
```

5. The API will be available at [http://localhost:8080/api](http://localhost:8080/api)

## API Endpoints

The backend provides the following API endpoints:

### Todo API

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET    | /api/todos | Get all todos |
| POST   | /api/todos | Create a new todo |
| GET    | /api/todos/{id} | Get a specific todo by ID |
| PUT    | /api/todos/{id} | Update a todo |
| PATCH  | /api/todos/{id}/toggle | Toggle todo completion status |
| DELETE | /api/todos/{id} | Delete a todo |

### Request/Response Examples

#### Get All Todos
```
GET /api/todos
```
Response:
```json
[
  {
    "id": 1,
    "title": "Learn Spring Boot",
    "description": "Master Spring Boot fundamentals",
    "completed": true,
    "createdAt": "2023-01-01T12:00:00",
    "updatedAt": "2023-01-02T14:30:00"
  },
  {
    "id": 2,
    "title": "Build Portfolio Website",
    "description": "Create a personal portfolio showcase",
    "completed": false,
    "createdAt": "2023-01-03T10:00:00",
    "updatedAt": "2023-01-03T10:00:00"
  }
]
```

#### Create a Todo
```
POST /api/todos
```
Request body:
```json
{
  "title": "Implement Authentication",
  "description": "Add user authentication to the application"
}
```
Response:
```json
{
  "id": 3,
  "title": "Implement Authentication",
  "description": "Add user authentication to the application",
  "completed": false,
  "createdAt": "2023-01-04T15:30:00",
  "updatedAt": "2023-01-04T15:30:00"
}
```

## Project Structure

```
backend/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/portfolio/
│   │   │       ├── controllers/   # REST API controllers
│   │   │       │   └── TodoController.java
│   │   │       ├── models/        # Entity classes
│   │   │       │   └── Todo.java
│   │   │       ├── repositories/  # Data access interfaces
│   │   │       │   └── TodoRepository.java
│   │   │       ├── services/      # Business logic
│   │   │       │   └── TodoService.java
│   │   │       └── PortfolioApplication.java  # Main application class
│   │   └── resources/
│   │       └── application.properties  # Application configuration
│   └── test/                     # Test classes
├── pom.xml                       # Maven configuration
└── Dockerfile                    # Docker configuration
```

## Development

### Code Style

This project follows standard Java code conventions:
- Clean code principles
- RESTful API design patterns
- Controller-Service-Repository architecture
- Proper exception handling

### Database Schema

The Todo entity has the following structure:

| Column | Type | Description |
|--------|------|-------------|
| id | BIGINT | Primary key (auto-increment) |
| title | VARCHAR(255) | Todo title |
| description | VARCHAR(255) | Todo description |
| completed | BOOLEAN | Completion status |
| created_at | DATETIME | Creation timestamp |
| updated_at | DATETIME | Last update timestamp |

## Deployment

### Docker Deployment

1. Build the Docker image:
```bash
docker build -t portfolio-backend .
```

2. Run the container:
```bash
docker run -p 8080:8080 -e SPRING_DATASOURCE_URL=jdbc:mysql://host.docker.internal:3306/portfolio portfolio-backend
```

### AWS Deployment

This application can be deployed to AWS using:

1. AWS Elastic Beanstalk:
   - Package the application as a JAR file
   - Upload to Elastic Beanstalk
   - Configure environment variables for database connection

2. Docker with AWS ECS:
   - Push the Docker image to ECR
   - Create an ECS task definition
   - Deploy as a service in ECS

## Contributing

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m 'Add your feature'`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details. 