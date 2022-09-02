<cfcomponent displayname="test">
<cffunction name="init" >
</cffunction>
<cffunction name="saveStudentsData"  returntype='any'>
    <cfargument name='FirstName' required='true'/>
    <cfargument name='LastName' required='true'/>
    <cfargument name='Country' required="true" >
    <cfquery name="saveStudentData" returntype="query" datasource="myTestDSN">
        insert into student (Firstname, Lastname, Country) output inserted.*
        values('#arguments.FirstName#'
        , '#arguments.LastName#' 
        , '#arguments.Country#'
        );
    </cfquery>
    <cfreturn saveStudentData/>
</cffunction>
</cfcomponent>