#!/bin/bash 

# Export the contents of .env
set -o allexport
source .env
set +o allexport

if [[ $1 = "clean" ]]; then
  # Delete the stack components
  docker container rm -f db.dev.$ORG
  docker container rm -f www.dev.$ORG
fi

# Start the Docker stack consisting of MySQL and a debugger ready version of WordPress
docker-compose -f docker/docker-compose.yml up -d

# Generate a random 4 character cache buster to avoid the default browser trying to load a different developer WP project
CACHE_BUSTER=$(xxd -l 2 -c 32 -p < /dev/random)
# Open the home page on localhost with the cache buster
xdg-open http://localhost:$WWW_PORT?cache-buster=$CACHE_BUSTER

if [[ $1 = "clean" ]]; then
  # Remind us that a new stack takes a while to initialise 
  printf "\033[33mDon't forget you may see an \033[31mError establishing a database connection \033[33mon a clean start of the stack. Keep refreshing your page...\033[0m\n"
fi
