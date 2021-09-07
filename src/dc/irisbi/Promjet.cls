Class dc.irisbi.Promjet Extends %Library.Persistent [ Not Abstract, DdlAllowed, Not LegacyInstanceContext, ProcedureBlock ]
{

Property ip As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 2 ];

Property TS As %Library.Date [ SqlColumnNumber = 3 ];

Property method As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 4 ];

Property url As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 5 ];

Property statuscode As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 6, SqlFieldName = status_code ];

Property fullurl As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 7, SqlFieldName = full_url ];

Property core As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 8 ];

Property device As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 9 ];

Property agent As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 10 ];

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
					set tMe.ip = tImporter.%GetData(1)
					set tMe.TS = tImporter.%GetData(2)
					set tMe.method = tImporter.%GetData(3)
					set tMe.url = tImporter.%GetData(4)
					set tMe.statuscode = tImporter.%GetData(5)
					set tMe.fullurl = tImporter.%GetData(6)
					set tMe.core = tImporter.%GetData(7)
					set tMe.device = tImporter.%GetData(8)
					set tMe.agent = tImporter.%GetData(9)
				}
				elseif pSelectMode = 1 {
					set tMe.ip = $s('$system.CLS.IsMthd("ipOdbcToLogical"):tImporter.%GetData(1),1:tMe.ipOdbcToLogical(tImporter.%GetData(1)))
					set tMe.TS = $s('$system.CLS.IsMthd("TSOdbcToLogical"):tImporter.%GetData(2),1:tMe.TSOdbcToLogical(tImporter.%GetData(2)))
					set tMe.method = $s('$system.CLS.IsMthd("methodOdbcToLogical"):tImporter.%GetData(3),1:tMe.methodOdbcToLogical(tImporter.%GetData(3)))
					set tMe.url = $s('$system.CLS.IsMthd("urlOdbcToLogical"):tImporter.%GetData(4),1:tMe.urlOdbcToLogical(tImporter.%GetData(4)))
					set tMe.statuscode = $s('$system.CLS.IsMthd("statuscodeOdbcToLogical"):tImporter.%GetData(5),1:tMe.statuscodeOdbcToLogical(tImporter.%GetData(5)))
					set tMe.fullurl = $s('$system.CLS.IsMthd("fullurlOdbcToLogical"):tImporter.%GetData(6),1:tMe.fullurlOdbcToLogical(tImporter.%GetData(6)))
					set tMe.core = $s('$system.CLS.IsMthd("coreOdbcToLogical"):tImporter.%GetData(7),1:tMe.coreOdbcToLogical(tImporter.%GetData(7)))
					set tMe.device = $s('$system.CLS.IsMthd("deviceOdbcToLogical"):tImporter.%GetData(8),1:tMe.deviceOdbcToLogical(tImporter.%GetData(8)))
					set tMe.agent = $s('$system.CLS.IsMthd("agentOdbcToLogical"):tImporter.%GetData(9),1:tMe.agentOdbcToLogical(tImporter.%GetData(9)))
				}
				elseif pSelectMode = 2 {
					set tMe.ip = $s('$system.CLS.IsMthd("ipDisplayToLogical"):tImporter.%GetData(1),1:tMe.ipDisplayToLogical(tImporter.%GetData(1)))
					set tMe.TS = $s('$system.CLS.IsMthd("TSDisplayToLogical"):tImporter.%GetData(2),1:tMe.TSDisplayToLogical(tImporter.%GetData(2)))
					set tMe.method = $s('$system.CLS.IsMthd("methodDisplayToLogical"):tImporter.%GetData(3),1:tMe.methodDisplayToLogical(tImporter.%GetData(3)))
					set tMe.url = $s('$system.CLS.IsMthd("urlDisplayToLogical"):tImporter.%GetData(4),1:tMe.urlDisplayToLogical(tImporter.%GetData(4)))
					set tMe.statuscode = $s('$system.CLS.IsMthd("statuscodeDisplayToLogical"):tImporter.%GetData(5),1:tMe.statuscodeDisplayToLogical(tImporter.%GetData(5)))
					set tMe.fullurl = $s('$system.CLS.IsMthd("fullurlDisplayToLogical"):tImporter.%GetData(6),1:tMe.fullurlDisplayToLogical(tImporter.%GetData(6)))
					set tMe.core = $s('$system.CLS.IsMthd("coreDisplayToLogical"):tImporter.%GetData(7),1:tMe.coreDisplayToLogical(tImporter.%GetData(7)))
					set tMe.device = $s('$system.CLS.IsMthd("deviceDisplayToLogical"):tImporter.%GetData(8),1:tMe.deviceDisplayToLogical(tImporter.%GetData(8)))
					set tMe.agent = $s('$system.CLS.IsMthd("agentDisplayToLogical"):tImporter.%GetData(9),1:tMe.agentDisplayToLogical(tImporter.%GetData(9)))
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

Parameter ROWTYPE = "ip VARCHAR(250),TS DATE,method VARCHAR(250),url VARCHAR(250),status_code INTEGER,full_url VARCHAR(250),core VARCHAR(250),device VARCHAR(250),agent VARCHAR(250)";

Storage Default
{
<Data name="PromjetDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ip</Value>
</Value>
<Value name="3">
<Value>TS</Value>
</Value>
<Value name="4">
<Value>method</Value>
</Value>
<Value name="5">
<Value>url</Value>
</Value>
<Value name="6">
<Value>statuscode</Value>
</Value>
<Value name="7">
<Value>fullurl</Value>
</Value>
<Value name="8">
<Value>core</Value>
</Value>
<Value name="9">
<Value>device</Value>
</Value>
<Value name="10">
<Value>agent</Value>
</Value>
</Data>
<DataLocation>^dc.irisbi.PromjetD</DataLocation>
<DefaultData>PromjetDefaultData</DefaultData>
<IdLocation>^dc.irisbi.PromjetD</IdLocation>
<IndexLocation>^dc.irisbi.PromjetI</IndexLocation>
<StreamLocation>^dc.irisbi.PromjetS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
