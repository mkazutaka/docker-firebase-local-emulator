FROM node:16.13.2-bullseye-slim

WORKDIR /app/firebase
ENV HOME=/app/firebase

RUN apt-get update && apt-get install --yes --no-install-recommends openjdk-11-jre

RUN npm install -g firebase-tools@11.0.1
RUN firebase setup:emulators:ui
RUN firebase setup:emulators:firestore

CMD firebase emulators:start --import=./local-data --export-on-exit

