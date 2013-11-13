package com.cland.casting


class PageTitleTagLib {
	def appTitle = {attrs, body ->
		out << "eLearning " + attrs.title
		out << " : " + body()
		}
	
}
