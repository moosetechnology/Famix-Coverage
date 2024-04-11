"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `lines` | `FamixCoverageFile` | `file` | `FamixCoverageLine` | |


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
| `path` | `String` | nil | |

"
Class {
	#name : #FamixCoverageFile,
	#superclass : #FamixCoverageEntity,
	#traits : 'FamixCoverageTWithCoverage',
	#classTraits : 'FamixCoverageTWithCoverage classTrait',
	#instVars : [
		'#path => FMProperty',
		'#lines => FMMany type: #FamixCoverageLine opposite: #file'
	],
	#category : #'Famix-Coverage-Entities-Entities'
}

{ #category : #meta }
FamixCoverageFile class >> annotation [

	<FMClass: #File super: #FamixCoverageEntity>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixCoverageFile >> addLine: anObject [
	<generated>
	^ self lines add: anObject
]

{ #category : #accessing }
FamixCoverageFile >> lines [
	"Relation named: #lines type: #FamixCoverageLine opposite: #file"

	<generated>
	<derived>
	^ lines
]

{ #category : #accessing }
FamixCoverageFile >> lines: anObject [

	<generated>
	lines value: anObject
]

{ #category : #accessing }
FamixCoverageFile >> path [

	<FMProperty: #path type: #String>
	<generated>
	^ path
]

{ #category : #accessing }
FamixCoverageFile >> path: anObject [
	<generated>
	path := anObject
]
