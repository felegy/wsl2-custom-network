import-module -Name .\hcn

$network = @"
{
        "Name" : "WSL",
        "Flags": 9,
        "Type": "ICS",
        "IPv6": false,
        "IsolateSwitch": true,
        "MaxConcurrentEndpoints": 1,
        "Subnets" : [
            {
                "ID" : "FC437E99-2063-4433-A1FA-F4D17BD55C92",
                "ObjectType": 5,
                "AddressPrefix" : "172.29.176.0/20",
                "GatewayAddress" : "172.29.176.1",
                "IpSubnets" : [
                    {
                        "ID" : "4D120505-4143-4CB2-8C53-DC0F70049696",
                        "Flags": 3,
                        "IpAddressPrefix": "172.29.176.0/20",
                        "ObjectType": 6
                    }
                ]
            }
        ],
        "MacPools":  [
            {
                "EndMacAddress":  "00-15-5D-52-CF-FF",
                "StartMacAddress":  "00-15-5D-52-C0-00"
            }
        ],
        "DNSServerList" : "1.1.1.1, 8.8.8.8"
}
"@

Get-HnsNetworkEx | Where-Object { $_.Name -Eq "WSL" } | Remove-HnsNetworkEx
New-HnsNetworkEx -Id B95D0C5E-57D4-412B-B571-18A81A16E005 -JsonString $network