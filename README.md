# Export-CountersToZabbixTemplate

So previously I forked https://github.com/cavaliercoder/Export-CounterToZabbixTemplate, created by a very talented ex-colleague of mine. Unfortunately I didn't have the skills to update and maintain this for any recent versions of Zabbix or Powershell/.Net.

So I did what any good script kid would do, made something in PowerShell that "just works".

I present to you *Export-CountersToZabbixTemplate.ps1*!

# Usage

`Export-CountersToZabbixTemplate.ps1 <CounterSetName>`
e.g `Export-CountersToZabbixTemplate.ps1 'DHCP Server'`

# Obtaining CounterSetName

`(Get-Counter -ListSet *).CounterSetName`

# Caveats

You **will** get;
  ✔ Items
  ✔ Graphs
  ✔ Screens

You **will not** get;
  - Anything more than a template to be created with basic items, graphs and screens.
  - It does not do discovery. 
  - It does not do triggers.
  - It doesn't do anything except create an appropriately named template with items, graphs and screens for the given CounterSet.

As time goes on I might get a bit fancy with it, but for now, enjoy a valid Zabbix 5.0 template for your Performance Counter of choice!
