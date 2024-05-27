set -ex

docker run -it --rm --network=host \
 -v `realpath helloworld.proto`:/tmp/helloworld.proto \
 -w /tmp \
 fullstorydev/grpcurl \
   -import-path . \
   -proto helloworld.proto \
   -d '{"name": "world"}' \
   grpc-rest-demo.tw1.ru:443 helloworld.Greeter/SayHello
