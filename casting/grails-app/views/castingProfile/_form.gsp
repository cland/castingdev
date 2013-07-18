<%@ page import="com.cland.casting.CastingProfile" %>



<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'averating', 'error')} required">
	<label for="averating">
		<g:message code="castingProfile.averating.label" default="Averating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="averating" value="${fieldValue(bean: castingProfileInstance, field: 'averating')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'canditate', 'error')} required">
	<label for="canditate">
		<g:message code="castingProfile.canditate.label" default="Canditate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="canditate" name="canditate.id" from="${com.cland.casting.Candidate.list()}" optionKey="id" required="" value="${castingProfileInstance?.canditate?.id}" class="many-to-one"/>
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

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'portfolio', 'error')} required">
	<label for="portfolio">
		<g:message code="castingProfile.portfolio.label" default="Portfolio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="portfolio" name="portfolio.id" from="${com.cland.casting.Portfolio.list()}" optionKey="id" required="" value="${castingProfileInstance?.portfolio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'ratings', 'error')} ">
	<label for="ratings">
		<g:message code="castingProfile.ratings.label" default="Ratings" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${castingProfileInstance?.ratings?}" var="r">
    <li><g:link controller="rating" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="rating" action="create" params="['castingProfile.id': castingProfileInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'rating.label', default: 'Rating')])}</g:link>
</li>
</ul>

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

