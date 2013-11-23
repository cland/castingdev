
<%@ page import="com.cland.casting.Agency" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agency.label', default: 'Agency')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

<g:javascript library="jquerymin" />
<g:javascript library="jqueryuilatest" />


	</head>
	<body>
	<div id="status1" class="leftbar" role="complementary">
		<!--h1>Application Status</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Groovy version: ${GroovySystem.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>
		</div-->
		<div id="accordion" style="font-size: 14px;">
			<h3>Manage Agents</h3>
			<div>
				<ul>
					<li><g:link class="create" controller="agency" action="create">
							<g:message code="default.new.label" args="['Agency']" /></g:link></li>
					<li><g:link class="list" controller="agency" action="list">
							<g:message code="default.list.label" args="['Agency']" /></g:link></li>
					<li>Delete agent</li>
				</ul>
			</div>
			<h3>Manage Productions</h3>
			<div>
				<ul>
					<li>Create/Update</li>
					<li><g:link class="list" controller="production" action="list">
							<g:message code="default.list.label" args="['Agency']" />
						</g:link></li>
					<li>Delete user</li>
				</ul>
			</div>
			<h3>Manage Clients</h3>
			<div>
				<ul>
					<li>Create/Update</li>
					<li>List Clients</li>
					<li>Delete client</li>
				</ul>
			</div>
			<h3>Adhoc Admin</h3>
			<div>
				<p>Regions</p>
				<ul>
					<li>Create/update</li>
					<li>List Regions</li>
					<li>Delete Regions</li>
				</ul>
			</div>
			<h3>Manage Users</h3>
			<div>
				<ul>
					<li><g:link class="create" controller="user" action="create">
							<g:message code="default.new.label" args="['User']" /></g:link></li>
					<li><g:link class="list" controller="user" action="list">
							<g:message code="default.list.label" args="['User']" />
						</g:link></li>
					<li>Delete user</li>
				</ul>
			</div>
		</div>
	</div>
		<a href="#list-agency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<!-- div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div-->
		<div class="nav" role="navigation" style="background-color:lightgray; width: 73.5%; align: right; float: left">
			<p style="font-weight: bold;">Filter</p>
			<ul>
				<li>View By:<select name="viewFilter">
				<option>Country</option>
				<option>Region</option>
				<option>City</option>
				</select></li>
				<li>Sort By:<select name="sortFilter">
				<option>Name</option>
				<option>Company</option>
				</select></li>
			
			<li>Search: <g:textField name="searchString" />
			</ul>
		</div>
		<div id="list-agency" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="agency.company.label" default="Company" /></th>
						<th>Contact Person</th>
					     <th>Phone No.</th>
					     <th>Action</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${agencyInstanceList}" status="i" var="agencyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${agencyInstance.id}">${fieldValue(bean: agencyInstance, field: "company")}</g:link></td>
					<td>${agencyInstance.company?.contactPerson }</td>
					<td>${agencyInstance.company?.phoneNo }</td>
					<td>Sample</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${agencyInstanceTotal}" />
				<a href="#" class="first" data-action="first">&laquo;</a>
			    <a href="#" class="previous" data-action="previous">&lsaquo;</a>               
			    <input type="text" readonly="readonly" />
			    <a href="#" class="next" data-action="next">&rsaquo;</a>
			    <a href="#" class="last" data-action="last">&raquo;</a>
			</div>
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow

$(document).ready(function() {		
	 $(function() {
		    $("#accordion" ).accordion();
		  });		                
});  //end method ready(...)

</script>		
	</body>
</html>
