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

## Scripts custom ajoutés dans le container ords-developer

Afin de disposer d’une instance la plus opérationnelle possible, j’ai rajouté plusieurs scripts qui réalisent les taches additionnelles suivantes : 
- Création d’un workspace par défaut qui s’appelle DEMO
- Ajouts des ACL pour permettre un accès à des ressources externes sur internet depuis une application APEX.
- Ajout d’une bannière avec le nom du node pour identifier rapidement sur quelle instance on se situe
- Modification de certaines directives ORDS dans le cas d’une utilisation d’Ingress en proxy https.
- Création d’un database Link vers la base DATA
- Import optionnel d’une application APEX existante

Tous les scripts sh et sql sont enregistrés dans un configmap (ords-configmap) qui est monté comme un volume et mappé sur un répertoire. Pour rappel, la taille maximale d’un configMap est de 1 Mo.

La bannière de type « instance » est créée à partir d’un api plsql fournie avec APEX. On prend le nom du node ainsi que son numéro d’index qui servira pour fixer une couleur arbitraire entre 1et 16.


