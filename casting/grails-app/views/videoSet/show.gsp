
<%@ page import="com.cland.casting.VideoSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'videoSet.label', default: 'VideoSet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-videoSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-videoSet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list videoSet">
			
				<g:if test="${videoSetInstance?.candidate}">
				<li class="fieldcontain">
					<span id="candidate-label" class="property-label"><g:message code="videoSet.candidate.label" default="Candidate" /></span>
					
						<span class="property-value" aria-labelledby="candidate-label"><g:link controller="candidate" action="show" id="${videoSetInstance?.candidate?.id}">${videoSetInstance?.candidate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${videoSetInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="videoSet.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${videoSetInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${videoSetInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="videoSet.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${videoSetInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
		<div id="attachments" class="attachments">
			<attachments:each bean="${videoSetInstance}">
				<attachments:icon attachment="${attachment}" />
				<attachments:deleteLink attachment="${attachment}" label="${'[ X ]'}"
					returnPageURI="${createLink(action:'show', id:videoSetInstance.id,absolute:true)}" />
				<attachments:downloadLink attachment="${attachment}" />
				${attachment.niceLength}
			</attachments:each>
		</div>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${videoSetInstance?.id}" />
					<g:link class="edit" action="edit" id="${videoSetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
