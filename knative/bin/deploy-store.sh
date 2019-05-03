#!/usr/bin/env bash
kubectl apply -f store/config/config.yaml
kubectl apply -f store/services/store-service.yaml