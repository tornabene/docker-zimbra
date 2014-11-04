docker-zimbra 8.08
=============

### To build:

	Spostarsi nella directory e lanciare il comando
    sudo docker build -t tornabene/docker-zimbra .
### To test:
	sudo docker run  --rm --name zimbra -p 7071:7071 -p 443:443 -p 222:22   tornabene/docker-zimbra

    sudo docker run  --name zimbra -p 7071:7071 -p 443:443 -p 222:22  -v /opt/zimbra:/opt/zimbra -t  tornabene/docker-zimbra

### To run:
    sudo docker run  --rm --name zimbra -p 7071:7071 -p 443:443 -p 222:22   tornabene/docker-zimbra

 
 

 sudo rsync -azP  root@10.10.130.15:/opt/zimbra /opt/zimbra