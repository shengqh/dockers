date_string='v1.0.5'
docker buildx build --progress=plain -t shengqh/autogvp:${date_string} .
docker image rm -f shengqh/autogvp:latest
docker tag shengqh/autogvp:${date_string} shengqh/autogvp:latest

