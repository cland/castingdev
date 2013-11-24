modules = {
    application {
        resource url:'js/application.js'
    }
	jquerymin{
		resource url: 'js/jquery-1.9.1.js', disposition: 'head'
	}
	jquerygrid{
		resource url: 'js/jquery.jqGrid.min.js', disposition: 'head'
	}
	jquerygridlocale{
		resource url: 'js/i18n/grid.locale-en.js', disposition: 'head'
	}
	
	jqueryuilatest{
		resource url: 'js/jquery-ui-1.10.3.custom.min.js', disposition: 'head'
	}
	
	jqpagination{
		dependsOn: 'jquerymin'
		dependsOn: 'jqueryuilatest'
		
		resource url: 'js/jqPagination-master/css/jqpagination.css'
		resource url: 'js/jqPagination-master/js/jquery.jqpagination.js'
		resource url: 'js/jqPagination-master/js/jquery.jqpagination.min.js'
		//resource url: 'js/jqPagination-master/js/jquery-1.7.2.min.js'
		resource url: 'js/jqPagination-master/js/scripts.js'
	}
}