"
FamixUnitCoverageImporter is an abstract class for importing coverage data into `FamixUnitCoverageReport` instances.

Subclasses are responsible for parsing coverage data from specific formats (e.g., JaCoCo, lcov).
The importer uses an entity finder to resolve class names to Famix classes in the model.

Coverage data often includes noise unrelated to the target program, such as instrumented native code or external libraries.
To address this, importers can use a whitelist to restrict coverage to a subset of class name patterns.

Unknown classes, meaning classes present in the coverage data but not resolvable via the entity finder, can optionally be ignored by sending `skipUnknownClasses: true`.
This helps with the noise previously mentioned, and makes the importer tolerant to incomplete or partial models.
"
Class {
	#name : 'FamixUnitCoverageAbstractImporter',
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

{ #category : 'testing' }
FamixUnitCoverageAbstractImporter class >> isAbstract [

	^ self == FamixUnitCoverageAbstractImporter
]

{ #category : 'accessing' }
FamixUnitCoverageAbstractImporter >> entityFinder [

	^ entityFinder
]

{ #category : 'accessing' }
FamixUnitCoverageAbstractImporter >> entityFinder: anEntityFinder [

	entityFinder := anEntityFinder
]

{ #category : 'importing' }
FamixUnitCoverageAbstractImporter >> importCoverage: coverage ofMethod: aFamixMethod [

	self initializeNewReport.
	self report rootMethod: aFamixMethod.

	self readCoverageFrom: coverage.

	aFamixMethod
		cacheAt: #unitCoverageReports
		ifPresent: [ :reports | reports add: self report ]
		ifAbsentPut: [ OrderedCollection with: self report ].

	^ self report
]

{ #category : 'initialization' }
FamixUnitCoverageAbstractImporter >> initialize [

	skipUnknownClasses := true
]

{ #category : 'initialization' }
FamixUnitCoverageAbstractImporter >> initializeNewReport [

	report := FamixUnitCoverageReport new
]

{ #category : 'reading' }
FamixUnitCoverageAbstractImporter >> readCoverage [

	self subclassResponsibility
]

{ #category : 'importing' }
FamixUnitCoverageAbstractImporter >> readCoverageFrom: coverage [

	readStream := coverage readStream.
	[ self readCoverage ] ensure: [
		readStream close.
		readStream := nil ]
]

{ #category : 'accessing' }
FamixUnitCoverageAbstractImporter >> report [

	^ report ifNil: [ self initializeNewReport ]
]

{ #category : 'accessing' }
FamixUnitCoverageAbstractImporter >> report: aFamixUnitCoverageReport [

	report := aFamixUnitCoverageReport
]

{ #category : 'testing' }
FamixUnitCoverageAbstractImporter >> shouldInclude: className [

	^ self whiteList ifEmpty: [ true ] ifNotEmpty: [ :list |
		  list anySatisfy: [ :pattern | className matchesRegex: pattern ] ]
]

{ #category : 'accessing' }
FamixUnitCoverageAbstractImporter >> skipUnknownClasses [

	^ skipUnknownClasses
]

{ #category : 'accessing' }
FamixUnitCoverageAbstractImporter >> skipUnknownClasses: aBoolean [

	skipUnknownClasses := aBoolean
]

{ #category : 'accessing' }
FamixUnitCoverageAbstractImporter >> whiteList [

	^ whiteList ifNil: [ whiteList := #(  ) ]
]

{ #category : 'accessing' }
FamixUnitCoverageAbstractImporter >> whiteList: aStringCollection [

	whiteList := aStringCollection
]
