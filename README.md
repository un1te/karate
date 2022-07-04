"# karate
Maven test runner

mvn test "-Dkarate.options=--tags @debug,@regression"

mvn test "-Dkarate.env='dev'

Libraries:
javafaker library for test data generator

run docker compose:
docker-compose up --build

run test in docket container  
docker run -it karatetest

Gatling run
mvn gatling:test
