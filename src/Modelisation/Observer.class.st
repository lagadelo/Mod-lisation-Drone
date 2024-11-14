Class {
	#name : 'Observer',
	#superclass : 'Object',
	#instVars : [
		'subject'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'instance creation' }
Observer class >> observe: aSubject [

| tmp |
tmp := self new.
tmp subject: aSubject.
aSubject registerObserver: tmp.
^tmp 
]

{ #category : 'accessing' }
Observer >> subject [

	^ subject
]

{ #category : 'accessing' }
Observer >> subject: anObject [

	subject := anObject
]

{ #category : 'updating' }
Observer >> updateModel [

^self subclassResponsibility 
]
