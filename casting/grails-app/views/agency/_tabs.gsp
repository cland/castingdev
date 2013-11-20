<!-- The tabs -->
<div id="tabs" style="display: none;">
	<ul>
		<li><a href="#tab-List">Agency List</a></li>
		<li><a href="#tab-agency">Details</a></li>
	</ul>
	<div id="tab-List">
			<ol class="property-list agency">			
				<g:if test="${agencyInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="agency.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:link controller="organisation" action="show" id="${agencyInstance?.company?.id}">${agencyInstance?.company?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${agencyInstance?.contacts}">
				<li class="fieldcontain">
					<span id="contacts-label" class="property-label"><g:message code="agency.contacts.label" default="Contacts" /></span>
					
						<g:each in="${agencyInstance.contacts}" var="c">
						<span class="property-value" aria-labelledby="contacts-label"><g:link controller="user" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>					
				</li>
				</g:if>
			
			</ol>
	</div>
	<div id="tab-agency">
					tab2
	</div>
</div>

<!--  End tabs -->