
cd transitime

mvn install -DskipTests

cd ..

docker build --no-cache -t transitclock-web-server .
