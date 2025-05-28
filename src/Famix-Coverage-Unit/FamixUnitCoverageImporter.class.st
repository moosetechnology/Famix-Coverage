Class {
	#name : 'FamixUnitCoverageImporter',
	#superclass : 'Object',
	#instVars : [
		'report',
		'entityFinder',
		'readStream',
		'whiteList',
		'skipUnknownClasses'
	],
	#category : 'Famix-Coverage-Unit',
	#package : 'Famix-Coverage-Unit'
}

{ #category : 'accessing' }
FamixUnitCoverageImporter >> entityFinder [

	^ entityFinder
]

{ #category : 'accessing' }
FamixUnitCoverageImporter >> entityFinder: anEntityFinder [

	entityFinder := anEntityFinder
]

{ #category : 'importing' }
FamixUnitCoverageImporter >> importCoverage: coverage ofMethod: aFamixMethod [

	self initializeNewReport.
	self report rootMethod: aFamixMethod.

	readStream := coverage readStream.
	self readCoverage.
	readStream := nil.

	aFamixMethod
		cacheAt: #unitCoverageReports
		ifPresent: [ :reports | reports add: self report ]
		ifAbsentPut: [ OrderedCollection with: self report ].

	^ self report
]

{ #category : 'initialization' }
FamixUnitCoverageImporter >> initialize [

	skipUnknownClasses := true
]

{ #category : 'initialization' }
FamixUnitCoverageImporter >> initializeNewReport [

	report := FamixUnitCoverageReport new
]

{ #category : 'reading' }
FamixUnitCoverageImporter >> readCoverage [

	self subclassResponsibility
]

{ #category : 'accessing' }
FamixUnitCoverageImporter >> report [

	^ report ifNil: [ self initializeNewReport ]
]

{ #category : 'accessing' }
FamixUnitCoverageImporter >> report: aFamixUnitCoverageReport [

	report := aFamixUnitCoverageReport
]

{ #category : 'testing' }
FamixUnitCoverageImporter >> shouldInclude: className [

	^ self whiteList ifEmpty: [ true ] ifNotEmpty: [ :list |
		  list anySatisfy: [ :pattern | className matchesRegex: pattern ] ]
]

{ #category : 'accessing' }
FamixUnitCoverageImporter >> skipUnknownClasses [

	^ skipUnknownClasses
]

{ #category : 'accessing' }
FamixUnitCoverageImporter >> skipUnknownClasses: aBoolean [

	skipUnknownClasses := aBoolean
]

{ #category : 'accessing' }
FamixUnitCoverageImporter >> whiteList [

	^ whiteList ifNil: [ whiteList := #(  ) ]
]

{ #category : 'accessing' }
FamixUnitCoverageImporter >> whiteList: aStringCollection [

	whiteList := aStringCollection
]
