	<g:javascript library="jqpagination"/>
	<div id="accordion" style="font-size: 14px;">
			<h3>Manage Agents</h3>
			<div>
				<ul>
					<li><g:link class="create" controller="agency" action="create">
							<g:message code="default.new.label" args="['Agency']" /></g:link></li>
					<li><g:link class="list" controller="agency" action="list">
							<g:message code="default.list.label" args="['Agency']" /></g:link></li>
					<li>Delete agent</li>
				</ul>
			</div>
			<h3>Manage Productions</h3>
			<div>
				<ul>
					<li>Create/Update</li>
					<li><g:link class="list" controller="production" action="list">
							<g:message code="default.list.label" args="['Agency']" />
						</g:link></li>
					<li>Delete user</li>
				</ul>
			</div>
			<h3>Manage Clients</h3>
			<div>
				<ul>
					<li>Create/Update</li>
					<li>List Clients</li>
					<li>Delete client</li>
				</ul>
			</div>
			<h3>Adhoc Admin</h3>
			<div>
				<p>Regions</p>
				<ul>
					<li>Create/update</li>
					<li>List Regions</li>
					<li>Delete Regions</li>
				</ul>
			</div>
			<h3>Manage Users</h3>
			<div>
				<ul>
					<li><g:link class="create" controller="user" action="create">
							<g:message code="default.new.label" args="['User']" /></g:link></li>
					<li><g:link class="list" controller="user" action="list">
							<g:message code="default.list.label" args="['User']" />
						</g:link></li>
					<li>Delete user</li>
				</ul>
			</div>
		</div>