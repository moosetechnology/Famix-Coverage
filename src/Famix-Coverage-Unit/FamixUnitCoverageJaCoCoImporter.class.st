Class {
	#name : 'FamixUnitCoverageJaCoCoImporter',
	#superclass : 'Object',
	#instVars : [
		'report',
		'entityFinder',
		'readStream'
	],
	#category : 'Famix-Coverage-Unit',
	#package : 'Famix-Coverage-Unit'
}

{ #category : 'testing' }
FamixUnitCoverageJaCoCoImporter >> canReadFormatVersion: aByte [
	"From JaCoCo 0.8.12"

	^ aByte = 16r1007
]

{ #category : 'accessing' }
FamixUnitCoverageJaCoCoImporter >> entityFinder [

	^ entityFinder
]

{ #category : 'accessing' }
FamixUnitCoverageJaCoCoImporter >> entityFinder: anEntityFinder [

	entityFinder := anEntityFinder
]

{ #category : 'importing' }
FamixUnitCoverageJaCoCoImporter >> importCoverage: coverage ofMethod: aFamixMethod [

	self initializeNewReport.
	self report rootMethod: aFamixMethod.

	readStream := coverage readStream.
	self readCoverage.
	readStream := nil.

	aFamixMethod
		cacheAt: #unitCoverageReport
		ifPresent: [ :reports | reports add: self report ]
		ifAbsentPut: [ OrderedCollection with: self report ].

	^ self report
]

{ #category : 'initialization' }
FamixUnitCoverageJaCoCoImporter >> initializeNewReport [

	report := FamixUnitCoverageReport new
]

{ #category : 'testing' }
FamixUnitCoverageJaCoCoImporter >> isBlockHeader: aByte [

	^ aByte = 16r01
]

{ #category : 'testing' }
FamixUnitCoverageJaCoCoImporter >> isExecutionDataBlock: aByte [

	^ aByte = 16r11
]

{ #category : 'testing' }
FamixUnitCoverageJaCoCoImporter >> isMagicNumber: aByte [

	^ aByte = 16rC0C0
]

{ #category : 'testing' }
FamixUnitCoverageJaCoCoImporter >> isSessionInfoBlock: aByte [

	^ aByte = 16r10
]

{ #category : 'private - decoding' }
FamixUnitCoverageJaCoCoImporter >> readBlock: type [

	(self isBlockHeader: type) ifTrue: [ ^ self readHeader ].
	(self isSessionInfoBlock: type) ifTrue: [ ^ self readSessionInfo ].
	(self isExecutionDataBlock: type) ifTrue: [ ^ self readExecutionData ].
	self error: 'Unknown block type'
]

{ #category : 'private - decoding' }
FamixUnitCoverageJaCoCoImporter >> readCoverage [

	| firstBlock |
	firstBlock := true.
	[
	| type |
	type := readStream next.
	(firstBlock and: [ (self isBlockHeader: type) not ]) ifTrue: [
		self error: 'Invalid execution data' ].
	firstBlock := false.
	self readBlock: type.
	readStream atEnd ] whileFalse
]

{ #category : 'as yet unclassified' }
FamixUnitCoverageJaCoCoImporter >> readExecutionData [

	| id nameSize name probeCount probes buffer |
	id := (readStream uint32 bitShift: 32) + readStream uint32.

	nameSize := readStream uint16.
	name := String new: nameSize.
	ZnUTF8Encoder default
		readInto: name
		startingAt: 1
		count: nameSize
		fromStream: readStream.

	probeCount := self readProbeCount.
	probes := Array new: probeCount.
	buffer := 0.
	0 to: probeCount - 1 do: [ :i |
		i % 8 = 0 ifTrue: [ buffer := readStream next ].
		probes at: i + 1 put: (buffer bitAnd: 1) ~= 0.
		buffer := buffer bitShift: -1 ].

	self report coverageDataFor: name add: probes
]

{ #category : 'private - decoding' }
FamixUnitCoverageJaCoCoImporter >> readHeader [

	(self isMagicNumber: readStream uint16) ifFalse: [
		self error: 'Invalid execution data' ].
	(self canReadFormatVersion: readStream uint16) ifFalse: [
		self error: 'Incompatible format version' ]
]

{ #category : 'as yet unclassified' }
FamixUnitCoverageJaCoCoImporter >> readProbeCount [
	"Encoded as a variable-length integer"

	| probeCount |
	probeCount := 16rFF bitAnd: readStream next.
	(probeCount bitAnd: 16r80) == 0 ifTrue: [ ^ probeCount ].
	^ (probeCount bitAnd: 16r7F) bitOr: (self readProbeCount bitShift: 7)
]

{ #category : 'private - decoding' }
FamixUnitCoverageJaCoCoImporter >> readSessionInfo [
	"This is how we would read it if we actually cared.
	| idSize id start dump |
	idSize := readStream uint16.
	id := String new: idSize.
	ZnUTF8Encoder default
		readInto: id
		startingAt: 1
		count: idSize
		fromStream: readStream.

	start := (readStream uint32 bitShift: 32) + readStream uint32.
	start := DateAndTime unixEpoch + start milliSeconds.

	dump := (readStream uint32 bitShift: 32) + readStream uint32.
	dump := DateAndTime unixEpoch + dump milliSeconds.

	self report newSessionInfo: id startTime: start dumpTime: dump"

	readStream next: readStream uint16 + 16
]

{ #category : 'accessing' }
FamixUnitCoverageJaCoCoImporter >> report [

	^ report ifNil: [ self initializeNewReport ]
]

{ #category : 'accessing' }
FamixUnitCoverageJaCoCoImporter >> report: aFamixUnitCoverageReport [

	report := aFamixUnitCoverageReport
]
