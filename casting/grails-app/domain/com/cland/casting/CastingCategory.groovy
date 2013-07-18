package com.cland.casting

class CastingCategory {
	String name
	static belongsTo = [production:Production]
	static constraints = {
	}
	def beforeInsert = {
		// your code goes here
	}
	def beforeUpdate = {
		// your code goes here
	}
	def beforeDelete = {
		// your code goes here
	}
	def onLoad = {
		// your code goes here
	}

	String toString(){
		 "${name}"
	}
} //end class