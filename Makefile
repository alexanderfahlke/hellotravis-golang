.PHONY: \
	all \
	deps \
	updatedeps \
	testdeps \
	updatetestdeps \
	build \
	test \
	testrace \
	clean \

all: test testrace

deps:
	go get -d -v github.com/alexanderfahlke/hellotravis-golang/...

updatedeps:
	go get -d -v -u -f github.com/alexanderfahlke/hellotravis-golang/...

testdeps:
	go get -d -v -t github.com/alexanderfahlke/hellotravis-golang/...

updatetestdeps:
	go get -d -v -t -u -f github.com/alexanderfahlke/hellotravis-golang/...

build: deps
	go build ./...

test: testdeps
	go test -v -cpu 1,4 ./...

testrace: testdeps
	go test -v -race -cpu 1,4 ./...

clean:
	go clean ./...

coverage: testdeps
	goveralls -v ./...
