#!/usr/bin/env bash
kubectl apply -f inventory/config/config.yaml
kubectl apply -f inventory/services/inventory-service.yaml