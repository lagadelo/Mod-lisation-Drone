"
Fleet implements a Singleton.
This ensures only one Fleet exists.
"
Class {
	#name : 'Fleet',
	#superclass : 'Composite',
	#instVars : [
		'idMax',
		'assignments',
		'state'
	],
	#classInstVars : [
		'singleton'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'new' }
Fleet class >> buildSingleton [
singleton := self basicNew initialize
]

{ #category : 'new' }
Fleet class >> new [

singleton isNil ifTrue:[self buildSingleton].
^singleton
]

{ #category : 'accessing' }
Fleet class >> newAndRegister [
"prevents self registering"
^self shouldNotImplement 
]

{ #category : 'new' }
Fleet class >> reset [
singleton := nil
]

{ #category : 'state' }
Fleet >> changeState: aClass [

"aClass est StateWithNoTrust ou StateWithTrust
On conserve l'idMax quand on change d'état"
state := state changeFor: aClass  
]

{ #category : 'id assignment' }
Fleet >> getIDFor: aComponent [


"On remplace l'ancien code
^assignments at:aComponent ifAbsent:[
	assignments add: aComponent -> idMax.
	idMax := idMax +1. ^idMax -1]

par une délagation à notre état"
^state getIDFor: aComponent


]

{ #category : 'initialize' }
Fleet >> initialize [
	"On assure l'unicité des IDs"


	
	super initialize.
	" assignments := Dictionary new.  
	  idMax := 0.
	Ici ce n'est plus utile; on déléguera à notre état"
	
	state:= (StateWithTrust idMax:0).

]

{ #category : 'id assignment' }
Fleet >> knows: aComponent [ 

"On remplace l'ancien code
^aComponent id = (assignments at: aComponent)  

par une délagation à notre état"
^state knows: aComponent

]
