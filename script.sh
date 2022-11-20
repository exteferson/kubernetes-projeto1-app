#!/bin/bash

echo -e "\nCriando Imagens...\n"

docker image build -t exteferson/projeto-backend:1.0 backend/.
docker image build -t exteferson/projeto-database:1.0 database/.

echo -e "\nRealizando o Push das Imagens...\n"

docker push exteferson/projeto-backend:1.0
docker push exteferson/projeto-database:1.0

echo -e "\nCriando serviços no Cluster Kubernetes...\n"

kubectl apply -f ./services.yml

echo -e "\nRealizando Deploy...\n"

kubectl apply -f ./deployment.yml