# Récupérer la liste des nœuds
$nodes = kubectl get nodes -o jsonpath='{.items[*].metadata.name}'

# Convertir la liste en tableau
$nodesArray = $nodes -split " "

# Vérifier qu'on a bien 10 nœuds
if ($nodesArray.Count -ne 10) {
    Write-Host "❌ Erreur : Ce script attend exactement 10 nœuds."
    exit 1
}

# Appliquer les labels
Write-Host "🏷️  Labellisation des nœuds..."
kubectl label node $nodesArray[0] back=true node-order=0 --overwrite
kubectl label node $nodesArray[1] front=true node-order=1 --overwrite
kubectl label node $nodesArray[2] front=true node-order=2 --overwrite
kubectl label node $nodesArray[3] front=true node-order=3 --overwrite
kubectl label node $nodesArray[4] front=true node-order=4 --overwrite
kubectl label node $nodesArray[5] front=true node-order=5 --overwrite
kubectl label node $nodesArray[6] front=true node-order=6 --overwrite
kubectl label node $nodesArray[7] front=true node-order=7 --overwrite
kubectl label node $nodesArray[8] front=true node-order=8 --overwrite
kubectl label node $nodesArray[9] front=true node-order=9 --overwrite


Write-Host "✅ Labellisation terminée !"