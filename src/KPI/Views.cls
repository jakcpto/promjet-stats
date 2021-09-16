Class KPI.Views Extends %DeepSee.KPI
{

XData KPI [ XMLNamespace = "http://www.intersystems.com/deepsee/kpi" ]
{
<kpi
  xmlns="http://www.intersystems.com/deepsee/kpi"
  name="Promjet/Views"
  sourceType="sql"
  sql="SELECT 
    TO_CHAR(TO_TIMESTAMP(CAST(TS AS VARCHAR(20)), 'YYYY-MM-DD'), 'DD-MON-YYYY'),
    Count(distinct(ip)) as CountIP
    FROM dc_irisbi.Promjet
    GROUP BY TS"
  caption="ViewsKPI">

<property name="Count" columnNo="2"/>

</kpi>
}

}
