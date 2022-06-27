#!/usr/bin/env bash

cat << EOS > firebase.json
{
  "emulators": {
    "auth": {
      "port": ${FIREBASE_AUTH_PORT:-4001}
    },
    "firestore": {
      "port": ${FIREBASE_FIRESTORE_PORT:-4002}
    },
    "ui": {
      "enabled": false
    }
  }
}
EOS

firebase emulators:start --import=./local-data --export-on-exit
