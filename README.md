
# Feed the beast Server

FTB server on dedicated server.

## Requirements

- Docker engine
- git bash
- 7-8GB of RAM

## Installation

* Use git command line to clone the repository.
```bash
git clone git@github.com:GuillianV/Docker-Feed-The-Beast-Installer-Linux-.git
```

* Move to the repo cloned
```bash
cd Docker-Feed-The-Beast-Installer-Linux-
```

* Edit the docker-compose.yml (with your text editor).

```bash
nano docker-compose.yml
```


:::spoiler Check me !


You can find the links of all modpacks [Here](https://feed-the-beast.com/modpacks/server-files) :arrow_backward: 
Select linux, choose your modpack then copy the link of the curl **(Without double quotes ! )** on intel/AMD server

Pick linux
![](https://i.imgur.com/F7iw87H.png)

Choose your modpack 
![](https://i.imgur.com/37fBsFJ.png)

Copy the link
![](https://i.imgur.com/AHn3Exs.png)

:::


<br>

* change in docker-compose.yml ``<LINK_COPIED>(https://api.modpacks.ch/public/modpack/102/6460/server/linux)`` by your link choosed previously

```bash

version: "3.8"
services:
 ftb-server:
  container_name: ftb-server
  build:
   context: .
   args:
    - FILES_URL=<LINK_COPIED>(https://api.modpacks.ch/public/modpack/102/6460/server/linux)
  volumes:
    - ./server-data/server.properties:/app/server.properties
    - ./server-data/eula.txt:/app/eula.txt
    - ./server-data/world/:/app/world
  ports:
   - "25565:25565"
volumes:
  server-data

```


* Save and exit your docker compose then lunch it.
```bash
docker compose up --build --force-recreate -d
```

**That's it !**

## Options

### Server Console acces

* Go trough the running container

```bash
sudo docker exec -it ftb-server bash
```

* the go to minecraft server console

```bash
screen -r
```

* do /help in Mc console


#### Leave console

* leave the screen (detach) by typing on keybord : 

``ctrl a + d``

* leave the running container

```bash
exit
```

**You're back**

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

contact me if needed : guillianvibert90@gmail.com
