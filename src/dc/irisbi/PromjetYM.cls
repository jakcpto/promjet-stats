Class dc.irisbi.PromjetYM Extends %Library.Persistent [ Not Abstract, DdlAllowed, Not LegacyInstanceContext, ProcedureBlock ]
{

Property DateVisit As %Library.Date [ SqlColumnNumber = 2 ];

Property OS As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 3 ];

Property OSRoot As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 4 ];

Property Browser As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 5 ];

Property DeviceType As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 6 ];

Property AdBlock As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 7 ];

Property TrafficSource As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 8 ];

Property Sessions As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 9 ];

Property Users As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 10 ];

ClassMethod Import(pSelectMode As %Library.Integer = {$zu(115,5)}, pFileName As %Library.String(MAXLEN=""), pDelimiter As %String = ",", pQuote As %String = """", pHeaders As %Integer = 0, ByRef pRecordCount As %Integer) As %Library.Integer [ SqlProc ]
{
	set tStatementId = $SYSTEM.Util.CreateGUID(), tCounter = 0, pRecordCount = 0
	set tPreparedStatement = ##class(%SQL.DynamicStatement).Prepare(tStatementId,..#ROWTYPE,pDelimiter,pQuote,,,0,"CSV")
	if $Isobject(tPreparedStatement) {
		set tImporter = tPreparedStatement.%New(tPreparedStatement,,pFileName,pDelimiter,pQuote)
		if $Isobject(tImporter) {
			do ..%DeleteExtent(,.tDeleted,.tInstances,1)
				// burn the column headers
			for tPtr = 1:1:pHeaders { do tImporter.%Next() }
			while tImporter.%Next() {
				set tMe = ..%New()
				if 'pSelectMode {
					set tMe.DateVisit = tImporter.%GetData(1)
					set tMe.OS = tImporter.%GetData(2)
					set tMe.OSRoot = tImporter.%GetData(3)
					set tMe.Browser = tImporter.%GetData(4)
					set tMe.DeviceType = tImporter.%GetData(5)
					set tMe.AdBlock = tImporter.%GetData(6)
					set tMe.TrafficSource = tImporter.%GetData(7)
					set tMe.Sessions = tImporter.%GetData(8)
					set tMe.Users = tImporter.%GetData(9)
				}
				elseif pSelectMode = 1 {
					set tMe.DateVisit = $s('$system.CLS.IsMthd("DateVisitOdbcToLogical"):tImporter.%GetData(1),1:tMe.DateVisitOdbcToLogical(tImporter.%GetData(1)))
					set tMe.OS = $s('$system.CLS.IsMthd("OSOdbcToLogical"):tImporter.%GetData(2),1:tMe.OSOdbcToLogical(tImporter.%GetData(2)))
					set tMe.OSRoot = $s('$system.CLS.IsMthd("OSRootOdbcToLogical"):tImporter.%GetData(3),1:tMe.OSRootOdbcToLogical(tImporter.%GetData(3)))
					set tMe.Browser = $s('$system.CLS.IsMthd("BrowserOdbcToLogical"):tImporter.%GetData(4),1:tMe.BrowserOdbcToLogical(tImporter.%GetData(4)))
					set tMe.DeviceType = $s('$system.CLS.IsMthd("DeviceTypeOdbcToLogical"):tImporter.%GetData(5),1:tMe.DeviceTypeOdbcToLogical(tImporter.%GetData(5)))
					set tMe.AdBlock = $s('$system.CLS.IsMthd("AdBlockOdbcToLogical"):tImporter.%GetData(6),1:tMe.AdBlockOdbcToLogical(tImporter.%GetData(6)))
					set tMe.TrafficSource = $s('$system.CLS.IsMthd("TrafficSourceOdbcToLogical"):tImporter.%GetData(7),1:tMe.TrafficSourceOdbcToLogical(tImporter.%GetData(7)))
					set tMe.Sessions = $s('$system.CLS.IsMthd("SessionsOdbcToLogical"):tImporter.%GetData(8),1:tMe.SessionsOdbcToLogical(tImporter.%GetData(8)))
					set tMe.Users = $s('$system.CLS.IsMthd("UsersOdbcToLogical"):tImporter.%GetData(9),1:tMe.UsersOdbcToLogical(tImporter.%GetData(9)))
				}
				elseif pSelectMode = 2 {
					set tMe.DateVisit = $s('$system.CLS.IsMthd("DateVisitDisplayToLogical"):tImporter.%GetData(1),1:tMe.DateVisitDisplayToLogical(tImporter.%GetData(1)))
					set tMe.OS = $s('$system.CLS.IsMthd("OSDisplayToLogical"):tImporter.%GetData(2),1:tMe.OSDisplayToLogical(tImporter.%GetData(2)))
					set tMe.OSRoot = $s('$system.CLS.IsMthd("OSRootDisplayToLogical"):tImporter.%GetData(3),1:tMe.OSRootDisplayToLogical(tImporter.%GetData(3)))
					set tMe.Browser = $s('$system.CLS.IsMthd("BrowserDisplayToLogical"):tImporter.%GetData(4),1:tMe.BrowserDisplayToLogical(tImporter.%GetData(4)))
					set tMe.DeviceType = $s('$system.CLS.IsMthd("DeviceTypeDisplayToLogical"):tImporter.%GetData(5),1:tMe.DeviceTypeDisplayToLogical(tImporter.%GetData(5)))
					set tMe.AdBlock = $s('$system.CLS.IsMthd("AdBlockDisplayToLogical"):tImporter.%GetData(6),1:tMe.AdBlockDisplayToLogical(tImporter.%GetData(6)))
					set tMe.TrafficSource = $s('$system.CLS.IsMthd("TrafficSourceDisplayToLogical"):tImporter.%GetData(7),1:tMe.TrafficSourceDisplayToLogical(tImporter.%GetData(7)))
					set tMe.Sessions = $s('$system.CLS.IsMthd("SessionsDisplayToLogical"):tImporter.%GetData(8),1:tMe.SessionsDisplayToLogical(tImporter.%GetData(8)))
					set tMe.Users = $s('$system.CLS.IsMthd("UsersDisplayToLogical"):tImporter.%GetData(9),1:tMe.UsersDisplayToLogical(tImporter.%GetData(9)))
				}
				set tStatus = tMe.%Save()
				if $$$ISOK(tStatus) { set tCounter = tCounter + 1 }
			}
		}
	}
	set %sqlcontext.%SQLCODE = 0
	set %sqlcontext.%ROWCOUNT = tCounter
	set pRecordCount = tCounter
	quit tCounter
}

Parameter ROWTYPE = "DateVisit DATE,OS VARCHAR(250),OSRoot VARCHAR(250),Browser VARCHAR(250),DeviceType VARCHAR(250),AdBlock VARCHAR(250),TrafficSource VARCHAR(250),Sessions INTEGER,Users INTEGER";

Storage Default
{
<Data name="PromjetYMDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DateVisit</Value>
</Value>
<Value name="3">
<Value>OS</Value>
</Value>
<Value name="4">
<Value>OSRoot</Value>
</Value>
<Value name="5">
<Value>Browser</Value>
</Value>
<Value name="6">
<Value>DeviceType</Value>
</Value>
<Value name="7">
<Value>AdBlock</Value>
</Value>
<Value name="8">
<Value>TrafficSource</Value>
</Value>
<Value name="9">
<Value>Sessions</Value>
</Value>
<Value name="10">
<Value>Users</Value>
</Value>
</Data>
<DataLocation>^dc.irisbi.PromjetYMD</DataLocation>
<DefaultData>PromjetYMDefaultData</DefaultData>
<IdLocation>^dc.irisbi.PromjetYMD</IdLocation>
<IndexLocation>^dc.irisbi.PromjetYMI</IndexLocation>
<StreamLocation>^dc.irisbi.PromjetYMS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
