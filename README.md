# Example of IRIS with mirroring in docker-compose

Docker compose environment with demo IRIS configured with Mirroring and controlled by arbiter

## Requirements

- docker
- docker-compose
- IRIS and arbiter images version 2019.4.0.383.0
- iris.key in your home directory

## Usage

```shell
docker-compose build
docker-compose up
```

After start, master node should be available by URL
http://localhost:9092/csp/sys/op/%25CSP.UI.Portal.Mirror.Monitor.zen
![master](https://raw.githubusercontent.com/daimor/iris-mirror-with-docker/master/images/master.png)

and backup node by URL
http://localhost:9093/csp/sys/op/%25CSP.UI.Portal.Mirror.Monitor.zen
![backup](https://raw.githubusercontent.com/daimor/iris-mirror-with-docker/master/images/backup.png)

Any changes in DEMO database in master will appear in backup node, in a while
http://localhost/csp/demo/Demo.Main.cls
http://localhost/csp/sys/%25CSP.Portal.Home.zen
http://localhost:8080/api/sam/app/index.csp

On balencer attach shell and ./configHttpd.sh