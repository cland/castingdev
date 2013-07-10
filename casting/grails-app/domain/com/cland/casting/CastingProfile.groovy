package com.cland.casting

import java.util.Date;

class CastingProfile {
	BigInteger castNo
	Date castDate
	boolean isShortlist
	Integer round
	Double averating
	String comments
	//Production production
	VideoSet videos
	PictureSet pictures
	static hasMany = [ratings:Rating]
	static belongsTo = [candidate:Candidate]
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
		//TODO: "${name}"
	}
} //end class