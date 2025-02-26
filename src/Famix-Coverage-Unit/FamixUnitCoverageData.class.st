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

	| byteIndex bitIndex |
	(index between: 1 and: probeCount) ifFalse: [
		self errorSubscriptBounds: index ].
	byteIndex := index // 8 + 1.
	bitIndex := index \\ 8.
	probes at: byteIndex put: (aBoolean
			 ifTrue: [ (probes at: byteIndex) bitOr: (1 bitShift: bitIndex) ]
			 ifFalse: [
			 	(probes at: byteIndex) bitAnd: (16rFE bitShift: bitIndex) ]).
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
