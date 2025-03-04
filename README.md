# Pool d’instances APEX sous Kubernetes
Mes notes et remarques pour la mise en place d’un pool d’instances Oracle APEX dans un cluster Kubernetes (k8s). 

Liste des taches: 

- Affecter label aux nodes			Powsershell label_nodes.ps1					
- Créer les secrets							Kubectl create secret ords-secret		
- Créer les CongigMaps					kubectl create configmap …					
- Créer DB DATA									Kubectl apply -f db.yaml						
- Créer les pod Apex						Kubectl apply -f pod-apex.yaml			
- Créer le service Apex					Kubectl apply -f apex-run.yaml			
- Créer le Ingress							Kubectl apply -f ingress-run.yaml		

