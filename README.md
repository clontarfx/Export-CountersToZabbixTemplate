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
  - ✔ Items
  - ✔ Graphs
  - ✔ Screens

You **will not** get;
  - ❌ Low Level Discovery (I might write a different Template for LLD for Counters)
  - ❌ Triggers (How do I know what you consider a problem?)

As time goes on I might get a bit fancy with it, but for now, enjoy a valid Zabbix 5.0 template for your Performance Counter of choice!
