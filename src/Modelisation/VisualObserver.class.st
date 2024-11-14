Class {
	#name : 'VisualObserver',
	#superclass : 'Observer',
	#instVars : [
		'canvas'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'accessing' }
VisualObserver >> subject: anObject [

	super subject: anObject.
	canvas := RSCanvas new.
	  
	canvas @ RSCanvasController.
	canvas open.
	subject hasChanged 
	
]

{ #category : 'updating' }
VisualObserver >> updateModel [
	| elements |
	canvas shapes do:[:a | canvas removeShape:a]. 
	elements := self subject elements
		            collect: [ :m |
			            RSCircle new
				            size: m weight; 
				            model: m;
				            position: m position x @ m position y "attention aux coordonnees 3D"]
		            as: RSGroup.

 

	elements do: [ :each |
		each @ (RSPopup text: each model id printString).
	"	each @ RSDroneDraggable."
		each @ (RSMenuActivable new menuDo: [ :aMenuMorph :anRSBox |
			 aMenuMorph
				 add: 'Inspect'
				 target: each model
				 selector: #inspect
				 argument: #(  ) ]) ].
 



	canvas addAll: elements.
canvas signalUpdate.


	^ canvas
]
