.PHONY: \
	all \
	testdeps \
	build \
	test \
	testrace \
	clean \

all: test testrace

testdeps:
	go get -d -v -t github.com/alexanderfahlke/hellotravis/...

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
