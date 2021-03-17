param($CounterSet)

clear

Write-Host "
<?xml version=""1.0"" encoding=""UTF-8""?>
<zabbix_export>
    <version>5.0</version>
    <date>2021-03-16T05:17:24Z</date>
    <groups>
        <group>
            <name>Templates</name>
        </group>
    </groups>
    <templates>
        <template>
            <template>Template Performance Counter - $CounterSet</template>
            <name>Template Performance Counter - $CounterSet</name>
           <groups>
                <group>
                    <name>Templates</name>
                </group>
            </groups>
            <applications>
                <application>
                    <name>Performance Counters - $CounterSet</name>
                </application>
            </applications>
            <items>
"

$(foreach ($counter in ((Get-Counter -ListSet $CounterSet).Counter)) {
    Write-Host "                <item>
                        <name>$counter</name>
                        <type>ZABBIX_ACTIVE</type>
                        <key>perf_counter[&quot;$counter&quot;]</key>
                        <delay>5m</delay>
                        <applications>
                            <application>
                                <name>Performance Counters - $CounterSet</name>
                            </application>
                        </applications>
                    </item>"
})

Write-Host "          </items>
        </template>
    </templates>
</zabbix_export>"