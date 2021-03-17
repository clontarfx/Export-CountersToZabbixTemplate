# PerformanceCountersToZabbixTemplate

So previously I forked https://github.com/cavaliercoder/Export-CounterToZabbixTemplate, created by a very talented ex-colleague of mine. Unfortunately I didn't have the skills to update and maintain this for any recent versions of Zabbix or Powershell/.Net.

So I did what any good script kid would do, made something in PowerShell that "just works".

I present to you *PerformanceCountersToZabbixTemplate*!

# Usage

Export-CountersToZabbixTemplate.ps1 <CounterSetName>
e.g `Export-CountersToZabbixTemplate.ps1 'DHCP Server'`

# Obtaining CounterSetName

`(Get-Counter -ListSet *).CounterSetName`