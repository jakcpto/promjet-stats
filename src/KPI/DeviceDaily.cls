Class KPI.DeviceDaily Extends %DeepSee.KPI
{

XData KPI [ XMLNamespace = "http://www.intersystems.com/deepsee/kpi" ]
{
<kpi
  xmlns="http://www.intersystems.com/deepsee/kpi"
  name="Promjet/DeviceDaily"
  sourceType="sql"
  sql="Select TO_CHAR(TO_TIMESTAMP(CAST(TS AS VARCHAR(20)), 'YYYY-MM-DD'), 'DD-MON-YYYY'),
       SUM(CASE WHEN Device = 'Android' THEN 1 ELSE 0 end) as Android,
       SUM(CASE WHEN Device = 'Bot' THEN 1 ELSE 0 end) as Bot,
       SUM(CASE WHEN Device = 'IOS' THEN 1 ELSE 0 end) as IOS,
       SUM(CASE WHEN Device = 'Other' THEN 1 ELSE 0 end) as Other,
       SUM(CASE WHEN Device = 'Windows' THEN 1 ELSE 0 end) as Windows
  From
    (select ts, case
        when device IN('WIN64', 'WOW64') or device is null then 'Windows'
        when device = 'LINUX X86_64' or Instr(Device,'Android',1)>0 then 'Android'
        when Instr(Device,'Mac',1)>0 then 'IOS'
        when Instr(Device,'Bot',1)>0 then 'Bot'
        ELSE 'Other' END AS Device
        FROM dc_irisbi.Promjet GROUP BY ip)
  Group by ts"
  caption="DeviceDailyKPI">

<property name="Android" columnNo="2"/>
<property name="Bot" columnNo="3"/>
<property name="IOS" columnNo="4"/>
<property name="Other" columnNo="5"/>
<property name="Windows" columnNo="6"/>

</kpi>
}

}
