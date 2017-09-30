all: compile

DOCKERBUILD = docker build --tag ${1} --label ${1} ${1}
DOCKERRUN = \
	docker rm ${1} ; \
	docker run --dns=`./ip_of_slowdns` --name=${1} ${1}

compile: compile-slowdns compile-test-curl compile-test-nslookup

compile-slowdns:
	$(call DOCKERBUILD,slowdns)

compile-test-curl:
	$(call DOCKERBUILD,test-curl)

compile-test-nslookup:
	$(call DOCKERBUILD,test-nslookup)

run-slowdns: compile-slowdns
	- docker rm slowdns
	docker run --name=slowdns slowdns

run-test-curl: compile-test-curl
	$(call DOCKERRUN,test-curl)

run-test-nslookup: compile-test-nslookup
	$(call DOCKERRUN,test-nslookup)
