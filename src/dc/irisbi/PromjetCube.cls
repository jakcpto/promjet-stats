/// 
Class dc.irisbi.PromjetCube Extends %DeepSee.CubeDefinition [ DependsOn = dc.irisbi.Promjet, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="PromjetCube" displayName="PromjetCube" disabled="false" abstract="false" sourceClass="dc.irisbi.Promjet" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="TS" disabled="false" hasAll="false" allCaption="All TS" allDisplayName="TS" sourceProperty="TS" type="time" calendar="gregorian" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Year" displayName="Year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
      <level name="Month" displayName="Month" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
      <level name="Day" displayName="Day" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="agent" disabled="false" hasAll="false" allCaption="All agent" allDisplayName="agent" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="agent" disabled="false" sourceProperty="agent" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="core" disabled="false" hasAll="false" allCaption="All core" allDisplayName="core" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="core" disabled="false" sourceProperty="core" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="8">
      </level>
      <level name="device" disabled="false" sourceProperty="device" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="9">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="device" disabled="false" hasAll="false" allCaption="All device" allDisplayName="device" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="device" disabled="false" sourceProperty="device" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="9">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="fullurl" disabled="false" hasAll="false" allCaption="All fullurl" allDisplayName="fullurl" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="fullurl" disabled="false" sourceProperty="fullurl" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="10">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="method" disabled="false" hasAll="false" allCaption="All method" allDisplayName="method" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="method" disabled="false" sourceProperty="method" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="12">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="statuscode" disabled="false" hasAll="false" allCaption="All statuscode" allDisplayName="statuscode" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="statuscode" disabled="false" sourceProperty="statuscode" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="13">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="url" disabled="false" hasAll="false" allCaption="All url" allDisplayName="url" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="url" disabled="false" sourceProperty="url" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="14">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="ip" disabled="false" hasAll="false" allCaption="All ip" allDisplayName="ip" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ip" disabled="false" sourceProperty="ip" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="11">
      </level>
    </hierarchy>
  </dimension>
</cube>
}

Parameter DOMAIN;

}

