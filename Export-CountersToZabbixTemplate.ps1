param($CounterSet)

clear

$CounterCount=((Get-Counter -ListSet $CounterSet).Counter).Count
$ScreenVSize=[math]::Round(($CounterCount/2),0)+1

# Start Start Template
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
# End Start Template

# Start Items
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
Write-Host "          </items>"
# End Items

# Start Screens
Write-Host "
          <screens>
		  <screen>
					<name>$CounterSet</name>
						<hsize>2</hsize>
						<vsize>$ScreenVSize</vsize>
						<screen_items>"

# Initialise loop
$x=0
$y=0

# Start Screen Items
$(foreach ($counter in ((Get-Counter -ListSet $CounterSet).Counter)) {

# Reset x value for next row y
if ($x -eq 2) {$y++; $x=0}

    Write-Host "							<screen_item>
								<resourcetype>1</resourcetype>
								<style>0</style>
								<resource>
									<key>perf_counter[&quot;$counter&quot;]</key>
									<host>Template Performance Counter - $CounterSet</host>
								</resource>
                                <width>500</width>
								<height>100</height>
								<x>$x</x>
								<y>$y</y>
								<colspan>1</colspan>
								<rowspan>1</rowspan>
								<elements>0</elements>
								<valign>0</valign>
								<halign>0</halign>
								<dynamic>0</dynamic>
								<sort_triggers>0</sort_triggers>
								<url/>
								<application/>
								<max_columns>3</max_columns>
							</screen_item>"

# Next column
$x++

})
# End Screen Items

# Start Template End
Write-Host "						</screen_items>
					</screen>
				</screens>
        </template>
    </templates>"
# End Template End

# Start Graphs
Write-Host "<graphs>"

$(foreach ($counter in ((Get-Counter -ListSet $CounterSet).Counter)) {
    Write-Host "                <graph>
                        <name>$counter</name>
                        <graph_items>
                            <graph_item>
                                <sortorder>1</sortorder>
                                <color>199C0D</color>
                                <item>
                                    <host>Template Performance Counter - $CounterSet</host>
                                    <key>perf_counter[&quot;$counter&quot;]</key>
                                </item>
                            </graph_item>
                        </graph_items>
                    </graph>"
})
Write-Host "	</graphs>"
# End Graphs

# End Zabbix Template
Write-Host "</zabbix_export>"
