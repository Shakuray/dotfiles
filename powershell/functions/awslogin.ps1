function awslogin(){

    if ( $env:AWS_REGION -eq $null ){
        Write-Error '❌ AWS_REGION env var is not set' -ErrorAction Stop
        Return
    }
    if ( $env:AWS_URL -eq $null ){
        Write-Error '❌ AWS_URL env var is not set' -ErrorAction Stop
        Return
    }
    
    aws ecr get-login-password --region $env:AWS_REGION | docker login --username AWS --password-stdin $env:AWS_URL

}