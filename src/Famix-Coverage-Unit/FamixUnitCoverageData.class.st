"
FamixUnitCoverageData represents coverage data for a single class using an array of probes.

Each probe corresponds to an instrumentation point determined by a specific coverage tool, such as a line, statement, or expression.
This class does not rely on the meaning of each probe.
Instead, it treats probes as abstract, indexable units.

Language- and tool-agnostic processing is possible because, during any given coverage analysis, a single tool is used consistently.
For a given version of a class, the number and order of probes are fixed under that tool.

This normalization allows us to reason about coverage using standard set operations.
A test covers a subset of probes.
A suite covers the union of its tests' probes.
Coverage comparison and test selection can therefore be formulated as set inclusion, union, and cardinality.

Internally, these sets are represented using a bitset, and manipulated using bitwise operations for efficiency.
"
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

{ #category : 'comparing' }
FamixUnitCoverageData >> coverageEquals: otherCoverage [

	^ probeCount = otherCoverage probeCount and: [
		  probes = otherCoverage probes ]
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
	"Cheeky fast and memory efficient counting of set bits, i.e., the cardinality"

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

	| byteIndex byte mask |
	(index between: 1 and: probeCount) ifFalse: [
		self errorSubscriptBounds: index ].

	byteIndex := index - 1 // 8 + 1.
	byte := probes at: byteIndex.
	mask := 1 bitShift: index - 1 \\ 8.
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
