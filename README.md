# google-container-engine-ZendServer
A Google Container Engine recipe utilizing Zend Server Docker image 


First, install the google cli tool and set the project by following this guide:
https://cloud.google.com/container-engine/docs/before-you-begin

Then, clone this repo and cd into it.

- set the availability zone we’ll be using:

gcloud config set compute/zone us-central1-b

#Create cluster
Either using the following commands in order, or by invoking "startup.sh" :

- create a Kuberentes cluster that will host our docker images:

gcloud preview container clusters create cluster4

- create a mysql pod and service:

gcloud preview container pods create --config-file mysql-pod.json

gcloud preview container services create --config-file mysql-service.json

- create Zend Server services and pod:

gcloud preview container services create --config-file zs-service.json

gcloud preview container services create --config-file zs-ui-service.json

gcloud preview container pods create --config-file zs-pod.json

- Add firewall rule to allow access to ZS UI

gcloud compute firewall-rules create zs-10081 --allow tcp:10081 --target-tags k8s-cluster4-node


#Access
To access the containers we must find the external IP that was assigned to them. run:

gcloud compute forwarding-rules list

for cleanup run "cleanup.sh".

