all: builder binary registry clean

builder:
	docker build -t docker-registry-builder -f Dockerfile.build .

binary:
	docker run --rm -v `pwd`:/src docker-registry-builder /src/build.sh

registry:
	docker build -t docker-registry-arm -f Dockerfile .

clean:
	rm registry config-example.yml
	docker rmi docker-registry-builder

tar:
	docker save -o registry.tar docker-registry-arm
 
