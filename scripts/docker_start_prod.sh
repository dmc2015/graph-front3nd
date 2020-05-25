RED='\033[0;34m'
NOCOLOR='\033[0m'
printf "${RED} Container Running On Port 1337, http://localhost:1337 ${NOCOLOR} \n"

docker run \
    -it \
    --rm \
    -p 1337:80 \
    chronicle-frontend:prod
