$RebootTime = Read-Host "Indiquez la date et heure de redémarrage au format JJ/MM/AAAA HH:MM"
$Seconds = (New-TimeSpan -Start $(Get-Date -UFormat "%d/%m/%Y %R") -End "$RebootTime").TotalSeconds
shutdown /s /f /t $Seconds | Out-Null

if ($Seconds -lt 0) {
    $Error.Count = 1
}

if($Error.Count -eq 0) {
    Write-Host -ForegroundColor Green "Arrêt programmé pour le $RebootTime !"
    $Result = 1
    sleep 5
}else{
    Write-Host -ForegroundColor Red "Échec de programmation de l'arrêt. Vérifiez que le format de l'heure saisi est correct et qu'aucun arrêt n'est déjà prévu !"
    sleep 60
}
