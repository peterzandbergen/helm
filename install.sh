#!/bin/bash

# Based on https://github.com/knative/docs/blob/master/install/Knative-with-GKE.md

GCP_PROJECT=gke-test-myhops

# Create cluster in script
CLUSTER_NAME=helm-test
CLUSTER_ZONE=eu-west4-a

# Create cluster in shell
export CLUSTER_NAME=helm-test
export CLUSTER_ZONE=europe-west4-a

# Set the default project
gcloud config set project $GCP_PROJECT

# Create cluster
gcloud container clusters create $CLUSTER_NAME \
    --zone=$CLUSTER_ZONE \
    --cluster-version=latest \
    --machine-type=n1-standard-4 \
    --enable-autoscaling --min-nodes=1 --max-nodes=10 \
    --enable-autorepair \
    --scopes=service-control,service-management,compute-rw,storage-ro,cloud-platform,logging-write,monitoring-write,pubsub,datastore \
    --num-nodes=3

