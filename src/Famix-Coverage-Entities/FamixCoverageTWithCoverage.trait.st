"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `branchCoverage` | `Number` | nil | |
| `classCoverage` | `Number` | nil | |
| `complexity` | `Number` | nil | |
| `instructionCoverage` | `Number` | nil | |
| `lineCoverage` | `Number` | nil | |
| `methodCoverage` | `Number` | nil | |

"
Trait {
	#name : #FamixCoverageTWithCoverage,
	#instVars : [
		'#instructionCoverage => FMProperty',
		'#branchCoverage => FMProperty',
		'#lineCoverage => FMProperty',
		'#complexity => FMProperty',
		'#methodCoverage => FMProperty',
		'#classCoverage => FMProperty'
	],
	#category : #'Famix-Coverage-Entities-Traits'
}

{ #category : #meta }
FamixCoverageTWithCoverage classSide >> annotation [

	<FMClass: #TWithCoverage super: #Object>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> branchCoverage [

	<FMProperty: #branchCoverage type: #Number>
	<generated>
	^ branchCoverage
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> branchCoverage: anObject [
	<generated>
	branchCoverage := anObject
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> classCoverage [

	<FMProperty: #classCoverage type: #Number>
	<generated>
	^ classCoverage
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> classCoverage: anObject [
	<generated>
	classCoverage := anObject
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> complexity [

	<FMProperty: #complexity type: #Number>
	<generated>
	^ complexity
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> complexity: anObject [
	<generated>
	complexity := anObject
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> instructionCoverage [

	<FMProperty: #instructionCoverage type: #Number>
	<generated>
	^ instructionCoverage
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> instructionCoverage: anObject [
	<generated>
	instructionCoverage := anObject
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> lineCoverage [

	<FMProperty: #lineCoverage type: #Number>
	<generated>
	^ lineCoverage
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> lineCoverage: anObject [
	<generated>
	lineCoverage := anObject
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> methodCoverage [

	<FMProperty: #methodCoverage type: #Number>
	<generated>
	^ methodCoverage
]

{ #category : #accessing }
FamixCoverageTWithCoverage >> methodCoverage: anObject [
	<generated>
	methodCoverage := anObject
]
