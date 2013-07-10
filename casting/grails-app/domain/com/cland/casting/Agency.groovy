package com.cland.casting

class Agency {
	Organisation company
	static hasMany = [contacts:User]
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
		"${company?.name}"
	}
} //end class