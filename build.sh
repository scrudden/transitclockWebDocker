
cd transitime
mvn clean:clean
mvn install -DskipTests

cd ..

docker build --no-cache -t transitclock-web-server .
