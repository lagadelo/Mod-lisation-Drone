Class {
	#name : 'CompositeExample',
	#superclass : 'Object',
	#category : 'Modelisation-Example',
	#package : 'Modelisation',
	#tag : 'Example'
}

{ #category : 'examples' }
CompositeExample class >> add: n to: aComposite [ 
"self add: 100 to: self example2  "
 
n timesRepeat:[
aComposite add: DroneExample example.].

^aComposite 
]

{ #category : 'examples' }
CompositeExample class >> example1 [
"self example1"
 
|aComposite|
aComposite := Composite id:10.
aComposite add: DroneExample example1 .
^aComposite 
]

{ #category : 'examples' }
CompositeExample class >> example2 [
"self example2"
 
|aComposite|
aComposite := Composite new.
aComposite add: DroneExample example1 .
aComposite add: DroneExample example2 .
^aComposite 
]

{ #category : 'examples' }
CompositeExample class >> example2WithInterface [
VisualObserver observe:  self example2 
]

{ #category : 'examples' }
CompositeExample class >> example3 [
"self example3"
"Hierarchical example"

|aComposite|
aComposite := Composite id:100.
aComposite add: DroneExample example3 .
aComposite add: self example2 .
^aComposite 
]
