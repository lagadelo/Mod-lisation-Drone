Class {
	#name : 'FleetState',
	#superclass : 'Object',
	#instVars : [
		'idMax'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'instance creation' }
FleetState class >> idMax: aNumber [

^self new initialize idMax: aNumber
]

{ #category : 'accessing' }
FleetState >> changeFor: aClass [
aClass == self class ifTrue:[^self "on ne change rien"] ifFalse:[^aClass id: idMax "idMax est une variable privée"]
]

{ #category : 'accessing' }
FleetState >> idMax: anObject [

	idMax := anObject
]

{ #category : 'initializing' }
FleetState >> initialize [ 
idMax := 0
]
