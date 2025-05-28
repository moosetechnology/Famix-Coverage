Class {
	#name : 'FamixUnitCoverageData',
	#superclass : 'Object',
	#instVars : [
		'probes',
		'coveredClass',
		'probeCount'
	],
	#category : 'Famix-Coverage-Unit',
	#package : 'Famix-Coverage-Unit'
}

{ #category : 'instance creation' }
FamixUnitCoverageData class >> probes: probes count: probeCount for: class [

	^ self new
		  probes: probes;
		  probeCount: probeCount;
		  coveredClass: class
]

{ #category : 'accessing' }
FamixUnitCoverageData >> addProbe: aBoolean [

	| byteIndex |
	byteIndex := probeCount // 8 + 1.
	probeCount := probeCount + 1.

	byteIndex > probes size
		ifTrue: [ probes := probes copyWith: aBoolean asInteger ]
		ifFalse: [ self probeAt: probeCount put: aBoolean ].

	^ aBoolean
]

{ #category : 'accessing' }
FamixUnitCoverageData >> coveredClass [

	^ coveredClass
]

{ #category : 'accessing' }
FamixUnitCoverageData >> coveredClass: aFamixClass [

	coveredClass := aFamixClass
]

{ #category : 'metrics' }
FamixUnitCoverageData >> coveredCount [
	"Cheeky fast and memory efficient counting of set bits"

	| nibbleLookup |
	nibbleLookup := #( 0 1 1 2 1 2 2 3 1 2 2 3 2 3 3 4 ).
	^ probes sum: [ :byte |
		  (nibbleLookup at: 1 + (byte bitAnd: 16r0F))
		  + (nibbleLookup at: 1 + (byte bitShift: -4)) ]
]

{ #category : 'metrics' }
FamixUnitCoverageData >> coveredRatio [

	^ (Fraction numerator: self coveredCount denominator: probeCount)
		  reduced
]

{ #category : 'operations' }
FamixUnitCoverageData >> mergeWith: data [

	1 to: probes size do: [ :i |
		probes at: i put: ((probes at: i) bitOr: (data probes at: i)) ]
]

{ #category : 'printing' }
FamixUnitCoverageData >> printOn: stream [

	stream nextPutAll: 'Cov('.
	stream nextPutAll:
		(coveredClass ifNil: [ '<Unknown>' ] ifNotNil: [ coveredClass name ]).
	stream nextPutAll: ')='.
	self coveredCount printOn: stream.
	stream nextPut: $/.
	probeCount printOn: stream
]

{ #category : 'accessing' }
FamixUnitCoverageData >> probeAt: index [

	(index between: 1 and: probeCount) ifFalse: [
		self errorSubscriptBounds: index ].
	^ ((probes at: index - 1 // 8 + 1) bitAnd:
		   (1 bitShift: index - 1 \\ 8)) ~= 0
]

{ #category : 'accessing' }
FamixUnitCoverageData >> probeAt: index put: aBoolean [

	| byteIndex bitIndex byte mask |
	(index between: 1 and: probeCount) ifFalse: [
		self errorSubscriptBounds: index ].
	byteIndex := index - 1 // 8 + 1. "1-based byte index"
	bitIndex := index - 1 \\ 8. "0-based bit index"
	byte := probes at: byteIndex.
	mask := 1 bitShift: bitIndex.
	probes at: byteIndex put: (aBoolean
			 ifTrue: [ byte bitOr: mask ]
			 ifFalse: [ byte bitClear: mask ]).
	^ aBoolean
]

{ #category : 'accessing' }
FamixUnitCoverageData >> probeCount [

	^ probeCount
]

{ #category : 'accessing' }
FamixUnitCoverageData >> probeCount: anInteger [

	probeCount := anInteger
]

{ #category : 'accessing' }
FamixUnitCoverageData >> probes [

	^ probes
]

{ #category : 'accessing' }
FamixUnitCoverageData >> probes: aByteArray [

	probes := aByteArray
]
