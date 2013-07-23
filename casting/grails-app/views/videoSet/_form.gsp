<%@ page import="com.cland.casting.VideoSet" %>



<div class="fieldcontain ${hasErrors(bean: videoSetInstance, field: 'candidate', 'error')} required">
	<label for="candidate">
		<g:message code="videoSet.candidate.label" default="Candidate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="candidate" name="candidate.id" from="${com.cland.casting.Candidate.list()}" optionKey="id" required="" value="${videoSetInstance?.candidate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: videoSetInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="videoSet.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${videoSetInstance?.name}"/>
</div>
<div class="fieldcontain">

<h3>Videos</h3>
<input type="file" name="movies"/>
<input type="file" name="movies"/>

</div>
