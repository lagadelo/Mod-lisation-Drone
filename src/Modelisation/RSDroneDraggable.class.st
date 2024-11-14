Class {
	#name : 'RSDroneDraggable',
	#superclass : 'RSDraggable',
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'events' }
RSDroneDraggable >> onShape: aShape [
	super onShape: aShape. aShape inspect. 
	aShape when: RSMouseDragEnd send: #updateModel: to: self
 
]

{ #category : 'events' }
RSDroneDraggable >> updateModel: evt [
	| d |

	evt inspect. 
	 
	evt shape model position x: evt position x.
		 
	evt shape model position y: evt position y. 
	evt shape model inspect 
 
]
