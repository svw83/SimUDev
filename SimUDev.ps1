class StorageComponent {
    [int]$storageComponentIndex
    [double]$storageComponentCapacityGB
    
    [string]$storageComponentType
    [string]$storageComponentName
    [string]$storageComponentStatus

    [string]getStorageComponentIndex(){
        return $this.storageComponentIndex
    }

    [string]getStorageComponentCapacityGB(){
        return $this.storageComponentCapacityGB
    }

    [string]getStorageComponentType(){
        return $this.storageComponentType
    }

    [string]getStorageComponentName(){
        return $this.storageComponentName
    }

    [string]getStorageComponentStatus(){
        return $this.storageComponentStatus
    }

    [void]setstorageComponentIndex([int]$sci){
        $this.storageComponentIndex = $sci
    } 

    [void]setstorageComponentCapacityGB([double]$scc){
        $this.storageComponentCapacityGB = $scc
    }

    [void]setStorageComponentType([string]$sct){
        $this.storageComponentType = $sct
    }

    [void]setStorageComponentName([string]$scn){
        $this.storageComponentName = $scn
    }

    [void]setStorageComponentStatus([string]$scs){
        $this.storageComponentStatus = $scs
    }
}

class Disk : StorageComponent {
    Disk(){
        $this.storageComponentType = "Disk"
    }
}

class PowerSupplyUnit : StorageComponent {
    PowerSupplyUnit(){
        $this.storageComponentType = "PSU"
    }
}

class Storage {
    [String]$storageBrand
    [String]$storageModel
    [Disk]$storageDisk
    [PowerSupplyUnit[]]$storagePsus

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

    [void]setstoragePsus([PowerSupplyUnit]$psuObject, [int]$psuIndex){
        $this.storagePsus[$psuIndex] = $psuObject
    }
}

class Equallogic : Storage {
    Equallogic(){
        $this.storageBrand = "Dell"
        $this.storageModel = "Equallogic"
        $this.storagePsus = [PowerSupplyUnit[]]::new(2)
    }
}

Clear-Host

$e = [Equallogic]::new()

$e.setStorageDisk([Disk]::new())
$e.storageDisk.setStorageComponentIndex(1)
$e.storageDisk.setStorageComponentCapacityGB(500.10)
$e.storageDisk.setStorageComponentName("Disk1")
$e.storageDisk.setStorageComponentStatus("Online")
$e.storageDisk.setStorageComponentType("Disk")

(0..1).ForEach({
    $p = [PowerSupplyUnit]::new()

    $p.storageComponentIndex = $_
    $p.storageComponentName = ("PS" + $_.ToString("0"))
    $p.storageComponentStatus = "Online"

    $e.setstoragePsus($p,$_)
})

$e
$e.storageDisk
$e.storagePsus