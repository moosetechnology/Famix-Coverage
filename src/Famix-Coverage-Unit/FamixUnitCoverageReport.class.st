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

{ #category : 'accessing' }
FamixUnitCoverageReport >> coverageDataFor: aFamixClass add: probes [

	self coverageData
		at: aFamixClass
		ifPresent: [ :data | self merge: data with: probes ]
		ifAbsentPut: probes
]

{ #category : 'lattice' }
FamixUnitCoverageReport >> merge: probes with: newProbes [

	self assert: probes size = newProbes size.
	1 to: probes size do: [ :i |
		probes at: i put: ((probes at: i) and: [ newProbes at: i ]) ]
]

{ #category : 'accessing' }
FamixUnitCoverageReport >> rootMethod [

	^ rootMethod
]

{ #category : 'accessing' }
FamixUnitCoverageReport >> rootMethod: aFamixTMethod [

	rootMethod := aFamixTMethod
]
