<%@ page import="com.cland.casting.CastingProfile" %>



<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'averating', 'error')} required">
	<label for="averating">
		<g:message code="castingProfile.averating.label" default="Averating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="averating" value="${fieldValue(bean: castingProfileInstance, field: 'averating')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'candidate', 'error')} required">
	<label for="candidate">
		<g:message code="castingProfile.candidate.label" default="Candidate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="candidate" name="candidate.id" from="${com.cland.casting.Candidate.list()}" optionKey="id" required="" value="${castingProfileInstance?.candidate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'castDate', 'error')} required">
	<label for="castDate">
		<g:message code="castingProfile.castDate.label" default="Cast Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="castDate" precision="day"  value="${castingProfileInstance?.castDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'castNo', 'error')} required">
	<label for="castNo">
		<g:message code="castingProfile.castNo.label" default="Cast No" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="castNo" type="number" value="${castingProfileInstance.castNo}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="castingProfile.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${castingProfileInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'isShortlist', 'error')} ">
	<label for="isShortlist">
		<g:message code="castingProfile.isShortlist.label" default="Is Shortlist" />
		
	</label>
	<g:checkBox name="isShortlist" value="${castingProfileInstance?.isShortlist}" />
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'pictures', 'error')} required">
	<label for="pictures">
		<g:message code="castingProfile.pictures.label" default="Pictures" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pictures" name="pictures.id" from="${com.cland.casting.PictureSet.list()}" optionKey="id" required="" value="${castingProfileInstance?.pictures?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'ratings', 'error')} ">
	<label for="ratings">
		<g:message code="castingProfile.ratings.label" default="Ratings" />
		
	</label>
	<g:select name="ratings" from="${com.cland.casting.Rating.list()}" multiple="multiple" optionKey="id" size="5" value="${castingProfileInstance?.ratings*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'round', 'error')} required">
	<label for="round">
		<g:message code="castingProfile.round.label" default="Round" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="round" type="number" value="${castingProfileInstance.round}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'videos', 'error')} required">
	<label for="videos">
		<g:message code="castingProfile.videos.label" default="Videos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="videos" name="videos.id" from="${com.cland.casting.VideoSet.list()}" optionKey="id" required="" value="${castingProfileInstance?.videos?.id}" class="many-to-one"/>
</div>

