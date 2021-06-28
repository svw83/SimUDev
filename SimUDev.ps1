class Device {
    [string]$deviceType

    [string]getDeviceType(){
        return $this.deviceType
    }
}
class Disk : Device{
    [int]$diskIndex
    [string]$diskStatus
    
    Disk(){
        $this.deviceType = "Disk"
    }
}
class Storage : Device {
    [Disk[]]$storageDisks

    Storage(){
        $this.deviceType = "Storage"
    }
}

$s = [Storage]::new()
$s.getDeviceType()

#$s | Get-Member