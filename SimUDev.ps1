class Device {
    [string]$deviceBrand
    [string]$deviceModel

    displayDevice(){}

    [string]getDeviceBrand(){
        return $this.deviceBrand
    }
}

class StorageComponents {
    [int]$storageComponentIndex
    [string]$storageComponentStatus
}

class PowerSupplyUnit : StorageComponents {
    [string]$storageComponentType = "PSU"

    [string]getPowerSupplyUnitInformation(){
        return $this.storageComponentStatus
    }
}

class Storage : Device {
    [PowerSupplyUnit]$powerSupplyUnit

    [string]getDevice(){
        return "I'm a Storage"
    }

    [void]setPowerSupplyUnit([PowerSupplyUnit]$psu){
        $this.powerSupplyUnit = $psu
    }
}

Clear-Host
$s = [Storage]::new()
$s.getDevice()
$s.deviceBrand = "Dell"
$s.getDeviceBrand()
$s.setPowerSupplyUnit([PowerSupplyUnit]::new())
$s.powerSupplyUnit.storageComponentIndex = 1
$s.powerSupplyUnit.storageComponentStatus = "Online"
$s.powerSupplyUnit.getPowerSupplyUnitInformation()
