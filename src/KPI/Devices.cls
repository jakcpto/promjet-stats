Class KPI.Devices Extends %DeepSee.KPI
{

XData KPI [ XMLNamespace = "http://www.intersystems.com/deepsee/kpi" ]
{
<kpi
  xmlns="http://www.intersystems.com/deepsee/kpi"
  name="Promjet/Devices"
  sourceType="sql"
  sql="SELECT *, Count(Device) as Users
    FROM (select case when device IN('WIN64', 'WOW64') or device is null then 'Windows' when device = 'LINUX X86_64' or Instr(Device,'Android',1)>0 then 'Android' when Instr(Device,'Mac',1)>0 then 'IOS' when Instr(Device,'Bot',1)>0 then 'Bot' ELSE 'Other' END AS Device
    FROM dc_irisbi.Promjet GROUP BY ip)
    group by Device"
  caption="DevicesKPI">

<property name="Count" columnNo="2"/>

</kpi>
}

ClassMethod GrantSQLAccess() As %Status
{
  &sql(GRANT SELECT,UPDATE ON dc_irisbi.Promjet TO UnknownUser)
  Quit $$$OK
}

}
