<%@ page import="com.cland.casting.CastingRole" %>



<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="castingRole.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${castingRoleInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'production', 'error')} required">
	<label for="production">
		<g:message code="castingRole.production.label" default="Production" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="production" name="production.id" from="${com.cland.casting.Production.list()}" optionKey="id" required="" value="${castingRoleInstance?.production?.id}" class="many-to-one"/>
</div>

