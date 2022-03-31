export GOPROXY=direct

sudo apt-get update
sudo apt-get install gcc-mingw-w64-i686 gcc-multilib

CGO_ENABLED=0 GOOS=linux GOARCH=s390x go build -ldflags "-s -w -extldflags -static -extldflags -static"  ./cmd/npc/npc.go

tar -czvf linux_s390x_client.tar.gz npc conf/npc.conf conf/multi_account.conf

CGO_ENABLED=0 GOOS=linux GOARCH=s390x go build -ldflags "-s -w -extldflags -static -extldflags -static" ./cmd/nps/nps.go

tar -czvf linux_s390x_server.tar.gz conf/nps.conf conf/tasks.json conf/clients.json conf/hosts.json conf/server.key  conf/server.pem web/views web/static nps

sudo mkdir /home/nps_s390x 

sudo cp linux_s390x_client.tar.gz /home/nps_s390x  

sudo cp linux_s390x_server.tar.gz /home/nps_s390x  
