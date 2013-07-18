<%@ page import="com.cland.casting.Rating" %>



<div class="fieldcontain ${hasErrors(bean: ratingInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="rating.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${ratingInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ratingInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="rating.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.cland.casting.User.list()}" optionKey="id" required="" value="${ratingInstance?.createdBy?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ratingInstance, field: 'profile', 'error')} required">
	<label for="profile">
		<g:message code="rating.profile.label" default="Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profile" name="profile.id" from="${com.cland.casting.CastingProfile.list()}" optionKey="id" required="" value="${ratingInstance?.profile?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ratingInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="rating.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rating" type="number" value="${ratingInstance.rating}" required=""/>
</div>

