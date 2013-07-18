<%@ page import="com.cland.casting.CastingCategory" %>



<div class="fieldcontain ${hasErrors(bean: castingCategoryInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="castingCategory.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${castingCategoryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingCategoryInstance, field: 'production', 'error')} required">
	<label for="production">
		<g:message code="castingCategory.production.label" default="Production" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="production" name="production.id" from="${com.cland.casting.Production.list()}" optionKey="id" required="" value="${castingCategoryInstance?.production?.id}" class="many-to-one"/>
</div>

