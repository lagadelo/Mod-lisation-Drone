Class {
	#name : 'DroneVisualizer',
	#superclass : 'Object',
	#instVars : [
		'elements',
		'model',
		'canvas'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'instance creation' }
DroneVisualizer class >> model: aModel [
^self new model: aModel
]

{ #category : 'display' }
DroneVisualizer >> displayCanvas [

	 

	 canvas ifNil:[canvas := RSCanvas new.].
	^self displayCanvas: canvas. 
 
]

{ #category : 'display' }
DroneVisualizer >> displayCanvas: aCanvas [

	 
canvas := aCanvas. 
 
	
	elements := self model elements
		            collect: [ :m |
			            RSCircle new
				            size: m weight; 
				            model: m;
				            position: m position x @ m position y "attention aux coordonnees 3D"]
		            as: RSGroup.

 

	elements do: [ :each |
		each @ (RSPopup text: each model id printString).
		each @ (RSDraggable model:each).
		each @ (RSMenuActivable new menuDo: [ :aMenuMorph :anRSBox |
			 aMenuMorph
				 add: 'Inspect'
				 target: each model
				 selector: #inspect
				 argument: #(  ) ]) ].
 



	canvas addAll: elements.


	canvas @ RSCanvasController.

	^ canvas
]

{ #category : 'accessing' }
DroneVisualizer >> model [

^model 
]

{ #category : 'accessing' }
DroneVisualizer >> model:a [

model := a
]

{ #category : 'display' }
DroneVisualizer >> update [
canvas invalidate.
self displayCanvas: canvas.
self signalUpdate 
]
