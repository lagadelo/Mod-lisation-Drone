"
Le memento stocke un état sans connaitre sa signification
Il est créé par le component à la demande du caretaker.
Le component a la responsabilité:
	- de choisir ses variables significatives
	- de créer le memento
	- de se restaurer à partir d'un memento
	
Le careTaker a la responsabilité:
	- de choisir quand sauvegarder sa target (le component)
	- de choisir quand restaurer sa target.
	
"
Class {
	#name : 'Memento',
	#superclass : 'Object',
	#instVars : [
		'state'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'accessing - structure variables' }
Memento class >> state: aCollectionOfValues [

self new setState: aCollectionOfValues 
]

{ #category : 'accessing' }
Memento >> getState [
^state
]

{ #category : 'accessing' }
Memento >> setState: anObject [
state := anObject
]
