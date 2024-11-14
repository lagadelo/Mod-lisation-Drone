Class {
	#name : 'DroneState',
	#superclass : 'Object',
	#instVars : [
		'target'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'instance creation' }
DroneState class >> target: aDrone [
^self new target: aDrone
]

{ #category : 'testing' }
DroneState >> isLeader [

	^self subclassResponsibility 
]

{ #category : 'moving' }
DroneState >> moveBy: aPoint [

	^self subclassResponsibility 
]

{ #category : 'moving' }
DroneState >> target [ 

	^target
]

{ #category : 'moving' }
DroneState >> target: aDrone [ 
	
	target := aDrone
]
