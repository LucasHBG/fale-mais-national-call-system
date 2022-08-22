# fale_mais_flutter

This project was made for LOLDesign's Technical Challenge 

## Getting Started

### How to run locally in your computer

In order to run this mobile application **LOCALLY** you need to:
- Install Flutter SDK (which includes Dart SDK)
- Install all libraries by typing `flutter get pub`
- Run this program by typing `flutter run`

### How to run using Docker

As an alternative to install things locally you can use Docker + Compose:
- Go to root folder and type `docker compose up` 
- In case you want to build all containers just type `docker compose build`
- Or build specific container: `docker compose build service_name`

To install Flutter and Android SDK with APK version 30 I've used [Cirrus's][cirrusci] image from Docker Hub

[cirrusci]:(https://hub.docker.com/layers/flutter/cirrusci/flutter/3.0.5/images/sha256-622b4f7df9ac666206787f60044347a892d9bf4288255ca50604c9a8e95a5da4?context=explore)