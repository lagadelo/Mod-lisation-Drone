Class {
	#name : 'DroneLeaderState',
	#superclass : 'DroneState',
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'testing' }
DroneLeaderState >> isLeader [ 

	^true
]

{ #category : 'moving' }
DroneLeaderState >> moveBy: aPoint [

	"Je me considère comme un noeud ordinaire"
	self target changeState: DroneStandartState.
	
	"Tous les noeuds de mon container doivent subir moveBy"
	"Mais on illustre une politique différente à: "
	"self target container elements do:[:a| a moveBy: aPoint]."
	
	1 to: aPoint z do:[:aZ|
	self target container moveBy: (G3DCoordinates x:1 y:0 z:0)].

	[1 to: aPoint y do:[:aY|
	self target container moveBy: (G3DCoordinates x:0 y:1 z:0)].
	Processor yield.
	1 to: aPoint x do:[:aX|
	self target container  moveBy: (G3DCoordinates x:0 y:0 z:1)]]fork.


	
	"Je restaure mon état"
	self target changeState: self class .
 
]
