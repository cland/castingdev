package com.cland.casting

class Organisation {

	String name
	String phoneNo
	String email
	String phyAddress
	String phyPostCode
	String postalAddress
	String postalPostCode
	String contactPerson
	String type  //Agency,Other
	String city
	Region region
	Country country
	String comments
	//static hasMany = [people:Person]
	
    static constraints = {
		name()
		phoneNo()
		email(email:true)
		phyAddress(blank:true, nullable:true)
		region(nullable:true)
		country(nullable:true)
		type(nullable:true,inList:["Agency","Client","Other"])
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
} //end of class
