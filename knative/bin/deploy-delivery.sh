#!/usr/bin/env bash
kubectl apply -f delivery/config/config.yaml
kubectl apply -f delivery/services/delivery-service.yaml