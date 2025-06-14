#!/bin/sh

for run in 1 2 3 4 5
do
    echo "Try $run"
    docker compose up -d

    unhealthy_containers=$(docker ps --filter 'health=unhealthy' | tail -n +2 | awk '{print $NF}')

    if [ -z "$unhealthy_containers" ]; then
        echo "All containers Healthy :)"
        break
    fi
    echo "Some containers unhealthy. Restarting and retrying!"

    for container in $unhealthy_containers
    do
        docker restart $container
    done
done