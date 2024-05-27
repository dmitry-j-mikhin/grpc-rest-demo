set -ex

[ -f ~/.tokens ] && source ~/.tokens
docker run -it --rm \
 --name angie-wmx \
 --hostname angie-wmx \
 -e "TARANTOOL_MEMORY_GB=0.2" \
 -e "WALLARM_API_HOST=api.wallarm.ru" \
 -e "WALLARM_API_TOKEN=${NODE_TOKEN}" \
 -v acme_data:/var/lib/angie/acme \
 -v `realpath angie.conf`:/etc/angie/angie.conf \
 -v `realpath default.conf`:/etc/angie/http.d/default.conf \
 `#-p 80:80` \
 -p 443:443 \
 wmx-public.gitlab.yandexcloud.net:5050/wmx-public/container-images/meganode:4.6 "$@"
