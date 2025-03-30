#!/bin/bash

# Display versions
echo "Java version:"
java -version
echo "Maven version:"
mvn -version

# Set environment variables for build if not already set
if [ -z "$SPRING_DATASOURCE_URL" ]; then
  echo "SPRING_DATASOURCE_URL not set, using default value for build"
  export SPRING_DATASOURCE_URL="jdbc:mysql://localhost:3306/portfolio"
fi

if [ -z "$SPRING_DATASOURCE_USERNAME" ]; then
  echo "SPRING_DATASOURCE_USERNAME not set, using default value for build"
  export SPRING_DATASOURCE_USERNAME="root"
fi

if [ -z "$SPRING_DATASOURCE_PASSWORD" ]; then
  echo "SPRING_DATASOURCE_PASSWORD not set, using default value for build"
  export SPRING_DATASOURCE_PASSWORD="password"
fi

# Build the application
echo "Building Spring Boot application..."
mvn clean package -DskipTests

# Create a properties file with environment variable values
echo "Creating application-amplify.properties file..."
cat > target/application-amplify.properties << EOF
# Application settings
spring.profiles.active=amplify
server.port=8080

# Database settings
spring.datasource.url=${SPRING_DATASOURCE_URL}
spring.datasource.username=${SPRING_DATASOURCE_USERNAME}
spring.datasource.password=${SPRING_DATASOURCE_PASSWORD}
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# JPA settings
spring.jpa.hibernate.ddl-auto=update
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect

# CORS settings
spring.web.cors.allowed-origins=*
spring.web.cors.allowed-methods=GET,POST,PUT,DELETE,OPTIONS
spring.web.cors.allowed-headers=*
EOF

# Create a script to run the application
echo "Creating run.sh script..."
cat > target/run.sh << 'EOF'
#!/bin/bash

# Get the JAR file
JAR_FILE=$(find . -name "*.jar" | head -1)

if [ -z "$JAR_FILE" ]; then
  echo "No JAR file found"
  exit 1
fi

# Run the application with the Amplify profile
echo "Running application: $JAR_FILE"
java -jar $JAR_FILE --spring.config.location=file:./application-amplify.properties
EOF

# Make the run script executable
chmod +x target/run.sh

echo "Build completed successfully!" 