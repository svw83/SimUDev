class StorageComponents {
    [int]$storageComponentsIndex
    [double]$storageComponentsCapacityGB
    
    [string]$storageComponentsType
    [string]$storageComponentsName
    [string]$storageComponentsStatus

    [string]getStorageComponentsIndex(){
        return $this.storageComponentsIndex
    }

    [string]getStorageComponentsCapacityGB(){
        return $this.storageComponentsCapacityGB
    }

    [string]getStorageComponentsType(){
        return $this.storageComponentsType
    }

    [string]getStorageComponentsName(){
        return $this.storageComponentsName
    }

    [string]getStorageComponentsStatus(){
        return $this.storageComponentsStatus
    }

    [void]setstorageComponentsIndex([int]$sci){
        $this.storageComponentsIndex = $sci
    } 

    [void]setstorageComponentsCapacityGB([double]$scc){
        $this.storageComponentsCapacityGB = $scc
    }

    [void]setStorageComponentsType([string]$sct){
        $this.storageComponentsType = $sct
    }

    [void]setStorageComponentsName([string]$scn){
        $this.storageComponentsName = $scn
    }

    [void]setStorageComponentsStatus([string]$scs){
        $this.storageComponentsStatus = $scs
    }
}

class Disk : StorageComponents {
    Disk(){
        $this.storageComponentsType = "Disk"
    }
}

class PowerSupplyUnit : StorageComponents {
    PowerSupplyUnit(){
        $this.storageComponentsType = "PSU"
    }
}

class Storage {
    [String]$storageBrand
    [String]$storageModel
    [Disk]$storageDisk

    [string]getStorageBrand(){
        return $this.storageBrand
    }

    [string]getStorageModel(){
        return $this.storageModel
    }

    [void]setStorageBrand([string]$sb){
        $this.storageBrand = $sb
    }

    [void]setStorageModel([string]$sm){
        $this.storageModel = $sm
    }

    [void]setStorageDisk([Disk]$sd){
        $this.storageDisk = $sd
    }
}

class Equallogic : Storage {
    Equallogic(){
        $this.storageBrand = "Dell"
        $this.storageModel = "Equallogic"
    }
}

Clear-Host

$e = [Equallogic]::new()

$e.setStorageDisk([Disk]::new())
$e.storageDisk.setStorageComponentsIndex(1)
$e.storageDisk.setStorageComponentsCapacityGB(500.10)
$e.storageDisk.setStorageComponentsName("Disk1")
$e.storageDisk.setStorageComponentsStatus("Online")
$e.storageDisk.setStorageComponentsType("Disk")

#$e.getStorageBrand()
#$e.getStorageModel()
#$e.storageDisk.getStorageComponentsName()
#$e.storageDisk.getStorageComponentsStatus()
#$e.storageDisk.getStorageComponentsType()

$e
$e.storageDisk