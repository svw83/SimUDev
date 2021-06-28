enum DeviceType {
    Undefined = 0
    Compute = 1
    Storage = 2
    Networking = 4
    Communications = 8
    Power = 16
    Rack = 32
}

class Asset {
    [string]$assetBrand
    [string]$assetModel
}

class Device : Asset {
    hidden [DeviceType]$deviceType = [DeviceType]::Undefined

    [string]$deviceStatus
    [string]$deviceHostname
    [string]$deviceSerialNumber
    
    [DeviceType]getDeviceType(){
        return $this.deviceType
    }

    [string]getDeviceBrand(){
        return $this.assetBrand
    }

    [void]setDeviceBrand([string]$ab){
        $this.assetBrand = $ab
    }
}

class ComputeServer : Device {
    hidden [DeviceType]$deviceType = [DeviceType]::Compute   
}

class Disk : Device {
    [string]$diskStatus
    [int]$diskIndex
    [Double]$diskCapacityGB
    [string]$diskName
    [int]$diskRPM
}

class Storage : Device {
    hidden [DeviceType]$deviceType = [DeviceType]::Storage
    [Disk]$storageDisk

    Storage(){
        
    }

    [void]setDisk([Disk]$d){
        $this.storageDisk = $d
    }

    [string]getDiskName(){
        return $this.storageDisk.diskName
    }

    [string]getDiskStatus(){
        return $this.storageDisk.diskStatus
    }

    [int]getDiskIndex(){
        return $this.storageDisk.diskIndex
    }

    [double]getDiskCapacityGB(){
        return $this.storageDisk.diskCapacityGB
    }
}

class Rack : Device {
    hidden [DeviceType]$deviceType = [DeviceType]::Rack
    hidden [int]$Slots = 8

    [string]$Datacenter
    [string]$Location
    [Device[]]$Devices = [Device[]]::new($this.Slots)

    Rack (){
        ## Just create the default rack with 8 slots
    }

    Rack ([int]$s){
        ## Add argument validation logic here
        $this.Devices = [Device[]]::new($s)
    }

    [void] AddDevice([Device]$dev, [int]$slot){
        ## Add argument validation logic here
        $this.Devices[$slot] = $dev
    }

    [void] RemoveDevice([int]$slot){
        ## Add argument validation logic here
        $this.Devices[$slot] = $null
    }
}

Clear-Host

$s = [Storage]::new()

$s.setDisk([Disk]::new())

$s.setDeviceBrand("Dell")
$s.storageDisk.diskIndex = 1
$s.storageDisk.diskStatus = "Online"
$s.storageDisk.diskName = "Disk1"
$s.storageDisk.diskCapacityGB = 500.00


$s.getDeviceType()
$s.getDiskIndex()
$s.getDiskStatus()
$s.getDiskName()
$s.getDiskCapacityGB()
$s.getDeviceBrand()
