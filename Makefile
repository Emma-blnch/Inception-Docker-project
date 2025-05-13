# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eblancha <eblancha@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/30 10:42:25 by eblancha          #+#    #+#              #
#    Updated: 2025/05/13 08:43:01 by eblancha         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

# '-d' pour lancer les containers en arriere plan - 'up' construit les containers
up : 
	docker-compose -f ./srcs/docker-compose.yml up -d

# 'down' arrete les services/containers et les supprime completement (sauf volume)
down : 
	docker-compose -f ./srcs/docker-compose.yml down

# 'stop' arrete les containers mais ne supprime pas les containers/reseaux
stop : 
	docker-compose -f ./srcs/docker-compose.yml stop

# 'restart' redemarre les services et containers 
restart : 
	docker-compose -f ./srcs/docker-compose.yml restart

# affiche liste des containers en cours d'exec
status : 
	docker ps

clean:
	docker-compose -f ./srcs/docker-compose.yml down --remove-orphans

fclean:
	docker-compose -f ./srcs/docker-compose.yml down --remove-orphans
	docker image rm inception-nginx inception-wordpress inception-mariadb -f || true
	docker builder prune -f

re:
	docker-compose -f ./srcs/docker-compose.yml down
	docker-compose -f ./srcs/docker-compose.yml up --build -d

.PHONY: all up down stop restart status fclean re