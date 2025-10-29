# Postman Tester - Docker + Xray Integration

## Description

Ce projet permet d’exécuter des **tests Postman automatisés** à l’aide d’un conteneur Docker basé sur **Newman** (le moteur CLI de Postman).  
Les résultats sont exportés au format **JUnit XML**, ce qui permet leur intégration dans des pipelines **GitLab CI/CD** et leur import automatique dans **Xray Cloud** (Jira).

---

## Sommaire

1. [Fonctionnalités](#fonctionnalités)  
2. [Structure du projet](#structure-du-projet)  
3. [Prérequis](#prérequis)  
4. [Construction de l’image Docker](#construction-de-limage-docker)  
5. [Exécution manuelle](#exécution-manuelle)  
6. [Format de sortie JUnit](#format-de-sortie-junit)  
7. [Intégration avec Xray Cloud](#intégration-avec-xray-cloud)  
8. [Intégration GitLab CI/CD](#intégration-gitlab-cicd)  
9. [Bonnes pratiques](#bonnes-pratiques)  
10. [Licence](#licence)

---

## Fonctionnalités

- Exécution de collections Postman dans un conteneur Docker isolé  
- Support des fichiers d’environnement Postman (`.json`)  
- Export automatique des résultats au format **JUnit**  
- Compatibilité directe avec **Xray Cloud** pour Jira  
- Intégration simple dans un pipeline **GitLab CI/CD**  
- Support des variables d’environnement injectées dynamiquement  

---

## Structure du projet

```
postman-tester/
├── Dockerfile
├── entrypoint.sh
├── collections/
│ ├── collection.json
│ └── env.json
└── results/
```


| Fichier / Dossier | Description |
|--------------------|-------------|
| `Dockerfile` | Définit l’image Docker et installe Newman |
| `entrypoint.sh` | Script d’exécution principal appelé par le conteneur |
| `collections/` | Contient les fichiers Postman (collection et environnement) |
| `results/` | Contient les rapports JUnit générés |

---

## Prérequis

- Docker installé sur la machine locale ou sur le runner GitLab  
- Une collection Postman exportée (`.json`)  
- Un environnement Postman exporté (`.json`)  
- (Optionnel) Un compte Xray Cloud avec un couple `client_id` / `client_secret` pour publier les résultats

---

## Construction de l’image Docker

Depuis le répertoire racine du projet :

```bash
docker build -t postman-tester .
```

## Exécution

```
docker run --rm \
  -v $(pwd)/collections:/collections \
  -v $(pwd)/results:/app/results \
  postman-tester collection.json env.json
```
