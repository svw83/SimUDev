class StorageComponent {
    [string]$storageComponentType
    [int]$storageComponentIndex
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
    [double]$storageComponentCapacityGB
    Disk(){
        $this.storageComponentType = "Disk"
    }
}

class PowerSupplyUnit : StorageComponent {
    PowerSupplyUnit(){
        $this.storageComponentType = "PSU"
    }
}

class Controller : StorageComponent {
    Controller(){
        $this.storageComponentType = "Controller"
    }
}

class Storage {
    [String]$storageBrand
    [String]$storageModel
    [Disk]$storageDisk
    [PowerSupplyUnit[]]$storagePsus
    [Controller[]]$storageControllers
    [int]$storageDiskTotal

    [string]getStorageBrand(){
        return $this.storageBrand
    }

    [string]getStorageModel(){
        return $this.storageModel
    }

    [string]getStorageDiskTotal(){
        return $this.storageDiskTotal
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

    [void]setStoragePsus([PowerSupplyUnit]$psuObject, [int]$psuIndex){
        $this.storagePsus[$psuIndex] = $psuObject
    }

    [void]setStorageControllers([Controller]$controllerObject, [int]$controllerIndex){
        $this.storageControllers[$controllerIndex] = $controllerObject
    }

    [void]setStorageDiskTotal([int]$sdt){
        $this.storageDiskTotal = $sdt
    }
}

class Equallogic : Storage {
    Equallogic(){
        $this.storageBrand = "Dell"
        $this.storageModel = "Equallogic"
        $this.storagePsus = [PowerSupplyUnit[]]::new(2)
        $this.storageControllers = [Controller[]]::new(2)
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

(0..1).ForEach({
    $c = [Controller]::new()

    $c.storageComponentIndex = $_
    $c.storageComponentName = ("Controller" + $_.ToString("0"))
    $c.storageComponentStatus = "Online"

    $e.setStorageControllers($c,$_)
})

$e
$e.storageDisk
$e.storagePsus
$e.storageControllers

$e.setStorageDiskTotal(2)
$e.getStorageDiskTotal()