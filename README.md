<p align="center">
  <img src="https://github.com/ayogun/42-project-badges/blob/main/badges/inceptione.png">
</p>

# 💾 Inception - Docker Project

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

## 🧠 What I learned

Working on this project taught me much more than just Docker:   
✅ **Containerization fundamentals**: building and managing isolated environments for each service   
✅ **Docker Compose orchestration**: configuring and linking multiple containers seamlessly   
✅ **Security best practices**: setting up users, permissions, SSL, and limiting container privileges   
✅ **Automation and reproducibility**: creating a consistent, portable development environment   
✅ **Problem-solving**: debugging container issues, analyzing logs, and optimizing configuration files   
✅ **System-level understanding**: how services interact, boot sequence matters, and persistent volumes behave   

> It also reinforced key soft skills like rigor, autonomy, and documentation clarity — essential in real-world DevOps work.   

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
