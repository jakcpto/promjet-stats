/// 
Class dc.irisbi.PromjetYMCube Extends %DeepSee.CubeDefinition [ DependsOn = dc.irisbi.PromjetYM, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="PromjetYMCube" displayName="PromjetYMCube" disabled="false" abstract="false" sourceClass="dc.irisbi.PromjetYM" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="DateVisit" disabled="false" hasAll="false" allCaption="All DateVisit" allDisplayName="DateVisit" sourceProperty="DateVisit" type="time" calendar="gregorian" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Year" displayName="Year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
      <level name="Month" displayName="Month" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
      <level name="Day" displayName="Day" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Browser" disabled="false" hasAll="false" allCaption="All Browser" allDisplayName="Browser" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Browser" disabled="false" sourceProperty="Browser" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="DeviceType" disabled="false" hasAll="false" allCaption="All DeviceType" allDisplayName="DeviceType" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="DeviceType" disabled="false" sourceProperty="DeviceType" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
      <level name="OSRoot" disabled="false" sourceProperty="OSRoot" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
      <level name="OS1" disabled="false" sourceProperty="OS" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="8">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="OS" disabled="false" hasAll="false" allCaption="All OS" allDisplayName="OS" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="OS" disabled="false" sourceProperty="OS" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="8">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="OSRoot" disabled="false" hasAll="false" allCaption="All OSRoot" allDisplayName="OSRoot" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="OSRoot" disabled="false" sourceProperty="OSRoot" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="TrafficSource" disabled="false" hasAll="false" allCaption="All TrafficSource" allDisplayName="TrafficSource" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="TrafficSource" disabled="false" sourceProperty="TrafficSource" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="9">
      </level>
    </hierarchy>
  </dimension>
  <measure name="Sessions" disabled="false" sourceProperty="Sessions" aggregate="SUM" type="number" hidden="false" searchable="false" factNumber="1">
  </measure>
  <measure name="Users" disabled="false" sourceProperty="Users" aggregate="SUM" type="number" hidden="false" searchable="false" factNumber="2">
  </measure>
</cube>
}

Parameter DOMAIN;

}

