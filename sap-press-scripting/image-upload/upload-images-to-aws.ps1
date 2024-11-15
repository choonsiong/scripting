# This script upload all image files in the currect directory that
# have changed since the last time the script was run or that have
# been added since then to a bucket on the S3 from AWS.

if (Test-Path -Path "last-run") {
    $lastRunTime = (Get-Item -Path "last-run").LastWriteTime
    (Get-Children "last-run").LastWriteTime = Get-Date
} else {
    $lastRunTime = New-Object DateTime(2000, 1, 1)
    New-Item "last-run" | Out-Null
}

Get-Children -Path "*.jpg", "*.jpeg", "*.png" | 
Where-Object { $_.LastWriteTime -gt $lastRunTime } |
ForEach-Object {
    Write-S3Object -BucketName "my.aws.bucket" -ProfileName "MyProfile" -File $_.Name -Key $_.Name
}