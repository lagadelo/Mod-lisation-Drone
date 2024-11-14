Class {
	#name : 'TextualObserver',
	#superclass : 'Observer',
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'updating' }
TextualObserver >> updateModel [ 
"Transcript clear."
self subject elements  do:[:a| 
	Transcript show: a position printString;cr]
]
