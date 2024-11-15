# Delete Microsoft Hyper-V snapshots older than 30 days.

$days = 30
$aMonthAgo = (Get-Date).AddDays(-$days)

foreach ($snapshot in Get-VMSnapshot -VMName *) {
    if ($snapshot.CreationTime -lt $aMonthAgo) {
        $vmname = $snapshot.VMName
        $snapname = $snapshot.Name
        Write-Output "Delete '$snapname' of VM  '$vmname'"
        Remove-VMSnapshot -VMName $vmname -Name $snapname -Confirm
    }
}