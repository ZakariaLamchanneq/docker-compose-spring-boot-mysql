FROM maven:3.8.2-jdk-8

WORKDIR /bezkoder-app

# Copy only the pom.xml file first to leverage Docker cache
COPY bezkoder-app/pom.xml .

# Install project dependencies
RUN mvn dependency:go-offline

# Copy the rest of the project and build it
COPY . .
RUN mvn clean install

CMD mvn spring-boot:run

