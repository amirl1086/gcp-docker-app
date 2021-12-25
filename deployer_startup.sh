#!/bin/bash

gcloud config set project weighty-elf-336207
gcloud config set compute/zone europe-central2-a
gcloud container clusters get-credentials complex-app-cluster