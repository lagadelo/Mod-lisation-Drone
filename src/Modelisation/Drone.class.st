"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them.

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	behavior:		<Bloc>
	id:		<Integer>
	position:		<G3DCoordinates>
	weight:		<Integer>


    Implementation Points
"
Class {
	#name : 'Drone',
	#superclass : 'Component',
	#instVars : [
		'position',
		'behavior',
		'weight',
		'state'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'instance creation' }
Drone class >> id: anId position: a3DCordinate [
|aDrone|
aDrone := self id: anId.
aDrone position: a3DCordinate.
^aDrone
]

{ #category : 'instance creation' }
Drone class >> new [ 
"super provides code, but self executes it"
^super new initialize
]

{ #category : 'instance creation' }
Drone class >> position: a3DCordinate [
|aDrone|
aDrone := self new.
aDrone position: a3DCordinate.
^aDrone
]

{ #category : 'accessing' }
Drone >> allElements [ 
^Array with: self
]

{ #category : 'state' }
Drone >> beLeader [

self changeState: DroneLeaderState 
]

{ #category : 'state' }
Drone >> beStandart [

self changeState: DroneStandartState 
]

{ #category : 'accessing' }
Drone >> behavior [

	^ behavior
]

{ #category : 'accessing' }
Drone >> behavior: anObject [

	behavior := anObject
]

{ #category : 'state' }
Drone >> changeState: aClass [

"aClass est DroneLeaderState ou DroneStandartState
Ici, contrairement à la flotte l'état doit pouvoir manipuler le modèle"
state := state changeFor: (aClass target: self)  
]

{ #category : 'accessing' }
Drone >> defaultWeight [

"Use 'find references to' to ensure proper tracing"
^1
]

{ #category : 'activation' }
Drone >> execute [
self behavior isNil ifFalse:[^self behavior value: self]
]

{ #category : 'initialization' }
Drone >> initialize [
super initialize.

"Par défaut le drone n'est pas leader"
state := DroneStandartState target: self 

]

{ #category : 'proxy' }
Drone >> moveAllBy: aPoint [
1 to: aPoint z do:[:aZ|
self container moveBy: (G3DCoordinates x:1 y:0 z:0)].

[1 to: aPoint y do:[:aY|
self container moveBy: (G3DCoordinates x:0 y:1 z:0)].
Processor yield.
1 to: aPoint x do:[:aX|
self container  moveBy: (G3DCoordinates x:0 y:0 z:1)]]fork.
]

{ #category : 'movement' }
Drone >> moveBy: aVector [
"On remanie le code.
self position: (self position + aVector)

devient: self state moveBy: aVector"


]

{ #category : 'accessing' }
Drone >> position [

	^ position
]

{ #category : 'accessing' }
Drone >> position: anObject [

	position := anObject
]

{ #category : 'user-interface' }
Drone >> show [
^self shouldNotImplement
]

{ #category : 'accessing' }
Drone >> weight [

weight ifNil:[self weight: self defaultWeight "prohibit silent behavior such as setting value"].
	^ weight
]

{ #category : 'accessing' }
Drone >> weight: anObject [

	weight := anObject
]

{ #category : 'test oriented' }
Drone >> wrongID [
"Ensure an impossible  value"
id := id * 3 max:1 .

]

{ #category : 'test oriented' }
Drone >> wrongID2 [
"Ensure an existing value"
id := 0  
]
