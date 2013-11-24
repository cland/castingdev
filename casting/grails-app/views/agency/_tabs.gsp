<!-- The tabs -->
<div id="tabs" style="display: none;">
	<ul>
	    <li><a href="#tab-agency">Details</a></li>
		<li><a href="#tab-List">Candidate List</a></li>
		
	</ul>
	<div id="tab-agency">
			<ol class="property-list agency">			
				<g:if test="${agencyInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="agency.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:link controller="organisation" action="show" id="${agencyInstance?.company?.id}">${agencyInstance?.company?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${agencyInstance?.company}">
				<li class="fieldcontain">
					<span id="contacts-label" class="property-label"><g:message code="agency.contacts.label" default="Number" /></span>
					
						<g:each in="${agencyInstance.company}" var="c">
						<span class="property-value" aria-labelledby="contacts-label"><g:link controller="user" action="show" id="${c.id}">${c?.phoneNo?.encodeAsHTML()}</g:link></span>
						</g:each>					
				</li>
				</g:if>
				<g:if test="${agencyInstance?.company}">
				<li class="fieldcontain">
					<span id="contacts-label" class="property-label"><g:message code="agency.contacts.label" default="Number" /></span>
					
						<g:each in="${agencyInstance.company}" var="c">
						<span class="property-value" aria-labelledby="contacts-label"><g:link controller="user" action="show" id="${c.id}">${c?.contactPerson?.encodeAsHTML()}</g:link></span>
						</g:each>					
				</li>
				</g:if>
			
			</ol>
	</div>
	<div id="tab-List">
					<ol>
					<g:if test="${agencyInstance?.candidates}">
				<li>
						<g:each in="${agencyInstance.candidates}" var="c">
						<span class="property-value" aria-labelledby="candidates-label"><g:link controller="user" action="show" id="${c.id}">${c?.clothing?.encodeAsHTML()}</g:link></span>
						<span class="property-value" aria-labelledby="candidates-label"><g:link controller="user" action="show" id="${c.id}">${c?.eyes?.encodeAsHTML()}</g:link></span>
						<span class="property-value" aria-labelledby="candidates-label"><g:link controller="user" action="show" id="${c.id}">${c?.hair?.encodeAsHTML()}</g:link></span>
						<span class="property-value" aria-labelledby="candidates-label"><g:link controller="user" action="show" id="${c.id}">${c?.height?.encodeAsHTML()}</g:link></span>
						</g:each>					
				</li>
				</g:if>
					</ol>
	</div>
</div>

<!--  End tabs -->