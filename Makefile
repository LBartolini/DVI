up: # starts Dind
	docker compose up -d

stop: # stops Dind
	docker compose stop

rm: # removes Dind
	docker compose rm dind

inside: # access Shell inside Dind
	docker exec -it dvi-dind-1 /bin/sh

dvi-start: dvi-dovesnap-up dvi-sysctl # starts DVI inside Dind
	docker exec -it dvi-dind-1 /bin/sh -c "cd /DVI; chmod +x start.sh; ./start.sh"

dvi-stop: # stops DVI inside Dind
	docker exec -it dvi-dind-1 /bin/sh -c "cd /DVI; docker compose stop"

dvi-down: # down DVI inside Dind
	docker exec -it dvi-dind-1 /bin/sh -c "cd /DVI; docker compose down"

dvi-build: # build DVI inside Dind
	docker exec -it dvi-dind-1 /bin/sh -c "cd /DVI; docker compose build"

dvi-ps: # docker ps inside Dind
	docker exec dvi-dind-1 /bin/sh -c "cd /DVI; docker compose ps"

dvi-dovesnap-up: # starts Dovesnap inside Dind
	docker exec -it dvi-dind-1 /bin/sh -c "cd /DVI/framework/dovesnap; docker compose -f dovesnap.yml up -d"

dvi-dovesnap-down: # starts Dovesnap inside Dind
	docker exec -it dvi-dind-1 /bin/sh -c "cd /DVI/framework/dovesnap; docker compose -f dovesnap.yml down --volumes"

dvi-sysctl: # Executes sysctl tweak script inside Dind
	docker exec dvi-dind-1 /bin/sh -c "sysctl -w fs.inotify.max_user_instances=262144"
