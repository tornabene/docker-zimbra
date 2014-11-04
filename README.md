docker-zimbra 8.08
=============

### To build:

	Spostarsi nella directory e lanciare il comando
    sudo docker build -t tornabene/docker-zimbra .
### To test:
    sudo docker run  --name zimbra -p 7071:7071 -p 443:443 -p 222:22 -t  tornabene/docker-zimbra

### To run:
    sudo docker run -d --name db -t  tornabene/docker-zimbra
    sudo docker run -P -d --name drupal   tornabene/docker-zimbra

 
 
