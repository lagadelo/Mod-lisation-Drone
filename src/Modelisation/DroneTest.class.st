Class {
	#name : 'DroneTest',
	#superclass : 'TestCase',
	#category : 'Modelisation-Testing',
	#package : 'Modelisation',
	#tag : 'Testing'
}

{ #category : 'tests' }
DroneTest class >> testMove [

| tmp1 tmp |
tmp := DroneExample example1.
tmp1 := DroneExample example1.
tmp moveBy: (G3DCoordinates x:10 y:10 z:10).
self deny:    tmp position equals: tmp1 position .
]

{ #category : 'tests' }
DroneTest class >> testNamed [ 
ModelisationExample example2
]

{ #category : 'tests' }
DroneTest >> testAdd [


Fleet reset.
200 timesRepeat:[DroneExample example3].
self assert: Fleet new elements size = 200.
self assert: (Fleet new elements collect:[:a| a id])asSet size = 200.

]

{ #category : 'tests' }
DroneTest >> testMove [

| tmp1 tmp |
tmp := DroneExample example1.
tmp1 := DroneExample example1.
tmp moveBy: (G3DCoordinates x:10 y:10 z:10).
self deny:    tmp position equals: tmp1 position.
self assert: tmp position x  equals: tmp1 position x + 10.
]

{ #category : 'tests' }
DroneTest >> testNamed [ 

self should: [ModelisationExample example2 ]  raise: MessageNotUnderstood
]

{ #category : 'tests' }
DroneTest >> testPreventMaliciousAdding [

| tmp3 tmp2 |
Fleet reset.
tmp2 := Drone new  initialize. 
tmp2 assignID. tmp2 wrongID. tmp2 finalize.
self assert: Fleet new elements size = 0.
tmp3 := Drone new  initialize. 
tmp3 assignID. tmp3 wrongID2. tmp3 finalize.
self assert: Fleet new elements size = 0.

]

{ #category : 'tests' }
DroneTest >> testSingleton [ 

self assert: Fleet new == Fleet new
]
