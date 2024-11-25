# Use the official SonarQube LTS version image
FROM sonarqube:lts-community

# Expose SonarQube's default web port (9000)
EXPOSE 9000

# Set environment variables for PostgreSQL database connection securely
# (Avoid hardcoding sensitive data in production)
ENV SONARQUBE_JDBC_URL=jdbc:postgresql://c2c-prod-db.postgres.database.azure.com:5432/sonarqube
ENV SONARQUBE_JDBC_USERNAME_FILE=/run/secrets/sonar_db_username
ENV SONARQUBE_JDBC_PASSWORD_FILE=/run/secrets/sonar_db_password

# Copy your custom sonar.properties into the SonarQube container
COPY ./sonar.properties /opt/sonarqube/conf/sonar.properties

# Optionally, you can also add plugins or other configuration files if necessary
# COPY ./your-config-file /opt/sonarqube/conf/
