git clone https://github.com/kubernauts/dok-example-us.git
docker pull mhart/alpine-node:8
docker pull quay.io/mhausenblas/stock-gen:0.3
docker run --rm --name stock-gen -p 9876:9876 -e DOK_STOCKGEN_PORT=9876 --user=1001:1001 quay.io/mhausenblas/stock-gen:0.3