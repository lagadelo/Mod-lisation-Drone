Class {
	#name : 'ModelisationExample',
	#superclass : 'Object',
	#instVars : [
		'state'
	],
	#category : 'Modelisation-Example',
	#package : 'Modelisation',
	#tag : 'Example'
}

{ #category : 'examples' }
ModelisationExample class >> example1 [

DroneExample example1 execute
]

{ #category : 'examples' }
ModelisationExample class >> example2 [

"Should generate an error as #name is not implemented"
DroneExample example2 execute
]

{ #category : 'examples' }
ModelisationExample class >> example3 [

"Should generate an error as #name is not implemented"
DroneExample example3 execute
]

{ #category : 'as yet unclassified' }
ModelisationExample >> getState: anObject [
state := anObject
]
