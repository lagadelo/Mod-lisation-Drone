Class {
	#name : 'Caretaker',
	#superclass : 'Object',
	#instVars : [
		'snapshots',
		'target'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'instance creation' }
Caretaker class >> on: aTarget [
^self new target: aTarget 
]

{ #category : 'initialization' }
Caretaker >> initialize [
" La structure peut être plus complexe en fonction des besoins (sauver plusieurs éléments; indexer par date, etc.
Ici on garde tous les attributs privés"



snapshots := OrderedCollection new 
]

{ #category : 'initialization' }
Caretaker >> restore [
target restoreFromMemento: snapshots removeLast 
]

{ #category : 'initialization' }
Caretaker >> snapshot [
snapshots add: self target createMemento 
]

{ #category : 'accessing' }
Caretaker >> target: aTarget [
"De qui je m'occupe?"
target := aTarget 
]
