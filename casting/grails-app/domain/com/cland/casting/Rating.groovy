package com.cland.casting

class Rating {
	Integer rating
	String comments
	User createdBy
	Date dateCreated
	static belongsTo = [profile:CastingProfile]
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
		"${rating}"
	}
} //end class