#!/bin/bash

# Initialisation du cluster Kubernetes
kubeadm init --pod-network-cidr=10.244.0.0/16

# Pour commencer à utiliser votre cluster, vous devez exécuter les commandes suivantes en tant qu'utilisateur normal :
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Déploiement du réseau CNI (ici nous utilisons Cilium)
kubectl apply -f cilium.yaml

echo "Cluster Kubernetes initialisé et Cilium appliqué."

