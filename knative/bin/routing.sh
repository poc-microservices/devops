#!/usr/bin/env bash
kubectl apply -f route/config-domain.yaml
kubectl apply -f route/routing.yaml