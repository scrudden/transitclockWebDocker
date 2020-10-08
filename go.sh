export TRANSITCLOCK_DATABASE_PASSWORD=
export TRANSITCLOCK_DATABASE_USER=
export TRANSITCLOCK_DOCKER_INSTANCE_NAME=
export TRANSITCLOCK_DATABASE_NAME=
export TRANSITCLOCK_WEB_PORT=
export TRANSITCLOCK_DATABASE_PORT=
export TRANSITCLOCK_GTFS_URL=
export TRANSITCLOCK_ACENCY_NAME=
export TRANSITCLOCK_ACENCYID=
export TRANSITCLOCK_APIKEY=

docker run --rm --link  $TRANSITCLOCK_DATABASE_NAME -p $TRANSITCLOCK_WEB_PORT:8080 \
    -e JAVA_OPTS="-Dtransitclock.db.dbUserName=$TRANSITCLOCK_DATABASE_USER \
    -Dtransitclock.db.dbPassword=$TRANSITCLOCK_DATABASE_PASSWORD \
    -Dtransitclock.db.dbName=$TRANSITCLOCK_ACENCY_NAME \
    -Dtransitclock.db.dbHost=$TRANSITCLOCK_DATABASE_NAME:$TRANSITCLOCK_DATABASE_PORT \
    -Dtransitclock.core.agencyId=$TRANSITCLOCK_ACENCYID \
    -Dtransitclock.apikey=$TRANSITCLOCK_APIKEY \
    -Dtransitclock.configFiles='/usr/local/transitclock/config/transitclock.properties'"  \
    transitclock-web-server
