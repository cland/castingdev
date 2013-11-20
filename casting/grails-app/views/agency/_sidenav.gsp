<div id="status" class="leftbar" role="complementary">
	<h1>Actions</h1>
	<ul>		
		<li><g:link class="create" controller="agency" action="create"><g:message code="default.new.label" args="['Agency']" /></g:link></li>
		<li><g:link class="list" controller="agency" action="list"><g:message code="default.list.label" args="['Agency']" /></g:link></li>
		<li><g:link class="list" controller="agency" action="show" id="${agencyInstance?.id }"><g:message code="default.show.label" args="['Agency']" /></g:link></li>		
	</ul>
	<g:if test="${agencyInstance?.contacts}">
		<h1>Client Details</h1>
		
		<ul>			
			<li>Name: 
				<span class="property-value" aria-labelledby="client-label">
				<g:link controller="agency"	action="show" id="${agencyInstance?.client?.id}">
						${agencyInstance?.contact?.encodeAsHTML()}
				</g:link>
				</span>
			</li>
			<!-- li>Tel: ${agencyInstance?.client?.company?.phoneNo}</li-->		
		</ul>
	</g:if>
	<br />	
	
</div>