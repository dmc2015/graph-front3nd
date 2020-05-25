docker run \
    -it \
    --rm \
    -e REACT_APP_ENV=production \
    -v ${PWD}:/app \
    -v /app/node_modules \
    -p 3001:3000 \
    -e CHOKIDAR_USEPOLLING=true \
    graph-front3nd_sample:latest
