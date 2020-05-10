docker run \
    -it \
    --rm \
    -e REACT_APP_ENV=production \
    -v ${PWD}:/app \
    -v /app/node_modules \
    -p 3002:3000 \
    -e CHOKIDAR_USEPOLLING=true \
    chronicle-frontend:dev
