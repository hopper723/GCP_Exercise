#! /bin/bash

gcloud projects create your-project-id --labels=function=practice --name=your-project-name

gcloud projects list

gcloud config set project your-project-id

gcloud services list

gcloud alpha billing projects link your-project-id --billing-account billing-acc-id

gcloud services enable compute.googleapis.com