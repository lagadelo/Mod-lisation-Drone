Class {
	#name : 'DroneStandartState',
	#superclass : 'DroneState',
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'testing' }
DroneStandartState >> isLeader [ 

	^false
]

{ #category : 'moving' }
DroneStandartState >> moveBy: aPoint [

self target position: self target position + aPoint 
]
