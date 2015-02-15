gcloud preview container clusters create cluster4

#Start MySQL pod and Service
gcloud preview container pods create --config-file mysql-pod.json
gcloud preview container services create --config-file mysql-service.json

#Start Zend Server services BEFORE the pod itself
gcloud preview container services create --config-file zs-service.json
gcloud preview container services create --config-file zs-ui-service.json

gcloud preview container pods create --config-file zs-pod.json

#Add firewall rule to allow access to ZS UI
gcloud compute firewall-rules create zs-10081 --allow tcp:10081 --target-tags k8s-cluster4-node
