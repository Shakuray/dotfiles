function dl{
    if ($args.Count -eq 0) {
        Write-Host "Use: dl <label>"
        exit 1
    }

    $LABEL = $args[0]

    $CONTAINER_ID = docker ps --format "{{.ID}}\t{{.Labels}}" | Where-Object { $_ -match $LABEL } | Select-Object -First 1 | ForEach-Object { ($_ -split "\t")[0] }

    if (-not $CONTAINER_ID) {
        docker ps
        Write-Host "❌ Docker container not found with container label '$LABEL'."
        return
    }

    docker logs $CONTAINER_ID -ft
}