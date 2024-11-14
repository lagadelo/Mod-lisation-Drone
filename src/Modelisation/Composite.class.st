Class {
	#name : 'Composite',
	#superclass : 'Component',
	#instVars : [
		'elements'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'building' }
Composite >> add: aComponent [

(Fleet new knows: aComponent) ifTrue:[
self elements add: aComponent.
aComponent container: self ]
]

{ #category : 'accessing' }
Composite >> allElements [ 

^self elements inject:OrderedCollection new into:[:anElement :anAccumulate| anAccumulate addAll: anElement allElements. anAccumulate]
]

{ #category : 'accessing' }
Composite >> elements [

	^ elements
]

{ #category : 'accessing' }
Composite >> elements: aCollection [

^ self shouldNotImplement
]

{ #category : 'initialize' }
Composite >> initialize [ 
elements := OrderedCollection new.

]

{ #category : 'proxy' }
Composite >> moveAllBy: aPoint [
^self moveBy:aPoint
]

{ #category : 'moving' }
Composite >> moveBy: aVector [
self elements do:[:anElement "ie drone of subfleet" |  anElement moveBy: aVector. ].self hasChanged.
 
]

{ #category : 'accessing' }
Composite >> position [

"This value is computed based on sub elements weights"

^ (self elements inject:0 into:[:accumulate :anElement| accumulate + (anElement position * anElement weight)]) / self weight
]

{ #category : 'accessing' }
Composite >> position: a3DCoordinate [

"This value is computed; cannot be set"

^ self shouldNotImplement
]

{ #category : 'proxy' }
Composite >> proxy [
^elements first beLeader
]

{ #category : 'building' }
Composite >> remove: aComponent [

self elements remove: aComponent ifAbsent:[^self ].
aComponent container: nil 
]

{ #category : 'user interface' }
Composite >> show [

| canvas  dv |
dv := (DroneVisualizer model: self).
canvas := dv displayCanvas.
canvas open.
^dv
]

{ #category : 'accessing' }
Composite >> weight [

"This value is computed based on sub elements weights"

^ self elements inject:0 into:[:accumulate :anElement| accumulate + anElement]
]

{ #category : 'accessing' }
Composite >> weight: anInteger [

"This value is computed; cannot be set"

^ self shouldNotImplement
]
