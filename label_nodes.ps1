# Récupérer la liste des nœuds
$nodes = kubectl get nodes -o jsonpath='{.items[*].metadata.name}'

# Convertir la liste en tableau
$nodesArray = $nodes -split " "

# Vérifier qu'on a bien 3 nœuds
if ($nodesArray.Count -ne 3) {
    Write-Host "❌ Erreur : Ce script attend exactement 3 nœuds."
    exit 1
}

# Appliquer les labels
Write-Host "🏷️  Labellisation des nœuds..."
kubectl label node $nodesArray[0] front=true node-order=1 --overwrite
kubectl label node $nodesArray[1] front=true node-order=2 --overwrite
kubectl label node $nodesArray[2] back=true node-order=3 --overwrite

Write-Host "✅ Labellisation terminée !"