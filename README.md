<p align="center">
  <img src="https://github.com/ayogun/42-project-badges/blob/main/badges/inceptionn.png">
</p>

# 🚧 Inception - Docker Project [IN PROGRESS]

This project is part of the 42 school common core.  
It aims to configure a complete infrastructure of services using **Docker** and **Docker Compose**, without any external orchestration tools.


## 🔧 Project objectives

- Create a self-sufficient and isolated Docker container stack.
- Deploy and configure the following services:
  - **NGINX** with a self-signed SSL certificate
  - **WordPress** installed automatically from a script
  - **MariaDB** for database management
- Use **Docker Compose** to orchestrate services
- Manage data persistence via volumes
- Respect Docker best practices (structure, security, image optimization)


## 📁 Project structure

```bash
srcs/
├── docker-compose.yml
├── .env
├── requirements/
│   ├── nginx/          # Dockerfile + conf SSL + config NGINX
│   ├── mariadb/        # Dockerfile + init DB + config SQL
│   └── wordpress/      # Dockerfile + setup WordPress auto
└── Makefile            # Useful commands : up, down, clean...
```
     
## 🖥️ Services included

| Service	| Description |
|---      |---          |
| NGINX | HTTPS Web Server with self-signed certificate |
| WordPress | Auto install, configured via environment variables |
| MariaDB | Persistent database with dedicated user | 


## 📌 Status : IN PROGRESS

The project is being finalized on my Debian virtual machine.
