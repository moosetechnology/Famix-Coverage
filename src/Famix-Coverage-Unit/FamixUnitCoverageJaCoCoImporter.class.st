Class {
	#name : 'FamixUnitCoverageJaCoCoImporter',
	#superclass : 'FamixUnitCoverageImporter',
	#category : 'Famix-Coverage-Unit',
	#package : 'Famix-Coverage-Unit'
}

{ #category : 'testing' }
FamixUnitCoverageJaCoCoImporter >> canReadFormatVersion: aByte [
	"From JaCoCo 0.8.12"

	^ aByte = 16r1007
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
FamixUnitCoverageJaCoCoImporter >> isMagicNumber: anInteger [

	^ anInteger = 16rC0C0
]

{ #category : 'testing' }
FamixUnitCoverageJaCoCoImporter >> isSessionInfoBlock: aByte [

	^ aByte = 16r10
]

{ #category : 'reading' }
FamixUnitCoverageJaCoCoImporter >> readBlock: type [

	(self isBlockHeader: type) ifTrue: [ ^ self readHeader ].
	(self isSessionInfoBlock: type) ifTrue: [ ^ self readSessionInfo ].
	(self isExecutionDataBlock: type) ifTrue: [ ^ self readExecutionData ].
	self error: 'Unknown block type'
]

{ #category : 'reading' }
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

{ #category : 'reading' }
FamixUnitCoverageJaCoCoImporter >> readDateAndTime [
	"Read uint64 representing the date as an offset to the Unix epoch in ms"

	^ DateAndTime unixEpoch + self readLong milliSeconds
]

{ #category : 'reading' }
FamixUnitCoverageJaCoCoImporter >> readExecutionData [

	| className coveredClass probeCount |
	readStream skip: 8. "skip id (uint64)"
	className := self readUTF copyReplaceAll: '/' with: '.'.
	probeCount := self readProbeCount.

	(self shouldInclude: className) ifFalse: [
		readStream skip: probeCount - 1 // 8 + 1.
		^ self ].

	coveredClass := entityFinder findTypeNamed: className.
	(skipUnknownClasses and: [ coveredClass isNil ]) ifTrue: [
		readStream skip: probeCount - 1 // 8 + 1.
		^ self ].

	self report
		mergeCoverage: (FamixUnitCoverageData
				 probes: (self readProbes: probeCount)
				 count: probeCount
				 for: coveredClass)
		of: className
]

{ #category : 'reading' }
FamixUnitCoverageJaCoCoImporter >> readHeader [

	(self isMagicNumber: readStream uint16) ifFalse: [
		self error: 'Invalid execution data' ].
	(self canReadFormatVersion: readStream uint16) ifFalse: [
		self error: 'Incompatible format version' ]
]

{ #category : 'reading' }
FamixUnitCoverageJaCoCoImporter >> readLong [

	^ (readStream uint32 bitShift: 32) + readStream uint32
]

{ #category : 'reading' }
FamixUnitCoverageJaCoCoImporter >> readProbeCount [
	"Encoded as a variable-length integer"

	| probeCount |
	probeCount := 16rFF bitAnd: readStream next.
	(probeCount bitAnd: 16r80) == 0 ifTrue: [ ^ probeCount ].
	^ (probeCount bitAnd: 16r7F) bitOr: (self readProbeCount bitShift: 7)
]

{ #category : 'reading' }
FamixUnitCoverageJaCoCoImporter >> readProbes: count [
	"Extract the bytes directly, the probes are stored as a bitset"

	"Implementation if we wanted a boolean array:
	| probes buffer |
	probes := Array new: count.
	buffer := 0.
	0 to: count - 1 do: [ :i |
		i \\ 8 = 0 ifTrue: [ buffer := readStream next ].
		probes at: i + 1 put: (buffer bitAnd: 1) = 1.
		buffer := buffer bitShift: -1 ].
	^ probes"

	^ count = 0
		  ifTrue: [ #[  ] ]
		  ifFalse: [ readStream next: count - 1 // 8 + 1 ]
]

{ #category : 'reading' }
FamixUnitCoverageJaCoCoImporter >> readSessionInfo [
	"This is how we would read it if we actually cared.
	self report
		newSessionInfo: self readUTF
		startTime: self readDateAndTime
		dumpTime: self readDateAndTime"

	readStream skip: readStream uint16 + 16
]

{ #category : 'reading' }
FamixUnitCoverageJaCoCoImporter >> readUTF [
	"Read an UTF8 string, its size is encoded in the first two bytes"

	| size buffer |
	size := readStream uint16.
	buffer := String new: size.
	ZnUTF8Encoder default
		readInto: buffer
		startingAt: 1
		count: size
		fromStream: readStream.
	^ buffer
]
