
<%@ page import="com.cland.casting.CastingRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingRole.label', default: 'CastingRole')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-castingRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-castingRole" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list castingRole">
			
				<g:if test="${castingRoleInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="castingRole.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${castingRoleInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingRoleInstance?.production}">
				<li class="fieldcontain">
					<span id="production-label" class="property-label"><g:message code="castingRole.production.label" default="Production" /></span>
					
						<span class="property-value" aria-labelledby="production-label"><g:link controller="production" action="show" id="${castingRoleInstance?.production?.id}">${castingRoleInstance?.production?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${castingRoleInstance?.id}" />
					<g:link class="edit" action="edit" id="${castingRoleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
