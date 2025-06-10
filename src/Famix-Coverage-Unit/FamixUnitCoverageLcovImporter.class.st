"
Importer for [lcov](https://github.com/linux-test-project/lcov) coverage data.
This format is available with [smalltalkCI](https://github.com/hpi-swa/smalltalkCI).
Lcov has the following format:
```text
TN    Test Name              string that can be empty
SF    Source File            path string
DA    DAta                   line number, hit count
LF    Lines Found            number
LH    Lines Hit              number
BRDA  BRanch DAta            line, block, (expressions, count)+
BRF   BRanches Found         number
FN    Function Name          line number, name string
FNF   Function Number Found  number
FNH   Function Number Hit    number
```
We really only care about SF, which gives the class, and DA, which gives the probes.
Everything else is simply ignored.
"
Class {
	#name : 'FamixUnitCoverageLcovImporter',
	#superclass : 'FamixUnitCoverageAbstractImporter',
	#instVars : [
		'currentType',
		'currentData'
	],
	#category : 'Famix-Coverage-Unit',
	#package : 'Famix-Coverage-Unit'
}

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readBranchData [
	"Ignored"

	readStream nextLine
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readBranchesFound [
	"Ignored"

	readStream nextLine
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readCoverage [
	"Stop when exhausting the stream or reading the 'end_of_coverage' line"

	[ readStream atEnd ] whileFalse: [ self readLine ]
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readData [

	| line hitCount |
	line := readStream nextLine.
	hitCount := (line copyAfter: $,) asInteger.
	currentData addProbe: hitCount > 0
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readEndOfRecord [

	readStream nextLine. "Consume and ignore the line"
	self report mergeCoverage: currentData of: currentType name
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readFunctionName [
	"Ignored"

	readStream nextLine
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readFunctionNumberFound [
	"Ignored"

	readStream nextLine
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readFunctionNumberHit [
	"Ignored"

	readStream nextLine
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readLine [
	"Look at the class comment to see all possible kind of lines."

	| hint |
	hint := readStream next. "First token"
	hint isSeparator ifTrue: [ "Empty line" ^ self ].
	hint = $e ifTrue: [ ^ self readEndOfRecord ].
	hint = $T ifTrue: [
		readStream skip: 2.
		^ self readTestName ].
	hint = $S ifTrue: [
		readStream skip: 2.
		^ self readSourceFile ].
	hint = $D ifTrue: [
		readStream skip: 2.
		^ self readData ].

	hint := readStream next. "Second token"
	hint = $F ifTrue: [
		readStream skip: 1.
		^ self readLinesFound ].
	hint = $H ifTrue: [
		readStream skip: 1.
		^ self readLinesHit ].
	hint = $R ifTrue: [
		^ readStream read = $D
			  ifTrue: [
				  readStream skip: 2.
				  self readBranchData ]
			  ifFalse: [
				  readStream skip: 1.
				  self readBranchesFound ] ].

	hint := readStream next. "Third token"
	hint = $: ifTrue: [ ^ self readFunctionName ].
	hint = $F ifTrue: [
		readStream skip: 1.
		^ self readFunctionNumberFound ].
	hint = $H ifTrue: [
		readStream skip: 1.
		^ self readFunctionNumberHit ].

	self error: 'Incorrect lcov data'
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readLinesFound [
	"Ignored"

	readStream nextLine
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readLinesHit [
	"Ignored"

	readStream nextLine
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readSourceFile [

	| line typeName |
	line := readStream nextLine.
	typeName := line
		            copyFrom: (line lastIndexOf: $/) + 1
		            to: line size - '.class.st' size.

	currentType := entityFinder findTypeNamed: typeName.
	currentData := FamixUnitCoverageData
		               probes: ByteArray new
		               count: 0
		               for: currentType
]

{ #category : 'reading' }
FamixUnitCoverageLcovImporter >> readTestName [
	"Ignored"

	readStream nextLine
]
