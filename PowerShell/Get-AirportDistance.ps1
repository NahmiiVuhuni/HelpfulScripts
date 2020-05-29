Add-Type -AssemblyName System.Device

$dep = @()
For ($i = 0; $i -lt 14; $i++)
{
    $dep += 
    @{
        "ICAO" = "NONE"
        "Location" = (New-Object System.Device.Location.GeoCoordinate 0, 0)
    }
}

$dep[0].ICAO = "EBBR"
$dep[0].Location = New-Object System.Device.Location.GeoCoordinate 50.901389, 4.484444
$dep[1].ICAO = "EDDK"
$dep[1].Location = New-Object System.Device.Location.GeoCoordinate 50.865833, 7.142778
$dep[2].ICAO = "EFHK"
$dep[2].Location = New-Object System.Device.Location.GeoCoordinate 60.317222, 24.963333
$dep[3].ICAO = "EGCC"
$dep[3].Location = New-Object System.Device.Location.GeoCoordinate 53.353889, -2.275
$dep[4].ICAO = "EHAM"
$dep[4].Location = New-Object System.Device.Location.GeoCoordinate 52.308056, 4.764167
$dep[5].ICAO = "EIDW"
$dep[5].Location = New-Object System.Device.Location.GeoCoordinate 53.421389, -6.27
$dep[6].ICAO = "EPWA"
$dep[6].Location = New-Object System.Device.Location.GeoCoordinate 52.165833, 20.967222
$dep[7].ICAO = "LDZA"
$dep[7].Location = New-Object System.Device.Location.GeoCoordinate 45.743056, 16.068889
$dep[8].ICAO = "LEMD"
$dep[8].Location = New-Object System.Device.Location.GeoCoordinate 40.472222, -3.560833
$dep[9].ICAO = "LIRF"
$dep[9].Location = New-Object System.Device.Location.GeoCoordinate 41.800278, 12.238889
$dep[10].ICAO = "LJLJ"
$dep[10].Location = New-Object System.Device.Location.GeoCoordinate 46.224444, 14.456111
$dep[11].ICAO = "LOWW"
$dep[11].Location = New-Object System.Device.Location.GeoCoordinate 48.110833, 16.570833
$dep[12].ICAO = "LPPT"
$dep[12].Location = New-Object System.Device.Location.GeoCoordinate 38.774167, -9.134167
$dep[13].ICAO = "LROP"
$dep[13].Location = New-Object System.Device.Location.GeoCoordinate 44.571111, 26.085


$arr = @()
For ($i = 0; $i -lt 16; $i++)
{
    $arr += 
    @{
        "ICAO" = "NONE"
        "Location" = New-Object System.Device.Location.GeoCoordinate 0, 0
    }
}

$arr[0].ICAO = "CYVR"
$arr[0].Location = New-Object System.Device.Location.GeoCoordinate 49.194722, -123.183889
$arr[1].ICAO = "CYYZ"
$arr[1].Location = New-Object System.Device.Location.GeoCoordinate 43.676667, -79.630556
$arr[2].ICAO = "KATL"
$arr[2].Location = New-Object System.Device.Location.GeoCoordinate 33.636667, -84.428056
$arr[3].ICAO = "KBOS"
$arr[3].Location = New-Object System.Device.Location.GeoCoordinate 42.363056, -71.006389
$arr[4].ICAO = "KDEN"
$arr[4].Location = New-Object System.Device.Location.GeoCoordinate 39.861667, -104.673056
$arr[5].ICAO = "KDFW"
$arr[5].Location = New-Object System.Device.Location.GeoCoordinate 32.896944, -97.038056
$arr[6].ICAO = "KJFK"
$arr[6].Location = New-Object System.Device.Location.GeoCoordinate 40.639722, -73.778889
$arr[7].ICAO = "KMCO"
$arr[7].Location = New-Object System.Device.Location.GeoCoordinate 28.429444, -81.308889
$arr[8].ICAO = "KMEM"
$arr[8].Location = New-Object System.Device.Location.GeoCoordinate 35.0425, -89.976667
$arr[9].ICAO = "KMIA"
$arr[9].Location = New-Object System.Device.Location.GeoCoordinate 25.793333, -80.290556
$arr[10].ICAO = "KMSP"
$arr[10].Location = New-Object System.Device.Location.GeoCoordinate 44.881944, -93.221667
$arr[11].ICAO = "KORD"
$arr[11].Location = New-Object System.Device.Location.GeoCoordinate 41.978611, -87.904722
$arr[12].ICAO = "KPDX"
$arr[12].Location = New-Object System.Device.Location.GeoCoordinate 45.521667, -122.749167
$arr[13].ICAO = "KSEA"
$arr[13].Location = New-Object System.Device.Location.GeoCoordinate 47.448889, -122.309444
$arr[14].ICAO = "KSFO"
$arr[14].Location = New-Object System.Device.Location.GeoCoordinate 37.745556, -122.377778
$arr[15].ICAO = "KSLC"
$arr[15].Location = New-Object System.Device.Location.GeoCoordinate 40.788333, -111.977778


$dist = @()

For ($i = 0; $i -lt $dep.Length; $i++)
{
    For ($j = 0; $j -lt $arr.Length; $j++)
    {
        $dist += 
        @{
            "DepICAO" = $dep[$i].ICAO
            "ArrICAO" = $arr[$j].ICAO
            "Distance" = [Math]::Round($dep[$i].Location.GetDistanceTo($arr[$j].Location) / 1000)
        }
    }
}

$dist | Sort-Object { $_.Distance } | Select-Object @{n="DepICAO";e={$_.DepICAO}}, @{n="ArrICAO";e={$_.ArrICAO}}, @{n="Distance";e={[string]$_.Distance+"km"}}
