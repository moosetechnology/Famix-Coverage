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

	^ coverageData sum: [ :data | data coveredCount ]
]

{ #category : 'metrics' }
FamixUnitCoverageReport >> coveredRatio [

	^ (coverageData sum: [ :data | data coveredRatio ]) asFloat
]

{ #category : 'adding' }
FamixUnitCoverageReport >> forClass: aClassName mergeCoverage: data [

	self coverageData
		at: aClassName
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
