# Generate a random suffix
$RandomSuffix = -join ((97..122) + (48..57) | Get-Random -Count 8 | ForEach-Object { [char]$_ })

Write-Host "Generated Random Suffix: $RandomSuffix"
Set-Content -Path "scripts/suffix.txt" -Value $RandomSuffix

# Run Terraform
cd terraform
terraform init
terraform apply -auto-approve -var "random_suffix=$RandomSuffix"
