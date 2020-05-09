echo "CREATING NETWORK"
docker network create -d bridge --subnet 192.168.0.0/24 --gateway 192.168.0.1 chronicle_network
echo "CREATING NETWORK FINISHED"


docker run -d \
-p 9200:9200 \
-it \
--name frontend \
--ulimit memlock=-1:-1 \
--network chronicle_network \
--network-alias chronicle.development \
-h chronicle.development \
-e http.host=0.0.0.0 \
-e transport.host=127.0.0.1 \
-e xpack.security.enabled=false \
-e cluster.name=docker-clusterx \
-e bootstrap.memory_lock=true \
-e ES_JAVA_OPTS="-Xms512m -Xmx512m" \
-e xpack.security.enabled=false \
frontend
echo "CREATING ELASTICSEARCH CONTAINER FINISHED"

echo "SETUP COMPOSED CONTAINERS DB KB & REDIS"
# docker-compose up -d db kb redis
echo "SETUP COMPOSED CONTAINERS FINISHED"