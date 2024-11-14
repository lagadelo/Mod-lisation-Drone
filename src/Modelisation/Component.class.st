Class {
	#name : 'Component',
	#superclass : 'Object',
	#instVars : [
		'id',
		'container',
		'name',
		'observers'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'accessing' }
Component class >> id: anID [
^self shouldNotImplement 
]

{ #category : 'accessing' }
Component class >> newAndRegister [
| tmp|
tmp := self new.
tmp   initialize.
tmp  assignID.
tmp  finalize.
^tmp 
]

{ #category : 'accessing' }
Component >> allElements [ 

^self subclassResponsibility 
]

{ #category : 'accessing' }
Component >> assignID [

id := Fleet new getIDFor:self.


]

{ #category : 'accessing' }
Component >> container [

	^ container
]

{ #category : 'accessing' }
Component >> container: anObject [

	container := anObject
]

{ #category : 'memento  accessing' }
Component >> createMemento [
^Memento state: (self mementoVariables collect:[:aVariableName| (self get: aVariableName) copy])
]

{ #category : 'accessing' }
Component >> finalize [

Fleet new add: self
]

{ #category : 'memento  accessing' }
Component >> get: aField [
"aField can be a ByteString, Symbol, etc."
"e.g self get:'name' "
^self perform: (aField asSymbol )
]

{ #category : 'observing' }
Component >> hasChanged [ 

^self observers do:[:anObserver|
	anObserver updateModel].
]

{ #category : 'accessing' }
Component >> id [

	^ id
]

{ #category : 'accessing' }
Component >> id: anObject [

	" replace id := anObject to ensure privacy"
	^self shouldNotImplement 
]

{ #category : 'memento  accessing' }
Component >> mementoVariables [
"Il s'agit d'une collection des champs à sauvegarder"
^self shouldNotImplement
]

{ #category : 'moving' }
Component >> moveBy: a [

"Explicit mandatory interface for subclasses.
This method cannot invoked except if not re-implemented in one instanciated subclass"
^self subclassResponsibility 
]

{ #category : 'accessing' }
Component >> name [

	^ name
]

{ #category : 'accessing' }
Component >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
Component >> observers [

	^ observers ifNil:[ observers := OrderedCollection new] ifNotNil:[observers]
]

{ #category : 'accessing' }
Component >> position [

^self subclassResponsibility 
]

{ #category : 'accessing' }
Component >> position: aValue [

^self subclassResponsibility 
]

{ #category : 'observing' }
Component >> registerObserver: anObserver [
self observers add: anObserver
]

{ #category : 'memento  accessing' }
Component >> restoreFromMemento: aMemento [

"L'atat du memento contient une copie de nos différentes variables; on les restore"
self mementoVariables with: aMemento getState do:[:aVariableName :aValue| 
self set: aVariableName with: aValue]
]

{ #category : 'memento  accessing' }
Component >> set: aField with: aValue [
"aField can be a ByteString, Symbol, etc."
"e.g self set:'name' with:'moi' "
self perform: (aField,':') asSymbol with: aValue 
]

{ #category : 'accessing' }
Component >> weight [

^self subclassResponsibility 
]

{ #category : 'accessing' }
Component >> weight: aValue [

^self subclassResponsibility 
]
