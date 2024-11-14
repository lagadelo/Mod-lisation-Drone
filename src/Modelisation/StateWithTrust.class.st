Class {
	#name : 'StateWithTrust',
	#superclass : 'FleetState',
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'id assignment' }
StateWithTrust >> getIDFor: aComponent [

"A priori ce n'est pas utile car le noeud demande toujours un id, mais ..."
aComponent id ifNil:[ 
	idMax := idMax +1. ^idMax -1] ifNotNil:[aComponent id] " Nous faisons confiance au composant qui dit avoir un id"
]

{ #category : 'initialize' }
StateWithTrust >> knows: aComponent [ 

"On accepte tous les entrants"
^true
]
