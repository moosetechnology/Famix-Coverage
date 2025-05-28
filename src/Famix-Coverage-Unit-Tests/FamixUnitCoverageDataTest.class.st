Class {
	#name : 'FamixUnitCoverageDataTest',
	#superclass : 'TestCase',
	#instVars : [
		'data'
	],
	#category : 'Famix-Coverage-Unit-Tests',
	#package : 'Famix-Coverage-Unit-Tests'
}

{ #category : 'asserting' }
FamixUnitCoverageDataTest >> assertOnlyProbeSet: index [

	1 to: data probeCount do: [ :i |
		i = index
			ifTrue: [ self assert: (data probeAt: i) ]
			ifFalse: [ self deny: (data probeAt: i) ] ]
]

{ #category : 'asserting' }
FamixUnitCoverageDataTest >> assertOnlyProbeUnset: index [

	1 to: data probeCount do: [ :i |
		i = index
			ifTrue: [ self deny: (data probeAt: i) ]
			ifFalse: [ self assert: (data probeAt: i) ] ]
]

{ #category : 'running' }
FamixUnitCoverageDataTest >> setUp [

	super setUp.
	data := FamixUnitCoverageData new
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testAddProbe [

	data probes: #[  ].
	data probeCount: 0.

	data addProbe: true.

	self assert: data probeCount equals: 1.
	self assert: (data probeAt: 1)
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testAddProbeFalse [

	data probes: (ByteArray with: 1).
	data probeCount: 1.

	data addProbe: false.

	self assert: data probeCount equals: 2.
	self assert: data probes equals: #[ 1 ]
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testAddProbeLastBit [

	data probes: (ByteArray with: 0).
	data probeCount: 7.

	data addProbe: true.

	self assert: data probes equals: #[ 128 ]
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testAddProbeNewByte [

	data probes: (ByteArray with: 0).
	data probeCount: 8.

	data addProbe: true.

	self assert: data probes equals: #[ 0 1 ]
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testAddProbeToByte [

	data probes: (ByteArray with: 0).
	data probeCount: 1.

	data addProbe: true.

	self assert: data probeCount equals: 2.
	self deny: (data probeAt: 1).
	self assert: (data probeAt: 2)
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testAddProbeTrue [

	data probes: (ByteArray with: 1).
	data probeCount: 1.

	data addProbe: true.

	self assert: data probeCount equals: 2.
	self assert: data probes equals: #[ 3 ]
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testProbeAt [

	data probes: #[ 1 ].
	data probeCount: 1.

	self assert: (data probeAt: 1)
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testProbeAtAcrossBytes [

	data probes: #[ 0 1 ].
	data probeCount: 9.

	self assert: (data probeAt: 9) equals: true
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testProbeAtByteSet [

	data probes: #[ 255 ].
	data probeCount: 8.

	1 to: 8 do: [ :i | self assert: (data probeAt: i) ]
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testProbeAtByteUnset [

	data probes: #[ 0 ].
	data probeCount: 8.

	1 to: 8 do: [ :i | self deny: (data probeAt: i) ]
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testProbeAtOutOfBounds [

	data probes: #[  ].
	data probeCount: 0.

	self should: [ data probeAt: 1 ] raise: SubscriptOutOfBounds
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testProbeAtPut [

	data probes: (ByteArray with: 0).
	data probeCount: 8.

	data probeAt: 3 put: true.

	self assertOnlyProbeSet: 3
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testProbeAtPutAcrossBytes [

	data probes: (ByteArray with: 0 with: 0).
	data probeCount: 16.

	data probeAt: 9 put: true.

	self assertOnlyProbeSet: 9
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testProbeAtPutFirstBitInByte [

	data probes: (ByteArray with: 0).
	data probeCount: 8.

	data probeAt: 1 put: true. "Last bit"

	self assertOnlyProbeSet: 1
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testProbeAtPutLastBitInByte [

	data probes: (ByteArray with: 0).
	data probeCount: 8.

	data probeAt: 8 put: true.

	self assertOnlyProbeSet: 8
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testProbeAtPutResetBit [

	data probes: (ByteArray with: 255). "All bits set"
	data probeCount: 8.

	data probeAt: 4 put: false.

	self assertOnlyProbeUnset: 4
]

{ #category : 'tests' }
FamixUnitCoverageDataTest >> testProbeAtUnsetBit [

	data probes: #[ 1 ].
	data probeCount: 2.

	self deny: (data probeAt: 2)
]
