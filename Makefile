up: # starts Dind
	docker compose up -d

stop: # stops Dind
	docker compose stop

rm: # removes Dind
	docker compose rm dind

inside: # access Shell inside Dind
	docker exec -it dvi-dind-1 /bin/sh

dvi-start: # starts DVI inside Dind
	docker exec -it dvi-dind-1 /bin/sh -c "cd /DVI; docker compose up -d" 

dvi-stop: # stops DVI inside Dind
	docker exec -it dvi-dind-1 /bin/sh -c "cd /DVI; docker compose stop"

dvi-down: # down DVI inside Dind
	docker exec -it dvi-dind-1 /bin/sh -c "cd /DVI; docker compose down"

dvi-ps: # docker ps inside Dind
	docker exec dvi-dind-1 docker ps




