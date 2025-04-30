# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eblancha <eblancha@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/30 10:42:25 by eblancha          #+#    #+#              #
#    Updated: 2025/04/30 10:43:51 by eblancha         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

# '-d' pour lancer les containers en arriere plan - 'up' construit mes containers
up : 
	@docker-compose -f ./srcs/docker-compose.yml up -d

# 'down' arrete les services et containers 
down : 
	@docker-compose -f ./srcs/docker-compose.yml down

# 'stop' arrete les services et containers 
stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

# 'restart' redemarre les services et containers 
restart : 
	@docker-compose -f ./srcs/docker-compose.yml restart

status : 
	@docker ps