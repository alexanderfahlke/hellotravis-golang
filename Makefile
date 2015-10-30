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
	go get -d -v github.com/alexanderfahlke/hellotravis/...

updatedeps:
	go get -d -v -u -f github.com/alexanderfahlke/hellotravis/...

testdeps:
	go get -d -v -t github.com/alexanderfahlke/hellotravis/...

updatetestdeps:
	go get -d -v -t -u -f github.com/alexanderfahlke/hellotravis/...

build: deps
	go build github.com/alexanderfahlke/hellotravis/...

test: testdeps
	go test -v -cpu 1,4 github.com/alexanderfahlke/hellotravis/...

testrace: testdeps
	go test -v -race -cpu 1,4 github.com/alexanderfahlke/hellotravis/...

clean:
	go clean github.com/alexanderfahlke/hellotravis/...

coverage: testdeps
	goveralls -v github.com/alexanderfahlke/hellotravis/...

testlocal: testdeps
	go test -v -cpu 1,4 -coverprofile coverage.out
	go tool cover -html=coverage.out -o coverage.html
