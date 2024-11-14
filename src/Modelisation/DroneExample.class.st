Class {
	#name : 'DroneExample',
	#superclass : 'Object',
	#category : 'Modelisation-Example',
	#package : 'Modelisation',
	#tag : 'Example'
}

{ #category : 'examples' }
DroneExample class >> example [

 
|r aDrone|
r := Random new.

aDrone := Drone position: (G3DCoordinates x:(r nextBetween: -30 and: 30) rounded  y:(r nextBetween: -30 and: 30) z:(r nextBetween: -30 and: 30)).
aDrone behavior:[:element| Transcript show: element position].
^aDrone

]

{ #category : 'examples' }
DroneExample class >> example1 [

 
|aDrone|
aDrone := Drone position: (G3DCoordinates x:1 y:1 z:1).
aDrone behavior:[:element| Transcript show: element position].
^aDrone

]

{ #category : 'examples' }
DroneExample class >> example2 [

 
|aDrone|
aDrone := Drone position: (G3DCoordinates x:10 y:1 z:0).
aDrone behavior:[:element| Transcript show: element name].
^aDrone

]

{ #category : 'examples' }
DroneExample class >> example3 [

 
|aDrone|
aDrone := Drone newAndRegister.
aDrone  position: (G3DCoordinates x:10 y:10 z:40).
aDrone behavior:[:element| element inspect].
^aDrone

]

{ #category : 'examples' }
DroneExample class >> example4 [

 "self example4"
|aDrone|
aDrone :=self example1. 
aDrone moveBy:(G3DCoordinates x:10 y:10 z:10).
^aDrone

]
