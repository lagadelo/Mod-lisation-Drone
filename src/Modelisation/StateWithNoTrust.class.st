Class {
	#name : 'StateWithNoTrust',
	#superclass : 'FleetState',
	#instVars : [
		'assignments'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'id assignment' }
StateWithNoTrust >> getIDFor: aComponent [



^assignments at:aComponent ifAbsent:[
	assignments add: aComponent -> idMax.
	idMax := idMax +1. ^idMax -1]
]

{ #category : 'initializing' }
StateWithNoTrust >> initialize [ 
super initialize.
assignments := Dictionary new
]

{ #category : 'initialize' }
StateWithNoTrust >> knows: aComponent [ 

^aComponent id = (assignments at: aComponent)  
]
