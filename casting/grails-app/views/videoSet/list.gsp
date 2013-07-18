
<%@ page import="com.cland.casting.VideoSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'videoSet.label', default: 'VideoSet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-videoSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-videoSet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="videoSet.candidate.label" default="Candidate" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'videoSet.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'videoSet.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${videoSetInstanceList}" status="i" var="videoSetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${videoSetInstance.id}">${fieldValue(bean: videoSetInstance, field: "candidate")}</g:link></td>
					
						<td><g:formatDate date="${videoSetInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: videoSetInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${videoSetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
