"
FamixUnitCoverageReport represents the coverage produced by running all tests associated with a specific method.

The report stores a reference to the tested method, as well as a dictionary mapping each covered class to its `FamixUnitCoverageData`.
This provides a view of how much of each class was exercised by tests targeting the given method.
"
Class {
	#name : 'FamixUnitCoverageReport',
	#superclass : 'Object',
	#instVars : [
		'identifier',
		'rootMethod',
		'coverageData',
		'startTime',
		'dumpTime'
	],
	#category : 'Famix-Coverage-Unit',
	#package : 'Famix-Coverage-Unit'
}

{ #category : 'accessing' }
FamixUnitCoverageReport >> coverageData [

	^ coverageData ifNil: [ coverageData := Dictionary new ]
]

{ #category : 'accessing' }
FamixUnitCoverageReport >> coverageData: aDictionary [

	coverageData := aDictionary
]

{ #category : 'comparing' }
FamixUnitCoverageReport >> coverageEquals: otherReport [
	"Only consider equality of coverage"

	| otherCoverageData |
	otherCoverageData := otherReport coverageData.
	coverageData size = otherCoverageData size ifFalse: [ ^ false ].

	coverageData keysAndValuesDo: [ :testedClass :coverage |
		otherCoverageData
			at: testedClass
			ifPresent: [ :otherCoverage |
				(coverage coverageEquals: otherCoverage) ifFalse: [ ^ false ] ]
			ifAbsent: [ ^ false ] ].
	^ true
]

{ #category : 'metrics' }
FamixUnitCoverageReport >> coveredCount [
	"Total number of covered probes"

	^ coverageData sum: [ :data | data coveredCount ]
]

{ #category : 'metrics' }
FamixUnitCoverageReport >> coveredRatio [

	^ self methodCoverage reduced
]

{ #category : 'merging' }
FamixUnitCoverageReport >> mergeCoverage: data of: className [

	self coverageData
		at: className
		ifPresent: [ :existing | existing mergeWith: data ]
		ifAbsentPut: data
]

{ #category : 'metrics' }
FamixUnitCoverageReport >> methodCoverage [
	"The number of covered methods over the total number of methods"

	| numerator denominator |
	numerator := denominator := 0.
	coverageData do: [ :data |
		numerator := numerator + data coveredCount.
		denominator := denominator + data probeCount ].
	^ Fraction numerator: numerator denominator: denominator
]

{ #category : 'printing' }
FamixUnitCoverageReport >> printOn: stream [

	rootMethod
		ifNil: [ stream nextPut: $? ]
		ifNotNil: [ rootMethod printOn: stream ].
	stream nextPutAll: ' covers '.
	self coveredCount printOn: stream.
	stream nextPut: $/.
	self probeCount printOn: stream.
	stream nextPutAll: ' methods in '.
	(coverageData ifNil: [ 0 ] ifNotNil: [ coverageData size ]) printOn:
		stream.
	stream nextPutAll: ' classes'
]

{ #category : 'accessing' }
FamixUnitCoverageReport >> probeCount [
	"The total number of probes among covered classes"

	^ coverageData sum: [ :data | data probeCount ]
]

{ #category : 'accessing' }
FamixUnitCoverageReport >> rootMethod [

	^ rootMethod
]

{ #category : 'accessing' }
FamixUnitCoverageReport >> rootMethod: aFamixTMethod [

	rootMethod := aFamixTMethod
]
