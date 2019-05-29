#! /bin/bash

openssl genrsa -out example.key 2048

openssl req -new -key example.key -out example.csr -subj "/CN=username/O=your_namespace"

# This is a self-signed certificate
openssl x509 -req -days 365 -in example.csr -signkey example.key -out example.crt

kubectl config set-credentials username --client-certificate=example.crt --client-key=example.key

kubectl config set-context context_name --cluster=your_cluster --namespace=your_namespace --user=username

kubectl config use-context context_name