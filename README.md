# 🚧 Inception - Projet Docker [EN COURS]

Ce projet est réalisé dans le cadre de la formation à l'école 42.  
L'objectif est de configurer une infrastructure complète de services en utilisant **Docker** et **Docker Compose**, sans outil d'orchestration externe.


## 🔧 Objectifs du projet

- Créer une stack de conteneurs Docker auto-suffisante et isolée.
- Déployer et configurer les services suivants :
  - **NGINX** avec un certificat SSL auto-signé
  - **WordPress** installé automatiquement à partir d’un script
  - **MariaDB** pour gérer la base de données
- Utiliser **Docker Compose** pour orchestrer les services
- Gérer la persistance des données via des volumes
- Respecter les bonnes pratiques Docker (structure, sécurité, optimisation d’image)


## 📁 Structure du projet

```bash
srcs/
├── docker-compose.yml
├── .env
├── requirements/
│   ├── nginx/          # Dockerfile + conf SSL + config NGINX
│   ├── mariadb/        # Dockerfile + init DB + config SQL
│   └── wordpress/      # Dockerfile + setup WordPress auto
├── Makefile            # Commandes utiles : up, down, clean...
└── .env.example        # Variables d’environnement à adapter
```
     
## 🖥️ Services inclus

Service	| Description
NGINX |	Serveur web HTTPS avec certificat auto-signé
WordPress	| Installation auto, configuré via variables d’environnement
MariaDB	| Base de données persistante avec utilisateur dédié    


## 📌 Statut : EN COURS

Le projet est en cours de finalisation sur ma machine virtuelle Debian.
