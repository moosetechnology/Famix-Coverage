Class {
	#name : 'FamixUnitCoverageReport',
	#superclass : 'Object',
	#instVars : [
		'rootMethod',
		'coverageData'
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

{ #category : 'metrics' }
FamixUnitCoverageReport >> coveredCount [
	"Total number of covered probes"

	^ coverageData sum: [ :data | data coveredCount ]
]

{ #category : 'metrics' }
FamixUnitCoverageReport >> coveredRatio [

	| numerator denominator |
	numerator := denominator := 0.
	coverageData do: [ :data |
		numerator := numerator + data coveredCount.
		denominator := denominator + data probeCount ].
	^ (Fraction numerator: numerator denominator: denominator) reduced
]

{ #category : 'adding' }
FamixUnitCoverageReport >> mergeCoverage: data of: className [

	self coverageData
		at: className
		ifPresent: [ :existing | existing mergeWith: data ]
		ifAbsentPut: data
]

{ #category : 'accessing' }
FamixUnitCoverageReport >> rootMethod [

	^ rootMethod
]

{ #category : 'accessing' }
FamixUnitCoverageReport >> rootMethod: aFamixTMethod [

	rootMethod := aFamixTMethod
]

{ #category : 'accessing' }
FamixUnitCoverageReport >> totalCount [
	"Total number of probes to cover"

	^ coverageData sum: [ :data | data probeCount ]
]
