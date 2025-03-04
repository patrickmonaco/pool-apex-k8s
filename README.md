Mes notes et remarques pour la mise en place d’un pool d’instances Oracle APEX dans un cluster Kubernetes (k8s).

TACHE													COMMANDE													ORDRE
Affecter label aux nodes			Powsershell label_nodes.ps1					1
Créer les secrets							Kubectl create secret ords-secret		2
Créer les CongigMaps					kubectl create configmap …					3
Créer DB DATA									Kubectl apply -f db.yaml						4
Créer les pod Apex						Kubectl apply -f pod-apex.yaml			5
Créer le service Apex					Kubectl apply -f apex-run.yaml			6
Créer le Ingress							Kubectl apply -f ingress-run.yaml		7

