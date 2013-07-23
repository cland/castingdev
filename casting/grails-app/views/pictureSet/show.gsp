
<%@ page import="com.cland.casting.PictureSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pictureSet.label', default: 'PictureSet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pictureSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pictureSet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pictureSet">
			
				<g:if test="${pictureSetInstance?.candidate}">
				<li class="fieldcontain">
					<span id="candidate-label" class="property-label"><g:message code="pictureSet.candidate.label" default="Candidate" /></span>
					
						<span class="property-value" aria-labelledby="candidate-label"><g:link controller="candidate" action="show" id="${pictureSetInstance?.candidate?.id}">${pictureSetInstance?.candidate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictureSetInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="pictureSet.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${pictureSetInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictureSetInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="pictureSet.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${pictureSetInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<div id="attachments" class="attachments">
			<attachments:each bean="${pictureSetInstance}">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<attachments:icon attachment="${attachment}" />
				<attachments:deleteLink attachment="${attachment}" label="${'[ X ]'}"
					returnPageURI="${createLink(action:'show', id:pictureSetInstance.id,absolute:true)}" />
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<br/>
			</attachments:each>
		</div>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pictureSetInstance?.id}" />
					<g:link class="edit" action="edit" id="${pictureSetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
