#!/bin/bash

# Değişkenler
RG="k8s-monitoring-lab"
LOC="eastus"
CLUSTER="aks-lab-cluster"

echo "🚀 Azure kaynakları oluşturuluyor..."
az group create --name $RG --location $LOC

echo "☸️ AKS Cluster kuruluyor (Bu biraz vakit alabilir)..."
az aks create --resource-group $RG --name $CLUSTER --node-count 1 --node-vm-size Standard_B2s --generate-ssh-keys

echo "🔐 Kimlik bilgileri alınıyor..."
az aks get-credentials --resource-group $RG --name $CLUSTER

echo "✅ İşlem tamam! 'kubectl get nodes' komutu ile kontrol edebilirsin."